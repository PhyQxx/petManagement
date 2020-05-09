package com.data.dao;

import com.data.entity.FosterEntity;
import com.framework.core.IBaseManageDao;

/**
 * 活体出售记录DAO
 */
public interface IFosterDao extends IBaseManageDao<FosterEntity> {

	//根据ID获取用户信息
	public FosterEntity getById(String id);
	
}