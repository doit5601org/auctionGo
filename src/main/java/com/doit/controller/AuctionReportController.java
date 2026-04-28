package com.doit.controller;

import java.io.IOException;
import java.util.List;

import com.doit.dao.AuctionDAO;
import com.doit.dao.ReportDAO;
import com.doit.dto.AuctionDTO;
import com.doit.dto.ReportTypeDTO;
import com.doit.dto.UserInfoDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/auction/report")
public class AuctionReportController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String auctionIdStr = req.getParameter("auctionId");
        
        if (auctionIdStr == null || auctionIdStr.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/auction/list");
            return;
        }

        try {
            long auctionId = Long.parseLong(auctionIdStr);
            AuctionDAO auctionDao = new AuctionDAO();
            ReportDAO reportDao = new ReportDAO();

            AuctionDTO auction = auctionDao.selectAuctionDetail((int)auctionId);
            List<ReportTypeDTO> reportTypeList = auctionDao.selectReportTypeList();

            req.setAttribute("auction", auction);
            req.setAttribute("reportTypeList", reportTypeList);

            req.getRequestDispatcher("/WEB-INF/views/auction/auctionReport.jsp").forward(req, resp);
            
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/auction/list");
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserInfoDTO user = (UserInfoDTO) session.getAttribute("loginUser");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/user/auth/login");
            return;
        }

        try {
            long auctionId = Long.parseLong(req.getParameter("auctionId"));
            int reportTypeId = Integer.parseInt(req.getParameter("reportTypeId"));
            String reportContent = req.getParameter("reportContent");
            long reporterId = user.getUserId();

            ReportDAO dao = new ReportDAO();
            boolean isSuccess = dao.insertAuctionReport(auctionId, reporterId, reportTypeId, reportContent);

            if (isSuccess) {
                resp.sendRedirect(req.getContextPath() + "/auction/detail?auctionId=" + auctionId + "&reportOk=1");
            } else {
                req.setAttribute("errorMsg", "신고 접수에 실패했습니다. 다시 시도해주세요.");
                doGet(req, resp); 
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}