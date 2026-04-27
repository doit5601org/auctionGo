package com.doit.controller;

import java.io.IOException;

import com.doit.dto.AdminDTO;
import com.doit.dto.PenaltyHistoryDTO;
import com.doit.service.AdminPenaltyService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/penalty/*")
public class AdminPenaltyController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		process(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		process(req, resp);
	}

//-----------------------------------------------------------------------------------------------------------------------------------

	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String methodType = request.getMethod();
		String uri = request.getRequestURI();
		String path = uri.substring(request.getContextPath().length());
		
		String viewPath = "/WEB-INF/views";

		try
		{
			//-- GET 방식 요청 처리 --//
			if (methodType.equalsIgnoreCase("GET"))
			{
				//-- 패널티 처리 --//
				// 패널티 부여 페이지 이동
				if (path.equalsIgnoreCase("/admin/penalty/register"))
				{
					// 파라미터 수신
					//-- userId, prevUrl
					String userId = request.getParameter("userId");
					String prevUrl = request.getParameter("prevUrl");
					
					
					// 필요시 유저 정보를 가져오는 로직 삽입 가능...

					
					// 데이터 바인딩
					request.setAttribute("userId", userId);
					request.setAttribute("prevUrl", prevUrl);
					
					
					viewPath = viewPath + "/admin/penaltyRegister.jsp";
				}
				
				request.getRequestDispatcher(viewPath).forward(request, response);
			}
			//-- POST 방식 요청 처리 --// 
			else if (methodType.equalsIgnoreCase("POST"))
			{
				//-- 패널티 처리 --//
				// 패널티 부여 처리
				if (path.equalsIgnoreCase("/admin/penalty/register"))
				{
					// 전달된 데이터 수신
					//-- prevUrl, userId, penaltyPoint, penaltyReason
					String prevUrl = request.getParameter("prevUrl");
					int userId = Integer.parseInt(request.getParameter("userId"));
					int penaltyScore = Integer.parseInt(request.getParameter("penaltyScore"));
					
					
					
					
					//------------------------------------------
					// (temp) 개발용 데이터
					//------------------------------------------
					AdminDTO tempAdminDto = new AdminDTO();
					tempAdminDto.setAdminAccountId(2);
					request.getSession().setAttribute("adminInfo", tempAdminDto);
					//------------------------------------------
					
					
					
					// 세션에서 관리자 정보 가져오기
					HttpSession session = request.getSession();
					AdminDTO adminDto = (AdminDTO)session.getAttribute("adminInfo");
					int adminAccountId = adminDto.getAdminAccountId();
					
					
					// Service 객체 생성
					AdminPenaltyService apService = new AdminPenaltyService();
					
					
					// DTO 생성
					PenaltyHistoryDTO phDto = new PenaltyHistoryDTO();
					phDto.setUserId(userId);
					phDto.setAdminAccountId(adminAccountId);
					phDto.setPenaltyScore(penaltyScore);
					// 시스템 관리자 계정을 adminAccountId = 0 이라고 가정...
					// 1: 자동 (시스템)
					// 2: 수동 (관리자)
					phDto.setPenaltyTypeId(adminAccountId == 0 ? 1 : 2);
					
					
					// 로직 수행
					int result = apService.registerPenalty(phDto);
					
					
					// 결과에 맞춰 request에 결과값 바인딩 
					if (result > 0)
					{
						request.setAttribute("message", "패널티 부여 완료");
					}
					else
					{
						request.setAttribute("message", "패널티 부여 실패!");
					}
					
					// prevUrl 을 request 에 바인딩하여 함께 전달.
					request.setAttribute("prevUrl", prevUrl);
					
					
					// 메세지 출력 및 리다이렉트 처리 페이지로 포워딩
					request.getRequestDispatcher("/WEB-INF/views/admin/common/message.jsp").forward(request, response);
				}
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}// class AdminPenaltyController END