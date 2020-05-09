package com.data.dao;

import com.data.entity.SubscribeEntity;
import com.framework.core.IBaseManageDao;

/**
 * 客户预约提醒DAO
 */
public interface ISubscribeDao extends IBaseManageDao<SubscribeEntity> {

	public SubscribeEntity getById(String id);
	
}