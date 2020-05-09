package com.data.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.data.common.SessionUtil;
import com.data.entity.PetEntity;
import com.data.service.PetService;
import com.framework.core.BaseManageController;
import com.framework.core.SessionManageEntity;
import com.framework.util.StringUtil;
/**
 * 
 * @author 
 */
@Scope("prototype")
@Controller
@RequestMapping("/petController")
public class PetController extends BaseManageController {

	@Resource
	private PetService petService;

	/**
	 * 打开首页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/subMain" })
	public String subMain() throws IOException {
		// 初始化帮助信息和功能权限信息
		super.setCommonAttribute(request);
		return "pet/petList";
	}

	/**
	 * 打开编辑页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/openEditPage" })
	public String openEditPage(String id) throws IOException {
		SessionManageEntity pet = SessionUtil.getSession(request);
//		String currentPetRoleId = pet.getId();
		PetEntity editPet = null;
		if (StringUtil.isNotNull(id)) {
			editPet = petService.getPetById(id);
		}
		request.setAttribute("editPet", editPet);
//		request.setAttribute("currentPetRoleId", currentPetRoleId);
		return "pet/petEdit";
	}

	/**
	 * 查询用户列表
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = { "/selectPetList" })
	public Map<String, Object> selectPetList(PetEntity paraPet) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", petService.countPet(paraPet));
		map.put("rows", petService.listPet(paraPet));
		return map;
	}

	/**
	 * 新增用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/insertPet" })
	public int insertPet(PetEntity paraPet) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraPet.setCreate_by(user.getUserId());
		return petService.insertPet(paraPet);
	}

	/**
	 * 修改用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/updatePet" })
	public long updatePet(PetEntity paraPet) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraPet.setUpdateBy(pet.getId());
		return petService.updatePet(paraPet);
	}
	
	
	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/deletePet" })
	public int deleteSales(Model model,String Ids) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentSalesId = user.getId();
		String editPetIds = user.getUserId();
		if (StringUtil.isNotNull(Ids)) {
			return petService.deletePetByIds(Ids,editPetIds, currentSalesId);
		}
		return 0;
	}
}
