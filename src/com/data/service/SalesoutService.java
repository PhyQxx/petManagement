package com.data.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.data.dao.ISalesoutDao;
import com.data.entity.SalesoutEntity;

/**
 * service
 */
@Service
public class SalesoutService {

	@Resource
	private ISalesoutDao salesoutDao;

	/**
	 * 新增
	 */
	public int insertSalesout(SalesoutEntity salesout) {
		int result = 0;

		result = this.salesoutDao.insert(salesout);

		return result;
	}

	/**
	 * 通过id查询
	 */

	public SalesoutEntity getSalesoutById(String id) {
		return this.salesoutDao.getById(id);
	}

	/**
	 * 通过条件查询多个用户
	 */

	public List<SalesoutEntity> listSalesout(SalesoutEntity salesout) {
		return this.salesoutDao.list(salesout);
	}

	/**
	 * 通过条件统计用户
	 */

	public long countSalesout(SalesoutEntity salesout) {
		return this.salesoutDao.count(salesout);
	}

	/**
	 * 更新用户
	 */

	public long updateSalesout(SalesoutEntity salesout) {
		return this.salesoutDao.update(salesout);
	}

	/**
	 * 批量删除用户
	 */

	public int deleteSalesoutByIds(String Ids, String editUserIds, String updateBy) {
		int result = 0;

		String[] arrayUserIds = Ids.split(",");
		if (arrayUserIds.length > 0) {
			for (int i = 0; i < arrayUserIds.length; i++) {
				int tmpResult = this.salesoutDao.deleteById(arrayUserIds[i], updateBy);
				result = result + tmpResult;
			}
		}
		return result;
	}

}