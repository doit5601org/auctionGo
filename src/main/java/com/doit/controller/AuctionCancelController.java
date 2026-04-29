package com.doit.controller;

import java.io.IOException;

import com.doit.dao.AuctionDAO;
import com.doit.dto.UserInfoDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/mypage/auctioncancel")
public class AuctionCancelController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserInfoDTO loginUser = (UserInfoDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            resp.sendRedirect(req.getContextPath() + "/user/auth/login");
            return;
        }

        System.out.println("넘어온 ID: " + req.getParameter("auctionId"));
        int auctionId = Integer.parseInt(req.getParameter("auctionId"));
        String cancelReason = req.getParameter("cancelReason");
        int userNo = loginUser.getUserId();

        AuctionDAO dao = new AuctionDAO();
        int result = dao.cancelAuction(auctionId, userNo, cancelReason);

        if (result > 0) {
            resp.sendRedirect(req.getContextPath() + "/auction/list"); 
        } else {
            resp.sendRedirect(req.getContextPath() + "/user/mypage/auctionStatus?error=cancel_fail");
        }
    }
}