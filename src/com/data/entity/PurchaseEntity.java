package com.data.entity;

import com.framework.core.BaseManageEntity;

/**
 * m_foster-
 */
public class PurchaseEntity extends BaseManageEntity {
	private String id; // ID
	private String orderno; // 订单编号
	private String goods; // 入库商品
	private String amount; // 商品数量
	private String time; // 日期
	private String delFlag; // 删除状态
	private String remark; // 备注

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public String getGoods() {
		return goods;
	}

	public void setGoods(String goods) {
		this.goods = goods;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
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
		return "PurchaseEntity [id=" + id + ", orderno=" + orderno + ", goods=" + goods + ", amount=" + amount
				+ ", time=" + time + ",delFlag=" + delFlag + ", remark=" + remark + "]";
	}

}
