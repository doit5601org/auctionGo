package com.doit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.doit.dto.AuctionBidParticipationDTO;
import com.doit.dto.AuctionDTO;
import com.doit.service.AdminAuctionService;
import com.doit.util.Pagination;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/auction/*")
public class AdminAuctionController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

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
	
//--------------------------------------------------------------------------------------------------------------------------------------
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String methodType = request.getMethod();
		String uri = request.getRequestURI();
		String path = uri.substring(request.getContextPath().length());
		
		String viewPath = "/WEB-INF/views";
		
		try
		{
			//-- GET 방식 요청 --//
			if (methodType.equalsIgnoreCase("GET"))
			{
				if (path.equalsIgnoreCase("/admin/auction/list"))
				{
					// 이전 페이지 (mainDashBoard.jsp, auctionList.jsp)에서 전달된 데이터 수신
					//-- auctionStatus, page
					String auctionStatus = request.getParameter("auctionStatus") == null ? "all" : request.getParameter("auctionStatus");
					int page = Integer.parseInt(request.getParameter("page") == null ? "1" : request.getParameter("page"));
					
					
					// Service 객체 생성
					AdminAuctionService adminAuctionService  = new AdminAuctionService();
					
					
					// 경매 총 갯수 가져오기
					int auctionTotalCount = adminAuctionService.getAuctionTotalCount(auctionStatus);
					
					// 경매 리스트 가져오기
					int sizePerPage = 10;
					List<AuctionDTO> auctionList = adminAuctionService.getAuctionList(auctionStatus, page, sizePerPage);
					
					// 경매의 페이지 엘리먼트 생성
					Pagination pagination = new Pagination();
					int totalPage = pagination.pageCount(auctionTotalCount, sizePerPage);
					
					String listUrl = uri + "?auctionStatus=" + auctionStatus;
					
					String pageElement = pagination.paging(page, totalPage, listUrl);
					
					
					
					// 데이터 request에 바인딩
					request.setAttribute("auctionStatus", auctionStatus);
					request.setAttribute("auctionTotalCount", auctionTotalCount);
					request.setAttribute("auctionList", auctionList);
					request.setAttribute("pageElement", pageElement);
					
					
					viewPath = viewPath + "/admin/auctionList.jsp";
				}
				// 경매 상세 조회
				else if (path.equalsIgnoreCase("/admin/auction/detail"))
				{
					// 이전 페이지 (admin/auctionList.jsp)에서 전달된 데이터 수신
					//-- auctionId, prevUrl
					int auctionId = Integer.parseInt(request.getParameter("auctionId"));
					String prevUrl = request.getParameter("prevUrl");
					
					
					// Service 객체 생성
					AdminAuctionService adminAuctionService = new AdminAuctionService();
					
					// 경매 상세 정보 가져오기
					AuctionDTO auctionDto = adminAuctionService.getAuctionDetail(auctionId);
					
					
					// request에 데이터 바인딩
					request.setAttribute("auctionDto", auctionDto);
					
					
					// 포워딩 경로 설정
					viewPath = viewPath + "/admin/auctionDetail.jsp";
				}
				
				
				// 경매 상세 조회 > 입찰 이력 총 갯수 가져오기 (AJAX)
				else if (path.equalsIgnoreCase("/admin/auction/ajax/bidCount"))
				{
					// 이전 페이지(admin/auctionDetail.jsp)에서 전달된 데이터 수신
					//-- auctionId
					int auctionId = Integer.parseInt(request.getParameter("auctionId"));
					
					// Service 객체 생성
					AdminAuctionService adminAuctionService = new AdminAuctionService();
					
					// 해당 경매의 총 입찰 횟수 가져오기
					int auctionBidTotalCount = adminAuctionService.getAuctionBidTotalCount(auctionId);
					
					
					// 응답값 반환
					response.setContentType("text/plain");
					response.setCharacterEncoding("UTF-8");
					
					PrintWriter out = response.getWriter();
					out.print(auctionBidTotalCount);
					out.flush();
					
					return;
				}
				
				// 경매 상세 조회 > 경매의 입찰 정보 가져오기 (AJAX)
				else if (path.equalsIgnoreCase("/admin/auction/ajax/bidHistory"))
				{
					// 이전 페이지(auctionDetail.jsp)에서 전달된 데이터 수신
					//-- auctionId
					//   (페이징은 구현하려다 생략)
					int auctionId = Integer.parseInt(request.getParameter("auctionId"));
					//int page = Integer.parseInt(request.getParameter("page"));
					
					// Service 객체 생성
					AdminAuctionService adminAuctionService = new AdminAuctionService();
					
					// 입찰 리스트 가져오기
					List<AuctionBidParticipationDTO> bidHistory = adminAuctionService.getAuctionBidHistory(auctionId);
					
					// 데이터를 json으로 변환 (Gson 라이브러리 사용)
					//-- https://mvnrepository.com/artifact/com.google.code.gson/gson/2.14.0
					Gson gson = new Gson();
					String jsonData = gson.toJson(bidHistory);
					
					
					// 변환한 데이터를 반환
					response.setContentType("application/json; charset=UTF-8");
					
					PrintWriter out = response.getWriter();
					out.print(jsonData);
					out.flush();
					return;
				}
				
				request.getRequestDispatcher(viewPath).forward(request, response);
				return;
			}
			//-- POST 방식 요청 --//
			else if (methodType.equalsIgnoreCase("POST"))
			{
				
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}// process(...) END
}// class AdminAuctionController END