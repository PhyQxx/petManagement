package com.data.dao;

import com.data.entity.CuringEntity;
import com.framework.core.IBaseManageDao;

/**
 * DAO
 */
public interface ICuringDao extends IBaseManageDao<CuringEntity> {

	//根据ID获取用户信息
	public CuringEntity getById(String id);
	
}