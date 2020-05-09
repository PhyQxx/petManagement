package com.data.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.data.dao.IGeneralDao;
import com.data.entity.GeneralEntity;

/**
 * service
 */
@Service
public class GeneralService {

	@Resource
	private IGeneralDao generalDao;

	/**
	 * 新增
	 */
	public int insertGeneral(GeneralEntity general) {
		int result = 0;

		result = this.generalDao.insert(general);

		return result;
	}

	/**
	 * 通过id查询
	 */

	public GeneralEntity getGeneralById(String id) {
		return this.generalDao.getById(id);
	}

	/**
	 * 通过条件查询多个用户
	 */

	public List<GeneralEntity> listGeneral(GeneralEntity general) {
		return this.generalDao.list(general);
	}

	/**
	 * 通过条件统计用户
	 */

	public long countGeneral(GeneralEntity general) {
		return this.generalDao.count(general);
	}

	/**
	 * 更新用户
	 */

	public long updateGeneral(GeneralEntity general) {
		return this.generalDao.update(general);
	}

	/**
	 * 批量删除用户
	 */

	public int deleteGeneralByIds(String Ids, String editUserIds, String updateBy) {
		int result = 0;

		String[] arrayUserIds = Ids.split(",");
		if (arrayUserIds.length > 0) {
			for (int i = 0; i < arrayUserIds.length; i++) {
				int tmpResult = this.generalDao.deleteById(arrayUserIds[i], updateBy);
				result = result + tmpResult;
			}
		}
		return result;
	}

}