package com.data.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.data.dao.ICuringDao;
import com.data.entity.CuringEntity;

/**
 * service
 */
@Service
public class CuringService {

	@Resource
	private ICuringDao curingDao;

	/**
	 * 新增
	 */
	public int insertCuring(CuringEntity curing) {
		int result = 0;

		result = this.curingDao.insert(curing);

		return result;
	}

	/**
	 * 通过id查询
	 */

	public CuringEntity getCuringById(String id) {
		return this.curingDao.getById(id);
	}

	/**
	 * 通过条件查询多个用户
	 */

	public List<CuringEntity> listCuring(CuringEntity curing) {
		return this.curingDao.list(curing);
	}

	/**
	 * 通过条件统计用户
	 */

	public long countCuring(CuringEntity curing) {
		return this.curingDao.count(curing);
	}

	/**
	 * 更新用户
	 */

	public long updateCuring(CuringEntity curing) {
		return this.curingDao.update(curing);
	}

	/**
	 * 批量删除用户
	 */

	public int deleteCuringByIds(String Ids, String editUserIds, String updateBy) {
		int result = 0;

		String[] arrayUserIds = Ids.split(",");
		if (arrayUserIds.length > 0) {
			for (int i = 0; i < arrayUserIds.length; i++) {
				int tmpResult = this.curingDao.deleteById(arrayUserIds[i], updateBy);
				result = result + tmpResult;
			}
		}
		return result;
	}

}