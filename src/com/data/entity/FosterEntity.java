package com.data.entity;

import com.framework.core.BaseManageEntity;

/**
 * m_foster-寄养
 */
public class FosterEntity extends BaseManageEntity {
	private String id; // ID
	private String person; // 寄养人
	private String phone; // 联系电话
	private String no; // 宠物编号
	private String name; // 宠物姓名
	private String price; //寄养费用
	private String create_by;// 操作人
	private String time; // 寄养日期
	private String remark; // 备注
	private String delFlag; //删除状态
	private String userName;
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getCreate_by() {
		return create_by;
	}

	public void setCreate_by(String create_by) {
		this.create_by = create_by;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
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
		return "FosterEntity [id=" + id + ", person=" + person + ", phone=" + phone + ", no="
				+ no + ", name=" + name + ", price=" + price + ", create_by=" + create_by+", time=" + time
				+ ", remark=" + remark  + ",delFlag=" + delFlag + "]";
	}

}
