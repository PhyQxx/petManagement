package com.data.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.data.dao.IMoneyDao;
import com.data.entity.MoneyEntity;

/**
 * service
 */
@Service
public class MoneyService {

	@Resource
	private IMoneyDao MoneyDao;

	/**
	 * 新增
	 */
	public int insertMoney(MoneyEntity Money) {
		int result = 0;

		result = this.MoneyDao.insert(Money);

		return result;
	}

	/**
	 * 通过id查询
	 */

	public MoneyEntity getMoneyById(String id) {
		return this.MoneyDao.getById(id);
	}

	/**
	 * 通过条件查询多个用户
	 */

	public List<MoneyEntity> listMoney(MoneyEntity Money) {
		return this.MoneyDao.list(Money);
	}

	/**
	 * 通过条件统计用户
	 */

	public long countMoney(MoneyEntity Money) {
		return this.MoneyDao.count(Money);
	}

	/**
	 * 更新用户
	 */

	public long updateMoney(MoneyEntity Money) {
		return this.MoneyDao.update(Money);
	}

	/**
	 * 批量删除用户
	 */

	public int deleteMoneyByIds(String Ids, String editUserIds, String updateBy) {
		int result = 0;

		String[] arrayUserIds = Ids.split(",");
		if (arrayUserIds.length > 0) {
			for (int i = 0; i < arrayUserIds.length; i++) {
				int tmpResult = this.MoneyDao.deleteById(arrayUserIds[i], updateBy);
				result = result + tmpResult;
			}
		}
		return result;
	}

}