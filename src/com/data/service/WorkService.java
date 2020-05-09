package com.data.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.data.dao.IWorkDao;
import com.data.entity.WorkEntity;

/**
 * service
 */
@Service
public class WorkService {

	@Resource
	private IWorkDao WorkDao;

	/**
	 * 新增
	 */
	public int insertWork(WorkEntity Work) {
		int result = 0;

		result = this.WorkDao.insert(Work);

		return result;
	}

	/**
	 * 通过id查询
	 */

	public WorkEntity getWorkById(String id) {
		return this.WorkDao.getById(id);
	}

	/**
	 * 通过条件查询多个用户
	 */

	public List<WorkEntity> listWork(WorkEntity Work) {
		return this.WorkDao.list(Work);
	}

	/**
	 * 通过条件统计用户
	 */

	public long countWork(WorkEntity Work) {
		return this.WorkDao.count(Work);
	}

	/**
	 * 更新用户
	 */

	public long updateWork(WorkEntity Work) {
		return this.WorkDao.update(Work);
	}

	/**
	 * 批量删除用户
	 */

	public int deleteWorkByIds(String Ids, String editUserIds, String updateBy) {
		int result = 0;

		String[] arrayUserIds = Ids.split(",");
		if (arrayUserIds.length > 0) {
			for (int i = 0; i < arrayUserIds.length; i++) {
				int tmpResult = this.WorkDao.deleteById(arrayUserIds[i], updateBy);
				result = result + tmpResult;
			}
		}
		return result;
	}

}