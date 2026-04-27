package com.doit.controller;

import java.io.IOException;

import com.doit.dao.ProductBuyDAO;
import com.doit.dto.BidActionDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user/purchaseConfirmAction")
public class ConfirmController extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        int bidId = Integer.parseInt(request.getParameter("bidId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        
        // DAO 객체 생성 및 프로시저 호출
        ProductBuyDAO dao = new ProductBuyDAO();
        BidActionDTO dto = new BidActionDTO(userId,bidId,0);
        int result = dao.confirmBid(dto); // 
        
        
        // 응답 보내기
        response.setContentType("text/plain; charset=UTF-8");
        
        if (result > 0) {
            response.getWriter().write("success"); // 성공 시 
        } else {
            response.getWriter().write("fail");    // 실패 시 
        }
    }
}

