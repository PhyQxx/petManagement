package com.data.entity;

import com.framework.core.BaseManageEntity;

/**
 * m_money
 * 
 */
/**
 * @author DG
 *
 */
public class MoneyEntity extends BaseManageEntity {
	private String id; // ID
	private String no; // 员工编号
	private String name; // 员工姓名
	private String content; //员工薪资
	private String time; // 工作时间
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
		return "moneyEntity [id=" + id + ", no=" + no + ", name=" + name + ", content=" + content + ", time=" + time
				+ ", remark=" + remark + ", delFlag=" + delFlag + "]";
	}
	

}
