package com.doit.dto;

import java.security.Timestamp;
import java.sql.Date;

public class ProductDTO
{
	private int productId;              // PRODUCT_ID (PK)
    private String productReleaseName;  // PRODUCT_RELEASE_NAME
    private String productAlias;        // PRODUCT_ALIAS
    private int userId;                 // USER_ID (FK)
    private int manufacturerId;         // MANUFACTURER_ID (FK)
    private int productGradeId;         // PRODUCT_GRADE_ID (FK)
    private int productGenreId;         // PRODUCT_GENRE_ID (FK)
    private int productSizeId;          // PRODUCT_SIZE_ID (FK)
    private String workName;            // WORK_NAME
    private String characterName;       // CHARACTER_NAME
    private String purchaseDateTime;    // PURCHASE_DATETIME (Date 입력용 문자열)
    private int isOpened;               // IS_OPENED (NUMBER 1)
    private int isPartsMissing;         // IS_PARTS_MISSING (NUMBER 1)
    private String descriptions;        // DESCRIPTIONS
    private String imagePath1;          // IMAGE_PATH_1
    private String imagePath2;          // IMAGE_PATH_2
    private String imagePath3;          // IMAGE_PATH_3
    private int isPublic;               // IS_PUBLIC (NUMBER 1)
    private String createdAt;           // CREATED_AT
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
	public int getIsOpened()
	{
		return isOpened;
	}
	public void setIsOpened(int isOpened)
	{
		this.isOpened = isOpened;
	}
	public int getIsPartsMissing()
	{
		return isPartsMissing;
	}
	public void setIsPartsMissing(int isPartsMissing)
	{
		this.isPartsMissing = isPartsMissing;
	}
	public String getDescriptions()
	{
		return descriptions;
	}
	public void setDescriptions(String descriptions)
	{
		this.descriptions = descriptions;
	}
	public String getImagePath1()
	{
		return imagePath1;
	}
	public void setImagePath1(String imagePath1)
	{
		this.imagePath1 = imagePath1;
	}
	public String getImagePath2()
	{
		return imagePath2;
	}
	public void setImagePath2(String imagePath2)
	{
		this.imagePath2 = imagePath2;
	}
	public String getImagePath3()
	{
		return imagePath3;
	}
	public void setImagePath3(String imagePath3)
	{
		this.imagePath3 = imagePath3;
	}
	public int getIsPublic()
	{
		return isPublic;
	}
	public void setIsPublic(int isPublic)
	{
		this.isPublic = isPublic;
	}
	public String getCreatedAt()
	{
		return createdAt;
	}
	public void setCreatedAt(String createdAt)
	{
		this.createdAt = createdAt;
	}
	
    
}
