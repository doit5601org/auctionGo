package com.doit.controller;

import java.io.IOException;

import com.doit.dao.ProductDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 상품 목록, 상세 조회, 상품 신고, 등록/수정/삭제 담당 컨트롤러
@WebServlet("/product/*")
public class ProductController extends HttpServlet
{

	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO = new ProductDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{

		proess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{

		proess(req, resp);
	}

	protected void proess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
       //  req.setCharacterEncoding("UTF-8"); 필터 처리 ? 
		
	      //String method = req.getMethod();   // "get" or "post"
	      String uri = req.getRequestURI();
	     // String ct = request.getContextPath();
		try
		{
			/*
			 * if(uri.endsWith("/product/list.do"))공개 경매 상품 목록 
			        String searchKeyword = request.getParameter("searchKeyword");
			         String pageStr = request.getParameter("page");
			         페이징 처리 myutil로할지 여기에 직접할지 생각..  우선 페이징생략
			                                          :
			         request.getRequestDispatcher("/WEB-INF/views/product/productList.jsp").forward(request, response);
			     ---------------------------------------------------------------------------------------------------  
			 * else if(uri.endsWith("/product/myList.do")) 내 상품 목록 
		      
			 	HttpSession session = request.getSession(); 
			 	Integer userId = (Integer)session.getAttribute("userId"); // 세션에서 임시아이디 가져오기 가정
			 	
			 	if(userId == null)
			 	{
			 		response.sendRedirect(ct + "/login.do")
			 		return;
			 	}
			 	
			 	String pageStr = request.getParameter("page");
			 	~~ 페이징 
			 	
			 	 request.getRequestDispatcher("/WEB-INF/views/product/myProductList.jsp").forward(request, response);
			 ---------------------------------------------------------------------------------------------------  
			 * else if(uri.endsWith("/product/myList.do"))  상품 상세 조회
			 
			   int productId = Integer.parseInt(request.getParameter("productId"));
			   ProductDTO productDTO = productDAO.selectProductDetail(productId);
			   
			  request.setAttribute("product", product);
			  request.getRequestDispatcher("/WEB-INF/views/product/productDetail.jsp").forward(request, response);
			 ---------------------------------------------------------------------------------------------------  
			 * else if(uri.endsWith("/product/write.do"))  상품 등록
			 
           
                request.getRequestDispatcher("/WEB-INF/views/product/productWrite.jsp").forward(request, response);
               ---------------------------------------------------------------------------------------------------  
			 * else if(uri.endsWith("/product/update.do")) 상품 수정
			 * request.getRequestDispatcher("/WEB-INF/views/product/productUpdate.jsp").forward(request, response);
              ---------------------------------------------------------------------------------------------------  
			 * else if(uri.endsWith("/product/delete.do")) 상품 삭제
			   int productId = Integer.parseInt(request.getParameter("productId"));
                int userId = Integer.parseInt(request.getParameter("userId")); // 권한 확인용
                
                productDAO.deleteProduct(productId, userId);
                response.sendRedirect(contextPath + "/product/myList.do");
               ---------------------------------------------------------------------------------------------------  
			 * else if(uri.endsWith("/product/report.do")) 상품 신고 
			   ReportDTO reportDTO = new ReportDTO();
                reportDTO.setUserId(Integer.parseInt(request.getParameter("userId")));
                reportDTO.setReportTypeId(Integer.parseInt(request.getParameter("reportTypeId")));
                reportDTO.setProductId(Integer.parseInt(request.getParameter("productId")));
                reportDTO.setReportReason(request.getParameter("reportReason"));
                
                productDAO.insertProductReport(reportDTO);
                
                // 신고 후 원래 상세 페이지로 리다이렉트
                response.sendRedirect(contextPath + "/product/detail.do?productId=" + request.getParameter("productId"));
			 */
		} catch (Exception e)
		{
			
		}

	}

}
