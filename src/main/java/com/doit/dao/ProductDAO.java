package com.doit.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.doit.dto.ProductDTO;
import com.doit.util.DBCPConn;

public class ProductDAO
{

	// 상품 등록
	public void insertProduct(ProductDTO dto) throws SQLException
	{
		Connection conn = DBCPConn.getConnection();
		CallableStatement cstmt = null;
		String sql;

		try
		{
			sql = "{CALL PRC_PRODUCT_CREATE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
			cstmt = conn.prepareCall(sql);

			cstmt.setInt(1, dto.getUserId());
			cstmt.setString(2, dto.getProductReleaseName());
			cstmt.setString(3, dto.getProductAlias());
			cstmt.setInt(4, dto.getManufacturerId());
			cstmt.setInt(5, dto.getProductGradeId());
			cstmt.setInt(6, dto.getProductGenreId());
			cstmt.setInt(7, dto.getProductSizeId());
			cstmt.setString(8, dto.getWorkName());
			cstmt.setString(9, dto.getCharacterName());
			cstmt.setString(10, dto.getPurchaseDateTime());
			cstmt.setInt(11, dto.getIsOpened());
			cstmt.setInt(12, dto.getIsPartsMissing());
			cstmt.setString(13, dto.getDescriptions());
			cstmt.setString(14, dto.getImagePath1());
			cstmt.setString(15, dto.getImagePath2());
			cstmt.setString(16, dto.getImagePath3());
			cstmt.setInt(17, dto.getIsPublic());

			cstmt.executeUpdate();

		} catch (SQLException e)
		{
			e.printStackTrace();
			throw e;
		} finally
		{

			if (cstmt != null)
				try
				{
					cstmt.close();
				} catch (Exception e)
				{
				}
			DBCPConn.close(conn); // 커넥션 반납
		}
	}

	// 상품 수정
	public void updateProduct(ProductDTO dto) throws SQLException
	{
		Connection conn = DBCPConn.getConnection();
		CallableStatement cstmt = null;
		String sql;

		try
		{
			sql = "{CALL PRC_PRODUCT_UPDATE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
			cstmt = conn.prepareCall(sql);

			cstmt.setInt(1, dto.getProductId());
			cstmt.setInt(2, dto.getUserId());
			cstmt.setString(3, dto.getProductReleaseName());
			cstmt.setString(4, dto.getProductAlias());
			cstmt.setInt(5, dto.getManufacturerId());
			cstmt.setInt(6, dto.getProductGradeId());
			cstmt.setInt(7, dto.getProductGenreId());
			cstmt.setInt(8, dto.getProductSizeId());
			cstmt.setString(9, dto.getWorkName());
			cstmt.setString(10, dto.getCharacterName());
			cstmt.setString(11, dto.getPurchaseDateTime());
			cstmt.setInt(12, dto.getIsOpened());
			cstmt.setInt(13, dto.getIsPartsMissing());
			cstmt.setString(14, dto.getDescriptions());
			cstmt.setString(15, dto.getImagePath1());
			cstmt.setString(16, dto.getImagePath2());
			cstmt.setString(17, dto.getImagePath3());
			cstmt.setInt(18, dto.getIsPublic());

			cstmt.executeUpdate();

		} catch (SQLException e)
		{
			e.printStackTrace();
			throw e;
		} finally
		{
			if (cstmt != null)
				try
				{
					cstmt.close();
				} catch (Exception e)
				{
				}
			DBCPConn.close(conn);
		}
	}

	// 상품 삭제
	public void deleteProduct(int productId, int userId) throws SQLException
	{
		Connection conn = DBCPConn.getConnection();
		CallableStatement cstmt = null;
		String sql;

		try
		{
			sql = "{CALL PRC_PRODUCT_DELETE(?, ?)}";
			cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, productId);
			cstmt.setInt(2, userId);

			cstmt.executeUpdate();

		} catch (SQLException e)
		{
			e.printStackTrace();
			throw e;
		} finally
		{
			if (cstmt != null)
				try
				{
					cstmt.close();
				} catch (Exception e)
				{
				}
			DBCPConn.close(conn);
		}
	}

	// 내 상품 목록 조회 (Paging 처리, 추가 보완 필요) 
	public List<ProductDTO> selectProductList(int start, int end, String searchKeyword) throws SQLException
	{
		List<ProductDTO> list = new ArrayList<>();
		Connection conn = DBCPConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM ( " + "    SELECT ROWNUM rnum, p.* FROM ( " + "        SELECT * FROM PRODUCT "
				+ "        WHERE IS_PUBLIC = 1 AND PRODUCT_NAME LIKE ? " // 1이 'Y'라면
				+ "        ORDER BY PRODUCT_ID DESC " + "    ) p " + ") WHERE rnum BETWEEN ? AND ?";

		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchKeyword == null ? "%%" : "%" + searchKeyword + "%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs = pstmt.executeQuery();

			while (rs.next())
			{
				ProductDTO dto = new ProductDTO();
				dto.setProductId(rs.getInt("PRODUCT_ID"));
				dto.setProductReleaseName(rs.getString("PRODUCT_NAME"));
				dto.setImagePath1(rs.getString("IMG_PATH1"));
				// 추가필요 
				list.add(dto);
			}
		} finally
		{
			if (rs != null)
				try
				{
					rs.close();
				} catch (Exception e)
				{
				}
			if (pstmt != null)
				try
				{
					pstmt.close();
				} catch (Exception e)
				{
				}
			DBCPConn.close(conn);
		}
		return list;
	}
}