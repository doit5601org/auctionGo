package com.doit.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.doit.dto.ProductDTO;
import com.doit.util.DBConn;
//import com.doit.util.DBUtil;

public class ProductDAO {
	
	//private Connection conn = DBConn.getConnection();

	// 상품 등록 (프로시저 PRC_PRODUCT_CREATE 호출)
	public void insertProduct(ProductDTO dto) throws SQLException {
		CallableStatement cstmt = null;
		String sql = "{CALL PRC_PRODUCT_CREATE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		try {
			//cstmt = conn.prepareCall(sql);

			// 프로시저 파라미터 매핑 (명세서 순서 기준)
			cstmt.setString(1, dto.getProductReleaseName());
			cstmt.setString(2, dto.getProductAlias());
			cstmt.setLong(3, dto.getUserId());
			cstmt.setInt(4, dto.getManufacturerId());
			cstmt.setInt(dto.getProductGradeId(), 5);
			cstmt.setInt(dto.getProductGenreId(), 6);
			cstmt.setInt(dto.getProductSizeId(), 7);
			cstmt.setString(8, dto.getDescription());
			cstmt.setString(9, dto.getImgPath1());
			cstmt.setString(10, dto.getImgPath2());
			cstmt.setString(11, dto.getImgPath3());
			cstmt.setString(12, dto.getIsPublic());

			cstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			//DBUtil.close(cstmt);
		}
	}

	// 상품 수정 (프로시저 PRC_PRODUCT_UPDATE 호출)
	public void updateProduct(ProductDTO dto) throws SQLException {
		CallableStatement cstmt = null;
		String sql = "{CALL PRC_PRODUCT_UPDATE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		try {
		//cstmt = conn.prepareCall(sql);

			cstmt.setLong(1, dto.getProductId());
			cstmt.setString(2, dto.getProductReleaseName());
			cstmt.setString(3, dto.getProductAlias());
			cstmt.setInt(4, dto.getManufacturerId());
			cstmt.setInt(5, dto.getProductGradeId());
			cstmt.setInt(6, dto.getProductGenreId());
			cstmt.setInt(7, dto.getProductSizeId());
			cstmt.setString(8, dto.getDescription());
			cstmt.setString(9, dto.getIsOpened());
			cstmt.setString(10, dto.getIsPartsMissing());
			cstmt.setString(11, dto.getIsPublic());

			cstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			//DBUtil.close(cstmt);
		}
	}

	// 내 상품 목록 조회 (Paging 처리 포함)
	public List<ProductDTO> listProduct(long userId, int offset, int size) {
		List<ProductDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			// 최신 등록순으로 페이징 조회


		//	pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, userId);
			pstmt.setInt(2, offset);
			pstmt.setInt(3, size);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProductId(rs.getInt("PRODUCT_ID"));
				dto.setProductReleaseName(rs.getString("PRODUCT_RELEASE_NAME"));
				dto.setCreatedAt(rs.getDate("CREATED_AT")); 
				dto.setImgPath1(rs.getString("IMAGE_PATH_1"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//DBUtil.close(rs);
			//DBUtil.close(pstmt);
		}
		return list;
	}

	// 상품 상세 정보 조회 (수정 폼 로딩용)
	public ProductDTO findById(long productId) {
		ProductDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT * FROM PRODUCT_REGISTRATION WHERE PRODUCT_ID = ?";
			//pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, productId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new ProductDTO();
				dto.setProductId(rs.getInt("PRODUCT_ID"));
				dto.setProductReleaseName(rs.getString("PRODUCT_RELEASE_NAME"));
				dto.setProductAlias(rs.getString("PRODUCT_ALIAS"));
				dto.setManufacturerId(rs.getInt("MANUFACTURER_ID"));
				dto.setProductGradeId(rs.getInt("PRODUCT_GRADE_ID"));
				dto.setProductGenreId(rs.getInt("PRODUCT_GENRE_ID"));
				dto.setProductSizeId(rs.getInt("PRODUCT_SIZE_ID"));
				dto.setDescription(rs.getString("DESCRIPTIONS"));
				dto.setImgPath1(rs.getString("IMAGE_PATH_1"));
				dto.setIsOpened(rs.getString("IS_OPENED"));
				dto.setIsPartsMissing(rs.getString("IS_PARTS_MISSING"));
				dto.setIsPublic(rs.getString("IS_PUBLIC"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//DBUtil.close(rs);
			//DBUtil.close(pstmt);
		}
		return dto;
	}

	// 상품 삭제 (프로시저 호출)
	public void deleteProduct(long productId) throws SQLException {
		CallableStatement cstmt = null;
		String sql = "{CALL PRC_PRODUCT_DELETE(?)}";

		try {
			//cstmt = conn.prepareCall(sql);
			cstmt.setLong(1, productId);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			//DBUtil.close(cstmt);
		}
	}
}