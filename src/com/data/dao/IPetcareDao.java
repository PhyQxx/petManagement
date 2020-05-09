package com.data.dao;

import com.data.entity.PetcareEntity;
import com.framework.core.IBaseManageDao;

/**
 * 活体出售记录DAO
 */
public interface IPetcareDao extends IBaseManageDao<PetcareEntity> {

	//根据ID获取用户信息
	public PetcareEntity getById(String id);
	
}