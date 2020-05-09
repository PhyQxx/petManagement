package com.data.dao;

import java.util.List;

import com.data.entity.ComboBox;

/**
 * 通用 DAO
 */
public interface ICommonDao {

	/* 获取角色查询下拉列表 */
	public List<ComboBox> getSearchRoleList();

	/* 获取角色编辑下拉列表 */
	public List<ComboBox> getEditRoleList();

}