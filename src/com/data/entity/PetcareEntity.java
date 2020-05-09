package com.data.entity;

import com.framework.core.BaseManageEntity;

/**
 * m_foster-
 */
public class PetcareEntity extends BaseManageEntity {
	private String id; // ID
	private String no; // 宠物编号
	private String name; // 宠物姓名
	private String phone; // 联系电话
	private String types; //美容类型
	private String time; // 日期
	private String remark; // 备注
	private String delFlag; //删除状态
	

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


	public String getTypes() {
		return types;
	}


	public void setTypes(String types) {
		this.types = types;
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


	@Override
	public String toString() {
		return "PetcareEntity [id=" + id + ", no="
				+ no + ", name=" + name + ", phone=" + phone + ", types=" + types +", time=" + time
				+ ", remark=" + remark  + ",delFlag=" + delFlag + "]";
	}

}
