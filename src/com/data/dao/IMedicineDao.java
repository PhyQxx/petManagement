package com.data.dao;

import com.data.entity.MedicineEntity;
import com.framework.core.IBaseManageDao;

/**
 * DAO
 */
public interface IMedicineDao extends IBaseManageDao<MedicineEntity> {

	//根据ID获取用户信息
	public MedicineEntity getById(String id);
	
}