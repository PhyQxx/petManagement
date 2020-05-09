package com.data.dao;

import com.data.entity.SalesEntity;
import com.framework.core.IBaseManageDao;

/**
 * 活体出售记录DAO
 */
public interface ISalesDao extends IBaseManageDao<SalesEntity> {

	//根据ID获取用户信息
	public SalesEntity getById(String id);
	
}