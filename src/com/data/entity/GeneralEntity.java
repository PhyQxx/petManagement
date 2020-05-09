package com.data.entity;

import com.framework.core.BaseManageEntity;

/**
 * m_general-总账管理
 */
public class GeneralEntity extends BaseManageEntity {
	private String id; // ID
	private String no; // 账单编号
	private String types; // 账单类型
	private String time; // 日期
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
		return "GeneralEntity [id=" + id + ", no=" + no + ", types=" + types + ", time=" + time + ", remark=" + remark
				+ ",delFlag=" + delFlag + "]";
	}

}
