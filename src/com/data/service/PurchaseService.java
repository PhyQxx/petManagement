package com.data.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.data.dao.IPurchaseDao;
import com.data.entity.PurchaseEntity;

/**
 * service
 */
@Service
public class PurchaseService {

	@Resource
	private IPurchaseDao purchaseDao;

	/**
	 * 新增
	 */
	public int insertPurchase(PurchaseEntity purchase) {
		int result = 0;

		result = this.purchaseDao.insert(purchase);

		return result;
	}

	/**
	 * 通过id查询
	 */

	public PurchaseEntity getPurchaseById(String id) {
		return this.purchaseDao.getById(id);
	}

	/**
	 * 通过条件查询多个用户
	 */

	public List<PurchaseEntity> listPurchase(PurchaseEntity purchase) {
		return this.purchaseDao.list(purchase);
	}

	/**
	 * 通过条件统计用户
	 */

	public long countPurchase(PurchaseEntity purchase) {
		return this.purchaseDao.count(purchase);
	}

	/**
	 * 更新用户
	 */

	public long updatePurchase(PurchaseEntity purchase) {
		return this.purchaseDao.update(purchase);
	}

	/**
	 * 批量删除用户
	 */

	public int deletePurchaseByIds(String Ids, String editUserIds, String updateBy) {
		int result = 0;

		String[] arrayUserIds = Ids.split(",");
		if (arrayUserIds.length > 0) {
			for (int i = 0; i < arrayUserIds.length; i++) {
				int tmpResult = this.purchaseDao.deleteById(arrayUserIds[i], updateBy);
				result = result + tmpResult;
			}
		}
		return result;
	}

}