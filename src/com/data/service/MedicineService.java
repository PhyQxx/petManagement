package com.data.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.data.dao.IMedicineDao;
import com.data.entity.MedicineEntity;

/**
 * service
 */
@Service
public class MedicineService {

	@Resource
	private IMedicineDao medicineDao;

	/**
	 * 新增
	 */
	public int insertMedicine(MedicineEntity medicine) {
		int result = 0;

		result = this.medicineDao.insert(medicine);

		return result;
	}

	/**
	 * 通过id查询
	 */

	public MedicineEntity getMedicineById(String id) {
		return this.medicineDao.getById(id);
	}

	/**
	 * 通过条件查询多个用户
	 */

	public List<MedicineEntity> listMedicine(MedicineEntity medicine) {
		return this.medicineDao.list(medicine);
	}

	/**
	 * 通过条件统计用户
	 */

	public long countMedicine(MedicineEntity medicine) {
		return this.medicineDao.count(medicine);
	}

	/**
	 * 更新用户
	 */

	public long updateMedicine(MedicineEntity medicine) {
		return this.medicineDao.update(medicine);
	}

	/**
	 * 批量删除用户
	 */

	public int deleteMedicineByIds(String Ids, String editUserIds, String updateBy) {
		int result = 0;

		String[] arrayUserIds = Ids.split(",");
		if (arrayUserIds.length > 0) {
			for (int i = 0; i < arrayUserIds.length; i++) {
				int tmpResult = this.medicineDao.deleteById(arrayUserIds[i], updateBy);
				result = result + tmpResult;
			}
		}
		return result;
	}

}