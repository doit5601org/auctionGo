package com.doit.controller;

import java.io.IOException;

import com.doit.dao.ProductBuyDAO;
import com.doit.dto.BidActionDTO;
import com.doit.dto.MoneyChargeHistoryDTO;
import com.doit.dto.PaymentDetailDTO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

@WebServlet("/payment/*")
public class PaymentController extends HttpServlet
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
		String uri = request.getRequestURI();
		
		if(uri.endsWith("/charge"))
		{
			charge(request, response);
		}
		
		if(uri.endsWith("/success"))
		{
			success(request, response);
		}
		
		if(uri.endsWith("/takefail"))
		{
			takefail(request, response);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/anjinmo_jsp/충전.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void charge(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		
		Object user = session.getAttribute("userId");
		
		int userId = 0;
		
		if(user != null)
		{
			userId = (int)user;
		}else
		{
			userId = 1;
		}
		
		Integer paymentType = Integer.parseInt(request.getParameter("btnradio"));
		Integer chargeMoney = Integer.parseInt(request.getParameter("chargeMoney"));
		
		ProductBuyDAO dao = new ProductBuyDAO();
		
		MoneyChargeHistoryDTO dto = new MoneyChargeHistoryDTO();
		
		dto.setUserId(userId);
		dto.setMoneyChargeMethodId(paymentType);
		dto.setChargeAmount(chargeMoney);
		
		boolean result = false;
		try
		{
			result = dao.moneyCharge(dto);
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		
		int totalMoney = dao.moneyCheck(userId);
		
		request.setAttribute("chargeMoney", chargeMoney);
		request.setAttribute("totalMoney", totalMoney);
	
		if(result)
		{
			request.setAttribute("message", "충전이 완료되었습니다");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/anjinmo_jsp/charge.jsp");
			dispatcher.forward(request, response);
		}else
		{
			request.setAttribute("message", "충전이 완료되지않았습니다");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/anjinmo_jsp/charge.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	protected void success(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Integer userId = Integer.parseInt(request.getParameter("user"));
		Integer bid = Integer.parseInt(request.getParameter("bid"));
		Integer amount = Integer.parseInt(request.getParameter("price"));
		
		ProductBuyDAO dao = new ProductBuyDAO();
		BidActionDTO dto = new BidActionDTO(userId, bid, amount);
		
		request.setAttribute("today", new java.util.Date());
		
		int result = dao.paymentBid(dto);
		
		if(result > 0)
		{
			request.setAttribute("massage", "결제가 완료되었습니다!");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/anjinmo_jsp/success.jsp");
			dispatcher.forward(request, response);
		}else
		{
			request.setAttribute("massage", "결제가 실패하였습니다..");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/anjinmo_jsp/success.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
	}
	
	protected void takefail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Integer userId = Integer.parseInt(request.getParameter("user"));
		Integer bid = Integer.parseInt(request.getParameter("bid"));
		Integer amount = Integer.parseInt(request.getParameter("price"));
		
		ProductBuyDAO dao = new ProductBuyDAO();
		
		
		
		request.setAttribute("massage", "결제가 실패하였습니다..");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/anjinmo_jsp/takefail.jsp");
		dispatcher.forward(request, response);
		
		
		
		
	}
}
