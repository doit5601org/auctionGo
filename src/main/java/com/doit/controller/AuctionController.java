package com.doit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;

import com.doit.dao.AuctionDAO;
import com.doit.dto.AuctionDTO;
import com.doit.dto.ReportDTO;
import com.doit.dto.ReportTypeDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/auction/*")
public class AuctionController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	private static final int PAGE_SIZE = 12; // 한 페이지당 경매 수

	private AuctionDAO auctionDAO = new AuctionDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		process(req, resp);
	}

	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String uri = req.getRequestURI();
		String method = req.getMethod();
		String ct = req.getContextPath();

		try
		{
			if (uri.endsWith("/auction/list"))
			{
				listAction(req, resp);
			} else if (uri.endsWith("/auction/detail"))
			{
				detailAction(req, resp);
			} else if (uri.endsWith("/auction/report"))
			{
				if ("POST".equalsIgnoreCase(method))
					reportPostAction(req, resp, ct);
				else
					reportFormAction(req, resp);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}

	}

	// 경매 목록
	private void listAction(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, SQLException
	{
		String keyword = req.getParameter("keyword");

		String pageStr = req.getParameter("page");
		int page = 1;

		if (pageStr != null && !pageStr.trim().isEmpty()) {
		    try {
		        page = Integer.parseInt(pageStr);
		    } catch (NumberFormatException e) {
		        page = 1;
		    }
		}
		if (page < 1)
			page = 1;
		int start = (page - 1) * PAGE_SIZE + 1;
		int end = page * PAGE_SIZE;

		int totalCount = auctionDAO.selectAuctionCount(keyword);
		int totalPage = (totalCount <= 0) ? 1 : (totalCount - 1) / PAGE_SIZE + 1;
		List<AuctionDTO> list = auctionDAO.selectAuctionList(start, end, keyword);

		req.setAttribute("auctionList", list);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("currentPage", page);

		req.getRequestDispatcher("/WEB-INF/views/auction/auctionList.jsp").forward(req, resp);
	}

	// 경매 상세
	private void detailAction(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, SQLException
	{
		int auctionId = Integer.parseInt(req.getParameter("auctionId"));
		AuctionDTO auction = auctionDAO.selectAuctionDetail(auctionId);

		if (auction == null)
		{
			resp.sendError(HttpServletResponse.SC_NOT_FOUND, "경매를 찾을 수 없습니다.");
			return;
		}

		Integer userId = getLoginUserId(req);

		// ── viewStatus 결정
		// ongoing_guest : 진행중 + 비로그인
		// ongoing_user : 진행중 + 로그인
		// finished_winner : 마감 + 내가 낙찰자 (낙찰 결과 조회 시 활성화)
		// finished_loser : 마감 + 입찰했지만 낙찰 못함 
		// finished : 마감 + 그 외
		String viewStatus;
		if ("진행중".equals(auction.getIsFinished()))
		{
			viewStatus = (userId == null) ? "ongoing_guest" : "ongoing_user";
		} else
		{
			// TODO: AUCTION_WINNING_RESULT 테이블 조회해서 낙찰자 확인 후
			// finished_winner / finished_loser 분기 구현
			viewStatus = "finished";
		}

		// ── 남은 시간 계산 
		// auctionEndDate 형식: "YYYY-MM-DD HH:MM" (FN_GET_AUCTION_DUE_DATE 반환값)
		long remainSeconds = 0;
		try
		{
			if (auction.getAuctionEndDate() != null && !"-".equals(auction.getAuctionEndDate()))
			{
				DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
				LocalDateTime endDt = LocalDateTime.parse(auction.getAuctionEndDate(), fmt);
				remainSeconds = ChronoUnit.SECONDS.between(LocalDateTime.now(), endDt);
				if (remainSeconds < 0)
					remainSeconds = 0;
			}
		} catch (Exception e)
		{
			remainSeconds = 0; // 파싱 실패 시 0으로
		}

		// ── bidUnit 계산 (FN_GET_BID_UNIT 동일 로직)
		int bidUnit;
		int sp = auction.getStartPrice();
		if (sp < 1_000_000)
			bidUnit = 1_000;
		else if (sp < 10_000_000)
			bidUnit = 10_000;
		else
			bidUnit = 100_000;

		// ── 현재 유저의 입찰 수 (입찰 참여 제한 10개 체크용)
		int activeBidCount = 0;
		if (userId != null && "ongoing_user".equals(viewStatus))
		{
			activeBidCount = auctionDAO.selectActiveBidCount(userId);
		}

		req.setAttribute("auction", auction);
		req.setAttribute("viewStatus", viewStatus);
		req.setAttribute("remainSeconds", remainSeconds);
		req.setAttribute("bidUnit", bidUnit);
		req.setAttribute("bidCount", activeBidCount); // JSP 에서 ${bidCount >= 10} 체크

		req.getRequestDispatcher("/WEB-INF/views/auction/auctionDetail.jsp").forward(req, resp);
	}

	// 경매 신고 (GET )
	private void reportFormAction(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, SQLException
	{
		Integer userId = getLoginUserId(req);
		if (userId == null)
		{
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		int auctionId = Integer.parseInt(req.getParameter("auctionId"));
		AuctionDTO auction = auctionDAO.selectAuctionDetail(auctionId);

		if (auction == null)
		{
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}

		List<ReportTypeDTO> reportTypeList = auctionDAO.selectReportTypeList();

		req.setAttribute("auction", auction);
		req.setAttribute("reportTypeList", reportTypeList);
		req.getRequestDispatcher("/WEB-INF/views/auction/auctionReport.jsp").forward(req, resp);
	}

	// 경매 신고 (POST )
	private void reportPostAction(HttpServletRequest req, HttpServletResponse resp, String ct)
			throws ServletException, IOException, SQLException
	{
		Integer userId = getLoginUserId(req);
		if (userId == null)
		{
			resp.sendRedirect(ct + "/login");
			return;
		}

		int auctionId = Integer.parseInt(req.getParameter("auctionId"));

		ReportDTO dto = new ReportDTO();
		dto.setUserId(userId);
		dto.setReportTypeId(Integer.parseInt(req.getParameter("reportTypeId")));
		dto.setAuctionId(auctionId);
		dto.setReportReason(req.getParameter("reportContent"));

		try
		{
			auctionDAO.insertAuctionReport(dto);
			resp.sendRedirect(ct + "/auction/detail?auctionId=" + auctionId + "&reportOk=1");
		} catch (SQLException e)
		{
			e.printStackTrace();
			{
				throw e;
			}
		}
	}

	// 헬퍼 메서드
	private Integer getLoginUserId(HttpServletRequest req)
	{
		// 테스트용 임시 - 로그인 기능
		return 1;
		/*
		 * 실제 로그인 세션 코드 HttpSession session = req.getSession(false); if (session ==
		 * null) return null; Object obj = session.getAttribute("userId"); if (obj
		 * instanceof Integer) return (Integer) obj; return null;
		 */
	}

	
}
