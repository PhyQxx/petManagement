package com.data.dao;

import com.data.entity.PurchaseEntity;
import com.framework.core.IBaseManageDao;

/**
 * DAO
 */
public interface IPurchaseDao extends IBaseManageDao<PurchaseEntity> {

	//根据ID获取用户信息
	public PurchaseEntity getById(String id);
	
}