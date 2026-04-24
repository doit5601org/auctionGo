package com.doit.controller;

import java.io.IOException;

import com.doit.service.AuthenticService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/user/auth/find-pw-action")
public class FindPwActionController extends HttpServlet{

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
		
		String findName = request.getParameter("findpwName");
		String findEmail = request.getParameter("findpwEmail");
		String findId = request.getParameter("findpwId");
		
		AuthenticService.findPw(findName, findEmail, findId);
		request.getRequestDispatcher("/WEB-INF/views/user/auth/findPw.jsp").forward(request, response);
		
	}
}
