package com.doit.dto;

import java.security.Timestamp;
import java.sql.Date;

public class ProductDTO
{
	private int productId;         					 // 상품 코드 (PK)
    private String productReleaseName;		// 상품 발매명
    private String productAlias;   			    // 상품 별칭
    private int userId;							   //회원고유키
    private int manufacturerId;           		// 상품 제조사 ID
    private int productGradeId;            // 상품 등급
    private int productGenreId;           // 장르 코드
    private int productSizeId;              // 사이즈/스케일 코드
    private String workName;      			  // 작품명
    private String characterName;  		  // 캐릭터명
    private String purchaseDateTime;      // 구매 시기
    private String isOpened;     			       // 개봉 여부
 
    private String isPartsMissing;    			// 파츠 누락 여부
    private String description;        		   // 상세 설명
    private String imgPath1;           		   // 이미지 파일명1
    private String imgPath2;          	 		  // 이미지 파일명2
    private String imgPath3;           	     // 이미지 파일명3
    private String isPublic;    	 		          // 공개 여부
    private Date createdAt;             // 등록일시
    
    public ProductDTO() {}

	public int getProductId()
	{
		return productId;
	}

	public void setProductId(int productId)
	{
		this.productId = productId;
	}

	public String getProductReleaseName()
	{
		return productReleaseName;
	}

	public void setProductReleaseName(String productReleaseName)
	{
		this.productReleaseName = productReleaseName;
	}

	public String getProductAlias()
	{
		return productAlias;
	}

	public void setProductAlias(String productAlias)
	{
		this.productAlias = productAlias;
	}

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public int getManufacturerId()
	{
		return manufacturerId;
	}

	public void setManufacturerId(int manufacturerId)
	{
		this.manufacturerId = manufacturerId;
	}

	public int getProductGradeId()
	{
		return productGradeId;
	}

	public void setProductGradeId(int productGradeId)
	{
		this.productGradeId = productGradeId;
	}

	public int getProductGenreId()
	{
		return productGenreId;
	}

	public void setProductGenreId(int productGenreId)
	{
		this.productGenreId = productGenreId;
	}

	public int getProductSizeId()
	{
		return productSizeId;
	}

	public void setProductSizeId(int productSizeId)
	{
		this.productSizeId = productSizeId;
	}

	public String getWorkName()
	{
		return workName;
	}

	public void setWorkName(String workName)
	{
		this.workName = workName;
	}

	public String getCharacterName()
	{
		return characterName;
	}

	public void setCharacterName(String characterName)
	{
		this.characterName = characterName;
	}

	public String getPurchaseDateTime()
	{
		return purchaseDateTime;
	}

	public void setPurchaseDateTime(String purchaseDateTime)
	{
		this.purchaseDateTime = purchaseDateTime;
	}

	public String getIsOpened()
	{
		return isOpened;
	}

	public void setIsOpened(String isOpened)
	{
		this.isOpened = isOpened;
	}

	public String getIsPartsMissing()
	{
		return isPartsMissing;
	}

	public void setIsPartsMissing(String isPartsMissing)
	{
		this.isPartsMissing = isPartsMissing;
	}

	public String getDescription()
	{
		return description;
	}

	public void setDescription(String description)
	{
		this.description = description;
	}

	public String getImgPath1()
	{
		return imgPath1;
	}

	public void setImgPath1(String imgPath1)
	{
		this.imgPath1 = imgPath1;
	}

	public String getImgPath2()
	{
		return imgPath2;
	}

	public void setImgPath2(String imgPath2)
	{
		this.imgPath2 = imgPath2;
	}

	public String getImgPath3()
	{
		return imgPath3;
	}

	public void setImgPath3(String imgPath3)
	{
		this.imgPath3 = imgPath3;
	}

	public String getIsPublic()
	{
		return isPublic;
	}

	public void setIsPublic(String isPublic)
	{
		this.isPublic = isPublic;
	}

	public Date getCreatedAt()
	{
		return createdAt;
	}

	public void setCreatedAt(Date createdAt)
	{
		this.createdAt = createdAt;
	}
	
	
	
}
