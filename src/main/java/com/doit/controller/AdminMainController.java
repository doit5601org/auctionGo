package com.doit.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.doit.dao.AdminProductDAO;
import com.doit.dao.AdminUserDAO;
import com.doit.dao.MyPageDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin")
public class AdminMainController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		try
		{
			process(req, resp);
		} catch (ServletException | IOException | SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		try
		{
			process(req, resp);
		} catch (ServletException | IOException | SQLException e)
		{
			e.printStackTrace();
		}
	}

//------------------------------------------------------------------------------------------------------------------------
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException
	{
		String viewPath = "/WEB-INF/views/admin/mainDashBoard.jsp";
		try {
		AdminUserDAO dao = new AdminUserDAO();
		AdminProductDAO dao2 = new AdminProductDAO();
		
		
		int totalCount = dao.getTotalCount();
		int activeAuctionCount = dao.activeAuctionDataCount();
		int productCount = dao2.selectProductCount("PUBLIC");
		
		
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("activeAuctionCount", activeAuctionCount);
		request.setAttribute("productCount", productCount);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		request.getRequestDispatcher(viewPath).forward(request, response);
		return;
	}// process(...) END
	
}// class AdminController END