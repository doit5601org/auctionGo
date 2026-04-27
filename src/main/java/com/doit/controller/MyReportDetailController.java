package com.doit.controller;

import java.io.IOException;

import com.doit.dao.ReportDAO;
import com.doit.jydto.ReportDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user/mypage/myreport-detail")
public class MyReportDetailController extends HttpServlet
{

	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String reportId = req.getParameter("reportId");
        
        if (reportId != null) {
            ReportDAO dao = new ReportDAO();
            
            ReportDTO dto = dao.getReportDetail(reportId);
            
            req.setAttribute("dto", dto);
        }

        req.getRequestDispatcher("/WEB-INF/views/user/mypage/myReportDetail.jsp").forward(req, resp);
    }

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		super.doPost(req, resp);
	}

	
	
	
	
	
}
