package com.doit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.doit.dao.ProductDAO;
import com.doit.dto.ProductDTO;
import com.doit.dto.ProductGenreDTO;
import com.doit.dto.ProductGradeDTO;
import com.doit.dto.ProductManufacturerDTO;
import com.doit.dto.ProductSizeDTO;
import com.doit.dto.ReportDTO;
import com.doit.dto.ReportTypeDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/product/*")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,  // 1MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 15     // 15MB
)
public class ProductController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 페이지 사이즈
	private static final int PAGE_SIZE_LIST = 12; // 공개 목록
	private static final int PAGE_SIZE_MY_LIST = 10; // 내 상품

	private ProductDAO productDAO = new ProductDAO();

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

	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String uri = req.getRequestURI();
		String method = req.getMethod(); // "GET" / "POST"
		String ct = req.getContextPath();

		try
		{
			if (uri.endsWith("/product/list"))
			{
				listAction(req, resp);
			} else if (uri.endsWith("/product/myList"))
			{
				myListAction(req, resp, ct);
			} else if (uri.endsWith("/product/detail"))
			{
				detailAction(req, resp);
			} else if (uri.endsWith("/product/register"))
			{
				if ("POST".equalsIgnoreCase(method))
					registerPostAction(req, resp, ct);
				else
					registerFormAction(req, resp);
			} else if (uri.endsWith("/product/update"))
			{
				if ("POST".equalsIgnoreCase(method))
					updatePostAction(req, resp, ct);
				else
					updateFormAction(req, resp);
			} else if (uri.endsWith("/product/delete"))
			{
				if ("POST".equalsIgnoreCase(method))
					deletePostAction(req, resp, ct);
				else
					deleteFormAction(req, resp);
			} else if (uri.endsWith("/product/report"))
			{
				if ("POST".equalsIgnoreCase(method))
					reportPostAction(req, resp, ct);
				else
					reportFormAction(req, resp);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
			
			resp.getWriter().print("SQL Error: " + e.getMessage()); 
		    return; // 더 이상 진행 방지
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	// 공개 상품 목록
	private void listAction(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, SQLException
	{
		String keyword = req.getParameter("keyword");
		String sort = req.getParameter("sort"); // newest / grade / popular
		Integer genreId = parseInteger(req.getParameter("genre"));
		Integer gradeId = parseInteger(req.getParameter("grade"));
		Integer sizeId = parseInteger(req.getParameter("size"));
		Integer manufacturerId = parseInteger(req.getParameter("maker"));

		int page = parseIntWithDefault(req.getParameter("page"), 1);
		if (page < 1)
			page = 1;
		int start = (page - 1) * PAGE_SIZE_LIST + 1;
		int end = page * PAGE_SIZE_LIST;

		int totalCount = productDAO.selectProductCount(keyword, genreId, gradeId, sizeId, manufacturerId);
		int totalPage = (int) Math.ceil((double) totalCount / PAGE_SIZE_LIST);
		List<ProductDTO> list = productDAO.selectProductList(start, end, keyword, genreId, gradeId, sizeId,
				manufacturerId, sort);

		// 드롭다운용 공통 코드
		List<ProductGenreDTO> genreList = productDAO.selectGenreList();
		List<ProductGradeDTO> gradeList = productDAO.selectGradeList();
		List<ProductSizeDTO> sizeList = productDAO.selectSizeList();
		List<ProductManufacturerDTO> makerList = productDAO.selectManufacturerList();

		req.setAttribute("productList", list);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("currentPage", page);
		req.setAttribute("genreList", genreList);
		req.setAttribute("gradeList", gradeList);
		req.setAttribute("sizeList", sizeList);
		req.setAttribute("makerList", makerList);

		req.getRequestDispatcher("/WEB-INF/views/product/productList.jsp").forward(req, resp);
	}

	// 내 상품 목록 (마이페이지)
	private void myListAction(HttpServletRequest req, HttpServletResponse resp, String ct)
			throws ServletException, IOException, SQLException
	{
		Integer userId = getLoginUserId(req);
		if (userId == null)
		{
			resp.sendRedirect(ct + "/login");
			return;
		}

		int page = parseIntWithDefault(req.getParameter("page"), 1);
		if (page < 1)
			page = 1;
		int start = (page - 1) * PAGE_SIZE_MY_LIST + 1;
		int end = page * PAGE_SIZE_MY_LIST;

		int totalCount = productDAO.selectMyProductCount(userId);
		int totalPage = (int) Math.ceil((double) totalCount / PAGE_SIZE_MY_LIST);
		List<ProductDTO> list = productDAO.selectMyProductList(userId, start, end);

		req.setAttribute("myProductList", list);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("currentPage", page);
		req.setAttribute("pageStart", start); // JSP 에서 행번호 계산용

		req.getRequestDispatcher("/WEB-INF/views/product/productMyList.jsp").forward(req, resp);
	}

	// 상품 상세
	private void detailAction(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, SQLException
	{
		int productId = Integer.parseInt(req.getParameter("productId"));
		ProductDTO product = productDAO.selectProductDetail(productId);

		if (product == null)
		{
			resp.sendError(HttpServletResponse.SC_NOT_FOUND, "상품을 찾을 수 없습니다.");
			return;
		}

		req.setAttribute("product", product);
		req.getRequestDispatcher("/WEB-INF/views/product/productDetail.jsp").forward(req, resp);
	}

	// 상품 등록 (GET - 폼)
	private void registerFormAction(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, SQLException
	{
		Integer userId = getLoginUserId(req);
		if (userId == null)
		{
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		req.setAttribute("genreList", productDAO.selectGenreList());
		req.setAttribute("gradeList", productDAO.selectGradeList());
		req.setAttribute("sizeList", productDAO.selectSizeList());
		req.setAttribute("makerList", productDAO.selectManufacturerList());

		req.getRequestDispatcher("/WEB-INF/views/product/productRegister.jsp").forward(req, resp);
	}

	// 상품 등록 (POST - 저장)
	// ※ 파일 업로드는 미구현. imagePath1/2/3 에는 일단 파일명만 받는다고 가정.
	// (운영 시 @MultipartConfig + Part API 로 실제 저장 로직 추가)
	private void registerPostAction(HttpServletRequest req, HttpServletResponse resp, String ct)
			throws ServletException, IOException, SQLException
	{
		Integer userId = getLoginUserId(req);
		if (userId == null)
		{
			resp.sendRedirect(ct + "/login");
			return;
		}

		ProductDTO dto = buildProductDTOFromRequest(req);
		dto.setUserId(userId);

		productDAO.insertProduct(dto);
		resp.sendRedirect(ct + "/product/myList");
	}

	// 상품 수정 (GET )
	private void updateFormAction(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, SQLException
	{
		Integer userId = getLoginUserId(req);
		if (userId == null)
		{
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		int productId = Integer.parseInt(req.getParameter("productId"));
		ProductDTO product = productDAO.selectProductDetail(productId);

		if (product == null || product.getUserId() != userId)
		{
			// 본인 상품 아님
			resp.sendError(HttpServletResponse.SC_FORBIDDEN, "수정 권한이 없습니다.");
			return;
		}

		req.setAttribute("product", product);
		req.setAttribute("genreList", productDAO.selectGenreList());
		req.setAttribute("gradeList", productDAO.selectGradeList());
		req.setAttribute("sizeList", productDAO.selectSizeList());
		req.setAttribute("makerList", productDAO.selectManufacturerList());

		req.getRequestDispatcher("/WEB-INF/views/product/productUpdate.jsp").forward(req, resp);
	}

	// 상품 수정 (POST - 저장)
	private void updatePostAction(HttpServletRequest req, HttpServletResponse resp, String ct)
			throws ServletException, IOException, SQLException
	{
		Integer userId = getLoginUserId(req);
		if (userId == null)
		{
			resp.sendRedirect(ct + "/login");
			return;
		}

		ProductDTO dto = buildProductDTOFromRequest(req);
		dto.setUserId(userId);
		dto.setProductId(Integer.parseInt(req.getParameter("productId")));

		productDAO.updateProduct(dto);
		resp.sendRedirect(ct + "/product/detail?productId=" + dto.getProductId());
	}

	// 상품 삭제 (GET - 확인폼)
	private void deleteFormAction(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, SQLException
	{
		int productId = Integer.parseInt(req.getParameter("productId"));
		ProductDTO product = productDAO.selectProductDetail(productId);

		Integer userId = getLoginUserId(req);
		if (userId == null || product == null || product.getUserId() != userId)
		{
			resp.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}

		req.setAttribute("product", product);
		req.getRequestDispatcher("/WEB-INF/views/product/productDelete.jsp").forward(req, resp);
	}

	// 상품 삭제 (POST - 실행)
	private void deletePostAction(HttpServletRequest req, HttpServletResponse resp, String ct)
			throws ServletException, IOException, SQLException
	{
		Integer userId = getLoginUserId(req);
		if (userId == null)
		{
			resp.sendRedirect(ct + "/login");
			return;
		}

		int productId = Integer.parseInt(req.getParameter("productId"));
		productDAO.deleteProduct(productId, userId); // 프로시저 내부에서 권한/중복 검증
		resp.sendRedirect(ct + "/product/myList");
	}

	// 상품 신고 (GET )
	private void reportFormAction(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, SQLException
	{
		Integer userId = getLoginUserId(req);
		if (userId == null)
		{
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		int productId = Integer.parseInt(req.getParameter("productId"));
		ProductDTO product = productDAO.selectProductDetail(productId);

		if (product == null)
		{
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}

		List<ReportTypeDTO> reportTypeList = productDAO.selectReportTypeList();

		req.setAttribute("product", product);
		req.setAttribute("reportTypeList", reportTypeList);
		req.getRequestDispatcher("/WEB-INF/views/product/productReport.jsp").forward(req, resp);
	}

	// 상품 신고 (POST )
	private void reportPostAction(HttpServletRequest req, HttpServletResponse resp, String ct)
			throws ServletException, IOException, SQLException
	{
		Integer userId = getLoginUserId(req);
		if (userId == null)
		{
			resp.sendRedirect(ct + "/login");
			return;
		}

		int productId = Integer.parseInt(req.getParameter("productId"));

		ReportDTO dto = new ReportDTO();
		dto.setUserId(userId);
		dto.setReportTypeId(Integer.parseInt(req.getParameter("reportTypeId")));
		dto.setProductId(productId);
		dto.setReportReason(req.getParameter("reportContent"));

		try
		{
			productDAO.insertProductReport(dto);
			resp.sendRedirect(ct + "/product/detail?productId=" + productId + "&reportOk=1");
		} catch (SQLException e)
		{
			if (e.getErrorCode() == ProductDAO.ERR_DUPLICATE_REPORT)
			{
				// 중복 신고 → 폼으로 돌려보내고 에러 메시지 표시
				req.setAttribute("errorMsg", "이미 신고하신 상품입니다.");
				req.setAttribute("product", productDAO.selectProductDetail(productId));
				req.setAttribute("reportTypeList", productDAO.selectReportTypeList());
				req.getRequestDispatcher("/WEB-INF/views/product/productReport.jsp").forward(req, resp);
			} else
			{
				throw e;
			}
		}
	}

	// 헬퍼 메서드
	// 세션에서 로그인 사용자 userId 가져오기. 없으면 null.
	/*
	 * private Integer getLoginUserId(HttpServletRequest req) { HttpSession session
	 * = req.getSession(false); if (session == null) return null;
	 * 
	 * Object obj = session.getAttribute("userId");
	 * 
	 * if (obj instanceof Integer) return (Integer) obj;
	 * 
	 * return null; }
	 */

	private Integer getLoginUserId(HttpServletRequest req)
	{
		return 1;
	} // 테스트용 login }

	// 파라미터 → Integer 변환. 빈 값/숫자 아니면 null
	private Integer parseInteger(String s)
	{
		if (s == null || s.trim().isEmpty())
			return null;
		try
		{
			return Integer.parseInt(s.trim());
		} catch (NumberFormatException e)
		{
			return null;
		}
	}

	// 파라미터 → int 변환. 실패 시 기본값
	private int parseIntWithDefault(String s, int defaultValue)
	{
		Integer v = parseInteger(s);
		return v == null ? defaultValue : v;
	}

	// 등록/수정 폼 → ProductDTO 공통 빌드
	private ProductDTO buildProductDTOFromRequest(HttpServletRequest req)
	{
		ProductDTO dto = new ProductDTO();

		dto.setProductReleaseName(req.getParameter("productName"));
		dto.setProductAlias(req.getParameter("productAlias"));
		dto.setManufacturerId(parseIntOrZero(req.getParameter("makerId")));
		dto.setProductGradeId(parseIntOrZero(req.getParameter("gradeCode")));
		dto.setProductGenreId(parseIntOrZero(req.getParameter("genreCode")));
		dto.setProductSizeId(parseIntOrZero(req.getParameter("sizeCode")));
		dto.setWorkName(req.getParameter("workName"));
		dto.setCharacterName(req.getParameter("characterName"));

		// purchaseDate 는 JSP 에서 연도 드롭다운('2023' 등) → 'YYYY-01-01' 변환
		String purchaseYear = req.getParameter("purchaseDate");
		if (purchaseYear != null && purchaseYear.matches("\\d{4}"))
		{
			dto.setPurchaseDateTime(purchaseYear + "-01-01");
		} else
		{
			dto.setPurchaseDateTime(purchaseYear); // 이미 'YYYY-MM-DD' 로 왔을 수도 있음
		}

		dto.setIsOpened(parseIntOrZero(req.getParameter("openedCode")));
		dto.setIsPartsMissing(parseIntOrZero(req.getParameter("missingCode")));
		dto.setDescriptions(req.getParameter("description"));
		dto.setIsPublic(parseIntOrZero(req.getParameter("publicCode")));

		// 실제 파일 업로드 처리는 @MultipartConfig + Part API 로 별도 구현.
		// 현재는 hidden input 또는 수동 파일명 입력 기준.
		/*
		 * dto.setImagePath1(getFileName(req.getPart("productImage1")));
		 * dto.setImagePath2(getFileName(req.getPart("productImage2")));
		 * dto.setImagePath3(getFileName(req.getPart("productImage3")));
		 */
		return dto;
	}

	private int parseIntOrZero(String s)
	{
		Integer v = parseInteger(s);
		return v == null ? 0 : v;
	}
}
