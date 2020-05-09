package com.data.dao;

import com.data.entity.ActivityEntity;
import com.framework.core.IBaseManageDao;

/**
 * 活体出售记录DAO
 */
public interface IActivityDao extends IBaseManageDao<ActivityEntity> {

	//根据ID获取用户信息
	public ActivityEntity getById(String id);
	
}