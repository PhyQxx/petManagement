package com.data.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.data.dao.IPetDao;
import com.data.entity.PetEntity;

/**
 * service
 */
@Service
public class PetService {

	@Resource
	private IPetDao petDao;

	/**
	 * 新增
	 */
	public int insertPet(PetEntity pet) {
		int result = 0;

		result = this.petDao.insert(pet);

		return result;
	}

	/**
	 * 通过id查询
	 */

	public PetEntity getPetById(String id) {
		return this.petDao.getById(id);
	}

	/**
	 * 通过条件查询多个用户
	 */

	public List<PetEntity> listPet(PetEntity pet) {
		return this.petDao.list(pet);
	}

	/**
	 * 通过条件统计用户
	 */

	public long countPet(PetEntity pet) {
		return this.petDao.count(pet);
	}

	/**
	 * 更新用户
	 */

	public long updatePet(PetEntity pet) {
		return this.petDao.update(pet);
	}

	/**
	 * 批量删除用户
	 */

	public int deletePetByIds(String Ids, String editUserIds, String updateBy) {
		int result = 0;

		String[] arrayUserIds = Ids.split(",");
		if (arrayUserIds.length > 0) {
			for (int i = 0; i < arrayUserIds.length; i++) {
				int tmpResult = this.petDao.deleteById(arrayUserIds[i], updateBy);
				result = result + tmpResult;
			}
		}
		return result;
	}

}