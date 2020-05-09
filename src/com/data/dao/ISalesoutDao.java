package com.data.dao;

import com.data.entity.SalesoutEntity;
import com.framework.core.IBaseManageDao;

/**
 * DAO
 */
public interface ISalesoutDao extends IBaseManageDao<SalesoutEntity> {

	//根据ID获取用户信息
	public SalesoutEntity getById(String id);
	
}