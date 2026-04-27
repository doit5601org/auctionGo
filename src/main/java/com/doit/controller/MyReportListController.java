package com.doit.controller;

import java.io.IOException;
import java.util.List;

import com.doit.dao.ReportDAO;
import com.doit.jydto.ReportDTO;
import com.doit.dto.UserInfoDTO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/mypage/report-list")
public class MyReportListController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        // 1. 세션에서 로그인한 유저 정보 가져오기
        HttpSession session = req.getSession();
        UserInfoDTO loginUser = (UserInfoDTO) session.getAttribute("loginUser");

        // 2. 로그인 체크 (보안)
        if (loginUser == null) {
            // 로그인 안 되어 있으면 로그인 페이지로 쫓아내기
            resp.sendRedirect(req.getContextPath() + "/user/auth/login");
            return;
        }

        // 3. DAO를 통해 해당 유저의 신고 목록 조회
        // 세션에 담긴 유저의 PK(userId)를 사용합니다.
        int userIdx = loginUser.getUserId(); 
        List<ReportDTO> reportList = ReportDAO.getUserReportList(userIdx);

        // 4. 결과 데이터를 request에 담기 (JSP에서 쓰기 위해)
        req.setAttribute("reportList", reportList);

        // 5. JSP로 포워딩
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/myReportList.jsp");
        dispatcher.forward(req, resp);
    }
}