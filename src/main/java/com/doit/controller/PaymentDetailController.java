package com.doit.controller;

import java.io.IOException;

import com.doit.dao.ProductBuyDAO;
import com.doit.dto.PaymentDetailDTO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/payment.detail")
public class PaymentDetailController extends HttpServlet
{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		process(request, response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String userStr = request.getParameter("loginUser");
		String resultStr = request.getParameter("resultId");
		 
		int userId = 1;
		
		int resultId = 1;
		

		if (userStr != null && !userStr.trim().isEmpty()) {
		    try {
		    	userId = Integer.parseInt(request.getParameter("loginUser"));
		    } catch (NumberFormatException e) {
		       
		    	userId = 1;
		    }
		}
		
		if (resultStr != null && !resultStr.trim().isEmpty()) {
		    try {
		    	resultId = Integer.parseInt(request.getParameter("resultId"));
		    } catch (NumberFormatException e) {
		       
		    	resultId = 1;
		    }
		}
		
		
		ProductBuyDAO dao = new ProductBuyDAO();
		
		
		PaymentDetailDTO dto = dao.takeItem(userId);
		
		int money = dao.moneyCheck(userId);
		
		request.setAttribute("detail", dto);
		
		request.setAttribute("money", money);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/user/mypage/successBidBuy.jsp");
		dispatcher.forward(request, response);
	}
	
}
