package com.data.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.data.dao.ICustomerDao;
import com.data.entity.CustomerEntity;

/**
 * service
 */
@Service
public class CustomerService {

	@Resource
	private ICustomerDao customerDao;

	/**
	 * 新增
	 */
	public int insertCustomer(CustomerEntity customer) {
		int result = 0;

		result = this.customerDao.insert(customer);

		return result;
	}

	/**
	 * 通过id查询
	 */

	public CustomerEntity getCustomerById(String id) {
		return this.customerDao.getById(id);
	}

	/**
	 * 通过条件查询多个用户
	 */

	public List<CustomerEntity> listCustomer(CustomerEntity customer) {
		return this.customerDao.list(customer);
	}

	/**
	 * 通过条件统计用户
	 */

	public long countCustomer(CustomerEntity customer) {
		return this.customerDao.count(customer);
	}

	/**
	 * 更新用户
	 */

	public long updateCustomer(CustomerEntity customer) {
		return this.customerDao.update(customer);
	}

	/**
	 * 批量删除用户
	 */

	public int deleteCustomerByIds(String Ids, String editUserIds, String updateBy) {
		int result = 0;

		String[] arrayUserIds = Ids.split(",");
		if (arrayUserIds.length > 0) {
			for (int i = 0; i < arrayUserIds.length; i++) {
				int tmpResult = this.customerDao.deleteById(arrayUserIds[i], updateBy);
				result = result + tmpResult;
			}
		}
		return result;
	}

}