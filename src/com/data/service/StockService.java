package com.data.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.data.dao.IStockDao;
import com.data.entity.StockEntity;

/**
 * service
 */
@Service
public class StockService {

	@Resource
	private IStockDao stockDao;

	/**
	 * 新增
	 */
	public int insertStock(StockEntity stock) {
		int result = 0;

		result = this.stockDao.insert(stock);

		return result;
	}

	/**
	 * 通过id查询
	 */

	public StockEntity getStockById(String id) {
		return this.stockDao.getById(id);
	}

	/**
	 * 通过条件查询多个用户
	 */

	public List<StockEntity> listStock(StockEntity stock) {
		return this.stockDao.list(stock);
	}

	/**
	 * 通过条件统计用户
	 */

	public long countStock(StockEntity stock) {
		return this.stockDao.count(stock);
	}

	/**
	 * 更新用户
	 */

	public long updateStock(StockEntity stock) {
		return this.stockDao.update(stock);
	}

	/**
	 * 批量删除用户
	 */

	public int deleteStockByIds(String Ids, String editUserIds, String updateBy) {
		int result = 0;

		String[] arrayUserIds = Ids.split(",");
		if (arrayUserIds.length > 0) {
			for (int i = 0; i < arrayUserIds.length; i++) {
				int tmpResult = this.stockDao.deleteById(arrayUserIds[i], updateBy);
				result = result + tmpResult;
			}
		}
		return result;
	}

}