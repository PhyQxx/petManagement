package com.data.dao;

import com.data.entity.StockEntity;
import com.framework.core.IBaseManageDao;

/**
 * 库存结余DAO
 */
public interface IStockDao extends IBaseManageDao<StockEntity> {

	//根据ID获取用户信息
	public StockEntity getById(String id);
	
}