package com.data.entity;

import com.framework.core.BaseManageEntity;

/**
 * m_foster-
 */
public class ActivityEntity extends BaseManageEntity {
	private String id; // ID
	private String no; // 活动编号
	private String name; // 活动名称
	private String content; //活动内容
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


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
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
		return "ActivityEntity [id=" + id + ", no="
				+ no + ", name=" + name + ", content=" + content +", time=" + time
				+ ", remark=" + remark  + ",delFlag=" + delFlag + "]";
	}

}
