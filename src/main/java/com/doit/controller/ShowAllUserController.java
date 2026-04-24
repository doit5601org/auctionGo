package com.doit.controller;
import com.doit.dao.*;
import com.doit.jydto.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/showuser")
public class ShowAllUserController extends HttpServlet
{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		AdminUserDAO dao = new AdminUserDAO();
		
		
		List<ShowUserDTO> userList;
		try
		{
			userList = dao.showAllUsers();
		    req.setAttribute("userList", userList);
		    req.setAttribute("totalCount", userList.size());
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/showAllUser.jsp");
			dispatcher.forward(req, resp);
			
			
		} catch (SQLException e)
		{
			e.printStackTrace();
			// todo: 에러 페이지로 리다이렉트
		}
	}
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		// TODO : DB 액션 처리
		resp.sendRedirect(req.getContextPath() + "/user/mypage/auctionList");
	}


}
