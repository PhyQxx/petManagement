package com.data.entity;

import com.framework.core.BaseManageEntity;

/**
 * m_stock 库存结余
 */
public class StockEntity extends BaseManageEntity {
	private String id; // ID
	private String no; // 商品编号
	private String name; // 商品名称
	private String qty; // 库存数量
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

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
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
		return "StockEntity [id=" + id + ", no=" + no + ", name=" + name 
				+ ", qty=" + qty + ", remark=" + remark + ",delFlag=" + delFlag + "]";
	}

}
