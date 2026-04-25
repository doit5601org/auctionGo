package com.doit.controller;

import java.io.IOException;

import com.doit.dao.MyPageDAO;
import com.doit.dto.UserInfoDTO;
import com.doit.service.MyPageService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/my/*")
public class MyPageController extends HttpServlet{

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

		String uri = request.getRequestURI();
		// 마이페이지 이동
		if(uri.endsWith("/user/my")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/user/my/mypage.jsp");
			dispatcher.forward(request, response);
			
		// 내정보수정 페이지 이동
		}else if(uri.endsWith("/user/my/change-info")) {
			
			HttpSession session = request.getSession();
			UserInfoDTO user = (UserInfoDTO) session.getAttribute("loginUser");
			request.setAttribute("user", user);
			
			if (user != null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/user/my/info/changeInfo.jsp");
				dispatcher.forward(request, response);
			} else {
				response.sendRedirect("/WEB-INF/view/user/auth/login.jsp");
			}
		
		// 비밀번호 수정 페이지 이동
		}else if(uri.endsWith("user/my/change-pw")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/user/my/info/changePwd.jsp");
			dispatcher.forward(request, response);
			
			
		// 내정보수정 요청	
		}else if(uri.endsWith("user/my/changeInfo-action")) {
			
			HttpSession session = request.getSession();
			UserInfoDTO user = (UserInfoDTO) session.getAttribute("loginUser");
			if (user == null) {
				response.sendRedirect(request.getContextPath() + "/user/auth/login");
			    return; 
			}
			
			String userLoginId = user.getUserLoginId();
			int userId = user.getUserId(); 
			
			String userPwd = request.getParameter("userPwd");
			String userEmail = request.getParameter("userEmail");
			String userPhone = request.getParameter("userPhone1") + request.getParameter("userPhone2") +request.getParameter("userPhone3"); 
			String userZipcode = request.getParameter("userZipcode");
			String userAddr1 = request.getParameter("userAddr1");
			String userAddr2 = request.getParameter("userAddr2");
			
			UserInfoDTO dto = new UserInfoDTO();
			dto.setUserEmail(userEmail);
			dto.setUserPhone(userPhone);
			dto.setUserZipcode(userZipcode);
			dto.setUserAddress(userAddr1);
			dto.setUserAddressDetail(userAddr2);
			dto.setUserId(userId);
			
			MyPageDAO dao = new MyPageDAO();
			MyPageService service = new MyPageService(dao);
			
			String result = service.changeInfo(userLoginId, userPwd, dto);
			if("정보 수정이 완료되었습니다.".equals(result)) {
				// 수정 성공 시 세션에 있는 기본 정보를 꺼내서 바뀐 값들만 덮어쓰기
				UserInfoDTO loginUser = (UserInfoDTO)session.getAttribute("loginUser");
				
				loginUser.setUserEmail(dto.getUserEmail());
				loginUser.setUserPhone(dto.getUserPhone());
				loginUser.setUserZipcode(dto.getUserZipcode());
				loginUser.setUserAddress(dto.getUserAddress());
				loginUser.setUserAddressDetail(dto.getUserAddressDetail());
				
				session.setAttribute("loginUser", loginUser);
			}	
			request.setAttribute("result", result);
			request.getRequestDispatcher("/WEB-INF/views/user/my/info/changeInfo.jsp").forward(request, response);
			
		
		// 비밀번호 수정 요청
		}else if(uri.endsWith("user/my/info/change-pw-action")) {
			
			HttpSession session = request.getSession();
			UserInfoDTO user = (UserInfoDTO) session.getAttribute("loginUser");
			if (user == null) {
				response.sendRedirect(request.getContextPath() + "/user/auth/login");
			    return; 
			}
			String userLoginId = user.getUserLoginId();
			String userPwd = request.getParameter("userPwd");
			String changePwd = request.getParameter("changePwd");
			
			MyPageDAO dao = new MyPageDAO();
			MyPageService service = new MyPageService(dao);
			String result = service.changePw(userLoginId, userPwd, changePwd);
			request.setAttribute("result", result);
			request.getRequestDispatcher("/WEB-INF/views/user/my/info/changePwd.jsp").forward(request, response);
		
		
		}
		
	}
}
