package com.data.dao;

import com.data.entity.PetEntity;
import com.framework.core.IBaseManageDao;

/**
 * 宠物信息DAO
 */
public interface IPetDao extends IBaseManageDao<PetEntity> {

	public PetEntity getById(String id);
	
}