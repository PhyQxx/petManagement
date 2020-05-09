package com.data.entity;

import com.framework.core.BaseManageEntity;

/**
 * m_Curing
 */
public class CuringEntity extends BaseManageEntity {
	private String id; // ID
	private String no; // 宠物编号
	private String name; // 宠物姓名
	private String phone; // 联系电话
	private String weight; // 宠物体重
	private String types; // 养护类型
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

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
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
		return "CuringEntity [id=" + id + ", no=" + no + ", name=" + name + ", phone=" + phone + ", weight=" + weight
				+ ", types=" + types + ", time=" + time + ",delFlag=" + delFlag + ", remark=" + remark + "]";
	}

}
