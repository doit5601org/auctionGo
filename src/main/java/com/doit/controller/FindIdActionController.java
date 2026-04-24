package com.doit.controller;

import java.io.IOException;

import com.doit.service.AuthenticService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user/auth/find-id-action")
public class FindIdActionController extends HttpServlet{

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
		
		String findName = request.getParameter("findIdName");
		String findEmail = request.getParameter("findIdEmail");
		
		
		String findId  = AuthenticService.findId(findName, findEmail);
		
		if(findId!=null) {
			request.setAttribute("findId", findId);
		}else {
			request.setAttribute("errMsg", "일치하는 회원 정보가 존재하지 않습니다.");
		}
		request.getRequestDispatcher("/WEB-INF/views/user/auth/findId.jsp").forward(request, response);
		
	}
}
