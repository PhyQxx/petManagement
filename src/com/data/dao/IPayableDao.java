package com.data.dao;

import com.data.entity.PayableEntity;
import com.framework.core.IBaseManageDao;

/**
 * 应付管理DAO
 */
public interface IPayableDao extends IBaseManageDao<PayableEntity> {

	//根据ID获取用户信息
	public PayableEntity getById(String id);
	
}