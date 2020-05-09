package com.data.entity;

import com.framework.core.BaseManageEntity;

/**
 * m_payable-应付管理
 */
public class PayableEntity extends BaseManageEntity {
	private String id; // ID
	private String no; // 订单编号
	private String price; // 应付金额
	private String types; // 付款状态
	private String payer; // 付款人
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getTypes() {
		return types;
	}

	public void setTypes(String types) {
		this.types = types;
	}

	public String getPayer() {
		return payer;
	}

	public void setPayer(String payer) {
		this.payer = payer;
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
		return "PetcareEntity [id=" + id + ", no=" + no + ", price=" + price + ", types=" + types + ", payer=" + payer
				+ ", time=" + time + ", remark=" + remark + ",delFlag=" + delFlag + "]";
	}

}
