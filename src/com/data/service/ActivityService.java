package com.data.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.data.dao.IActivityDao;
import com.data.entity.ActivityEntity;

/**
 * service
 */
@Service
public class ActivityService {

	@Resource
	private IActivityDao activityDao;

	/**
	 * 新增
	 */
	public int insertActivity(ActivityEntity activity) {
		int result = 0;

		result = this.activityDao.insert(activity);

		return result;
	}

	/**
	 * 通过id查询
	 */

	public ActivityEntity getActivityById(String id) {
		return this.activityDao.getById(id);
	}

	/**
	 * 通过条件查询多个用户
	 */

	public List<ActivityEntity> listActivity(ActivityEntity activity) {
		return this.activityDao.list(activity);
	}

	/**
	 * 通过条件统计用户
	 */

	public long countActivity(ActivityEntity activity) {
		return this.activityDao.count(activity);
	}

	/**
	 * 更新用户
	 */

	public long updateActivity(ActivityEntity activity) {
		return this.activityDao.update(activity);
	}

	/**
	 * 批量删除用户
	 */

	public int deleteActivityByIds(String Ids, String editUserIds, String updateBy) {
		int result = 0;

		String[] arrayUserIds = Ids.split(",");
		if (arrayUserIds.length > 0) {
			for (int i = 0; i < arrayUserIds.length; i++) {
				int tmpResult = this.activityDao.deleteById(arrayUserIds[i], updateBy);
				result = result + tmpResult;
			}
		}
		return result;
	}

}