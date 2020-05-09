package com.data.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.data.dao.IPayableDao;
import com.data.entity.PayableEntity;

/**
 * service
 */
@Service
public class PayableService {

	@Resource
	private IPayableDao payableDao;

	/**
	 * 新增
	 */
	public int insertPayable(PayableEntity payable) {
		int result = 0;

		result = this.payableDao.insert(payable);

		return result;
	}

	/**
	 * 通过id查询
	 */

	public PayableEntity getPayableById(String id) {
		return this.payableDao.getById(id);
	}

	/**
	 * 通过条件查询多个用户
	 */

	public List<PayableEntity> listPayable(PayableEntity payable) {
		return this.payableDao.list(payable);
	}

	/**
	 * 通过条件统计用户
	 */

	public long countPayable(PayableEntity payable) {
		return this.payableDao.count(payable);
	}

	/**
	 * 更新用户
	 */

	public long updatePayable(PayableEntity payable) {
		return this.payableDao.update(payable);
	}

	/**
	 * 批量删除用户
	 */

	public int deletePayableByIds(String Ids, String editUserIds, String updateBy) {
		int result = 0;

		String[] arrayUserIds = Ids.split(",");
		if (arrayUserIds.length > 0) {
			for (int i = 0; i < arrayUserIds.length; i++) {
				int tmpResult = this.payableDao.deleteById(arrayUserIds[i], updateBy);
				result = result + tmpResult;
			}
		}
		return result;
	}

}