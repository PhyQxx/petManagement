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
import com.data.entity.PetcareEntity;
import com.data.service.PetcareService;
import com.framework.core.BaseManageController;
import com.framework.core.SessionManageEntity;
import com.framework.util.StringUtil;
/**
 * 
 * @author 
 */
@Scope("prototype")
@Controller
@RequestMapping("/petcareController")
public class PetcareController extends BaseManageController {

	@Resource
	private PetcareService petcareService;

	/**
	 * 打开首页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/subMain" })
	public String subMain() throws IOException {
		// 初始化帮助信息和功能权限信息
		super.setCommonAttribute(request);
		return "petcare/petcareList";
	}

	/**
	 * 打开编辑页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/openEditPage" })
	public String openEditPage(String id) throws IOException {
		SessionManageEntity petcare = SessionUtil.getSession(request);
//		String currentPetcareRoleId = petcare.getId();
		PetcareEntity editPetcare = null;
		if (StringUtil.isNotNull(id)) {
			editPetcare = petcareService.getPetcareById(id);
		}
		request.setAttribute("editPetcare", editPetcare);
//		request.setAttribute("currentPetcareRoleId", currentPetcareRoleId);
		return "petcare/petcareEdit";
	}

	/**
	 * 查询用户列表
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = { "/selectPetcareList" })
	public Map<String, Object> selectPetcareList(PetcareEntity paraPetcare) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", petcareService.countPetcare(paraPetcare));
		map.put("rows", petcareService.listPetcare(paraPetcare));
		return map;
	}

	/**
	 * 新增用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/insertPetcare" })
	public int insertPetcare(PetcareEntity paraPetcare) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraPetcare.setCreate_by(user.getUserId());
		return petcareService.insertPetcare(paraPetcare);
	}

	/**
	 * 修改用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/updatePetcare" })
	public long updatePetcare(PetcareEntity paraPetcare) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraPetcare.setUpdateBy(petcare.getId());
		return petcareService.updatePetcare(paraPetcare);
	}
	
	
	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/deletePetcare" })
	public int deleteSales(Model model,String Ids) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentSalesId = user.getId();
		String editPetcareIds = user.getUserId();
		if (StringUtil.isNotNull(Ids)) {
			return petcareService.deletePetcareByIds(Ids,editPetcareIds, currentSalesId);
		}
		return 0;
	}
}
