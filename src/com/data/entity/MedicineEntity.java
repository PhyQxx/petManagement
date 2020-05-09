package com.data.entity;

import com.framework.core.BaseManageEntity;

/**
 * m_foster-
 */
public class MedicineEntity extends BaseManageEntity {
	private String id; // ID
	private String no; // 宠物编号
	private String name; // 宠物姓名
	private String phone; // 联系电话
	private String bedno; // 床位号
	private String disease; // 疾病名称
	private String time; // 日期
	private String delFlag; // 删除状态
	private String remark; // 备注

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

	public String getBedno() {
		return bedno;
	}

	public void setBedno(String bedno) {
		this.bedno = bedno;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "MedicineEntity [id=" + id + ", no=" + no + ", name=" + name + ", phone=" + phone + ", bedno=" + bedno
				+ ", disease=" + disease + ", time=" + time + ",delFlag=" + delFlag + ", remark=" + remark + "]";
	}

}
