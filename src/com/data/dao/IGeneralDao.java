package com.data.dao;

import com.data.entity.GeneralEntity;
import com.framework.core.IBaseManageDao;

/**
  *   总账管理DAO
 */
public interface IGeneralDao extends IBaseManageDao<GeneralEntity> {

	public GeneralEntity getById(String id);
	
}