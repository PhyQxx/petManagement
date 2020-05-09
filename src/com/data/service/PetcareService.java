package com.data.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.data.dao.IPetcareDao;
import com.data.entity.PetcareEntity;

/**
 * service
 */
@Service
public class PetcareService {

	@Resource
	private IPetcareDao petcareDao;

	/**
	 * 新增
	 */
	public int insertPetcare(PetcareEntity petcare) {
		int result = 0;

		result = this.petcareDao.insert(petcare);

		return result;
	}

	/**
	 * 通过id查询
	 */

	public PetcareEntity getPetcareById(String id) {
		return this.petcareDao.getById(id);
	}

	/**
	 * 通过条件查询多个用户
	 */

	public List<PetcareEntity> listPetcare(PetcareEntity petcare) {
		return this.petcareDao.list(petcare);
	}

	/**
	 * 通过条件统计用户
	 */

	public long countPetcare(PetcareEntity petcare) {
		return this.petcareDao.count(petcare);
	}

	/**
	 * 更新用户
	 */

	public long updatePetcare(PetcareEntity petcare) {
		return this.petcareDao.update(petcare);
	}

	/**
	 * 批量删除用户
	 */

	public int deletePetcareByIds(String Ids, String editUserIds, String updateBy) {
		int result = 0;

		String[] arrayUserIds = Ids.split(",");
		if (arrayUserIds.length > 0) {
			for (int i = 0; i < arrayUserIds.length; i++) {
				int tmpResult = this.petcareDao.deleteById(arrayUserIds[i], updateBy);
				result = result + tmpResult;
			}
		}
		return result;
	}

}