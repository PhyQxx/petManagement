package com.data.entity;

import com.framework.core.BaseManageEntity;

/**
 * m_pet 宠物信息
 */
public class PetEntity extends BaseManageEntity {
	private String id; // ID
	private String no; // 宠物编号
	private String name; // 宠物姓名
	private String sex; // 宠物性别
	private String birthday; // 宠物生日
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
		return "PetEntity [id=" + id + ", no=" + no + ", name=" + name + ", sex=" + sex + ", birthday=" + birthday
				+ ", remark=" + remark + ",delFlag=" + delFlag + "]";
	}

}
