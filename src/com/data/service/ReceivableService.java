package com.data.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.data.dao.IReceivableDao;
import com.data.entity.ReceivableEntity;

/**
 * service
 */
@Service
public class ReceivableService {

	@Resource
	private IReceivableDao receivableDao;

	/**
	 * 新增
	 */
	public int insertReceivable(ReceivableEntity receivable) {
		int result = 0;

		result = this.receivableDao.insert(receivable);

		return result;
	}

	/**
	 * 通过id查询
	 */

	public ReceivableEntity getReceivableById(String id) {
		return this.receivableDao.getById(id);
	}

	/**
	 * 通过条件查询多个用户
	 */

	public List<ReceivableEntity> listReceivable(ReceivableEntity receivable) {
		return this.receivableDao.list(receivable);
	}

	/**
	 * 通过条件统计用户
	 */

	public long countReceivable(ReceivableEntity receivable) {
		return this.receivableDao.count(receivable);
	}

	/**
	 * 更新用户
	 */

	public long updateReceivable(ReceivableEntity receivable) {
		return this.receivableDao.update(receivable);
	}

	/**
	 * 批量删除用户
	 */

	public int deleteReceivableByIds(String Ids, String editUserIds, String updateBy) {
		int result = 0;

		String[] arrayUserIds = Ids.split(",");
		if (arrayUserIds.length > 0) {
			for (int i = 0; i < arrayUserIds.length; i++) {
				int tmpResult = this.receivableDao.deleteById(arrayUserIds[i], updateBy);
				result = result + tmpResult;
			}
		}
		return result;
	}

}