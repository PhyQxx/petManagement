package com.data.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.data.dao.IFosterDao;
import com.data.entity.FosterEntity;

/**
 * service
 */
@Service
public class FosterService {

	@Resource
	private IFosterDao fosterDao;

	/**
	 * 新增
	 */
	public int insertFoster(FosterEntity foster) {
		int result = 0;

		result = this.fosterDao.insert(foster);

		return result;
	}

	/**
	 * 通过id查询
	 */

	public FosterEntity getFosterById(String id) {
		return this.fosterDao.getById(id);
	}

	/**
	 * 通过条件查询多个用户
	 */

	public List<FosterEntity> listFoster(FosterEntity foster) {
		return this.fosterDao.list(foster);
	}

	/**
	 * 通过条件统计用户
	 */

	public long countFoster(FosterEntity foster) {
		return this.fosterDao.count(foster);
	}

	/**
	 * 更新用户
	 */

	public long updateFoster(FosterEntity foster) {
		return this.fosterDao.update(foster);
	}

	/**
	 * 批量删除用户
	 */

	public int deleteFosterByIds(String Ids, String editUserIds, String updateBy) {
		int result = 0;

		String[] arrayUserIds = Ids.split(",");
		if (arrayUserIds.length > 0) {
			for (int i = 0; i < arrayUserIds.length; i++) {
				int tmpResult = this.fosterDao.deleteById(arrayUserIds[i], updateBy);
				result = result + tmpResult;
			}
		}
		return result;
	}

}