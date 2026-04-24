package com.doit.controller;

import java.io.IOException;

import com.doit.dto.UserInfoDTO;
import com.doit.service.AuthenticService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/auth/loginAction")
public class LoginActionController extends HttpServlet{

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

		String loginId = request.getParameter("userId");
		String loginPw = request.getParameter("userPwd");
		String check = request.getParameter("check");
		
		if (loginId != null) 
			loginId = loginId.trim();
		
		UserInfoDTO loginUser = new UserInfoDTO();
		
		loginUser = AuthenticService.authenticateUser(loginId, loginPw);
		
		if(loginUser !=null) {
			// 성공 -> 세션에 담기
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			Cookie id = new Cookie("loginId", loginId);
			if(check!=null && check.equals("on")) {
				id.setMaxAge(3600*24*7);
			}else {
				id.setMaxAge(0);
			}
			response.addCookie(id);

			response.sendRedirect(request.getContextPath()+"/main");
			
			
		}else {
			// 실패 -> 로그인실패 메시지 담기
			request.setAttribute("errMsg", "아이디 또는 비밀번호가 틀렸습니다.");
			request.getRequestDispatcher("/WEB-INF/views/user/auth/login.jsp").forward(request, response);
		}
		
//		
		
		
	}
}
