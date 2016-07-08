package me.qxd.domain;

import java.util.Date;

public class Product {

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	private Integer id;

	private Double currentPrice;

	private Double standardPrice;

	private String name;

	private String picturePath;

	private String categoryId;

	private String url;

	private Date createDatetime;
	private String shortDescription;
	private String details;
	/* 扩展属性 */
	private Integer quantity;

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getCurrentprice() {
		return currentPrice;
	}

	public void setCurrentprice(Double currentprice) {
		this.currentPrice = currentprice;
	}

	public Double getStandardprice() {
		return standardPrice;
	}

	public void setStandardprice(Double standardprice) {
		this.standardPrice = standardprice;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getPicturepath() {
		return picturePath;
	}

	public void setPicturepath(String picturepath) {
		this.picturePath = picturepath == null ? null : picturepath.trim();
	}

	public String getCategoryid() {
		return categoryId;
	}

	public void setCategoryid(String categoryid) {
		this.categoryId = categoryid == null ? null : categoryid.trim();
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url == null ? null : url.trim();
	}

	public Date getCreatedatetime() {
		return createDatetime;
	}

	public void setCreatedatetime(Date createdatetime) {
		this.createDatetime = createdatetime;
	}
}