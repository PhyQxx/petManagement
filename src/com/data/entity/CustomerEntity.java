package com.data.entity;

import com.framework.core.BaseManageEntity;

/**
 * m_Customer 客户信息
 */
public class CustomerEntity extends BaseManageEntity {
	private String id; // ID
	private String no; // 客户编号
	private String name; // 客户姓名
	private String phone; // 联系电话
	private String petno; // 宠物编号
	private String member; // 是否是会员
	private String remark; // 备注
	private String delFlag; // 删除状态

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPetno() {
		return petno;
	}

	public void setPetno(String petno) {
		this.petno = petno;
	}

	public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
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

	@Override
	public String toString() {
		return "CustomerEntity [id=" + id + ", no=" + no + ", name=" + name + ", phone=" + phone + ", petno=" + petno
				+ ", member=" + member + ", remark=" + remark + ",delFlag=" + delFlag + "]";
	}

}
