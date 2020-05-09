package com.data.entity;

import com.framework.core.BaseManageEntity;

/**
 * m_sales-菜单表
 */
public class SalesEntity extends BaseManageEntity {

	private String id; // ID
	private String breed; // 宠物品种
	private String sex; // 宠物性别
	private String birthday; // 宠物生日
	private String price; // 宠物价格
	private String time; // 出售时间
	private String buyer;// 购买人
	private String seller; // 出售人
	private String remark; // 备注
	private String delFlag; //删除状态
	private String userName;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "SalesEntity [id=" + id + ", breed=" + breed + ", sex=" + sex + ", birthday="
				+ birthday + ", price=" + price + ", time=" + time + ", buyer=" + buyer+", seller=" + seller
				+ ", remark=" + remark  + ",delFlag=" + delFlag+ "]";
	}

}
