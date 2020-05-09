package com.data.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.data.dao.ISalesDao;
import com.data.entity.SalesEntity;

/**
 * service
 */
@Service
public class SalesService {

	@Resource
	private ISalesDao salesDao;

	/**
	 * 新增
	 */
	public int insertSales(SalesEntity sales) {
		int result = 0;

		result = this.salesDao.insert(sales);

		return result;
	}

	/**
	 * 通过id查询
	 */

	public SalesEntity getSalesById(String id) {
		return this.salesDao.getById(id);
	}

	/**
	 * 通过条件查询多个用户
	 */

	public List<SalesEntity> listSales(SalesEntity sales) {
		return this.salesDao.list(sales);
	}

	/**
	 * 通过条件统计用户
	 */

	public long countSales(SalesEntity sales) {
		return this.salesDao.count(sales);
	}

	/**
	 * 更新用户
	 */

	public long updateSales(SalesEntity sales) {
		return this.salesDao.update(sales);
	}

	/**
	 * 批量删除用户
	 */

	public int deleteSalesByIds(String Ids, String editUserIds, String updateBy) {
		int result = 0;

		String[] arrayUserIds = Ids.split(",");
		if (arrayUserIds.length > 0) {
			for (int i = 0; i < arrayUserIds.length; i++) {
				int tmpResult = this.salesDao.deleteById(arrayUserIds[i], updateBy);
				result = result + tmpResult;
			}
		}
		return result;
	}

}