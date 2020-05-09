package com.data.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.data.dao.ISubscribeDao;
import com.data.entity.SubscribeEntity;

/**
 * service
 */
@Service
public class SubscribeService {

	@Resource
	private ISubscribeDao subscribeDao;

	/**
	 * 新增
	 */
	public int insertSubscribe(SubscribeEntity subscribe) {
		int result = 0;

		result = this.subscribeDao.insert(subscribe);

		return result;
	}

	/**
	 * 通过id查询
	 */

	public SubscribeEntity getSubscribeById(String id) {
		return this.subscribeDao.getById(id);
	}

	/**
	 * 通过条件查询多个用户
	 */

	public List<SubscribeEntity> listSubscribe(SubscribeEntity subscribe) {
		return this.subscribeDao.list(subscribe);
	}

	/**
	 * 通过条件统计用户
	 */

	public long countSubscribe(SubscribeEntity subscribe) {
		return this.subscribeDao.count(subscribe);
	}

	/**
	 * 更新用户
	 */

	public long updateSubscribe(SubscribeEntity subscribe) {
		return this.subscribeDao.update(subscribe);
	}

	/**
	 * 批量删除用户
	 */

	public int deleteSubscribeByIds(String Ids, String editUserIds, String updateBy) {
		int result = 0;

		String[] arrayUserIds = Ids.split(",");
		if (arrayUserIds.length > 0) {
			for (int i = 0; i < arrayUserIds.length; i++) {
				int tmpResult = this.subscribeDao.deleteById(arrayUserIds[i], updateBy);
				result = result + tmpResult;
			}
		}
		return result;
	}

}