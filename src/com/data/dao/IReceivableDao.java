package com.data.dao;

import com.data.entity.ReceivableEntity;
import com.framework.core.IBaseManageDao;

/**
 * 应收管理DAO
 */
public interface IReceivableDao extends IBaseManageDao<ReceivableEntity> {

	public ReceivableEntity getById(String id);
	
}