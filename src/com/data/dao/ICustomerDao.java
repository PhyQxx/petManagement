package com.data.dao;

import com.data.entity.CustomerEntity;
import com.framework.core.IBaseManageDao;

/**
 * 客户信息DAO
 */
public interface ICustomerDao extends IBaseManageDao<CustomerEntity> {

	//根据ID获取用户信息
	public CustomerEntity getById(String id);
	
}