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
import com.data.entity.MedicineEntity;
import com.data.service.MedicineService;
import com.framework.core.BaseManageController;
import com.framework.core.SessionManageEntity;
import com.framework.util.StringUtil;
/**
 * 
 * @author 
 */
@Scope("prototype")
@Controller
@RequestMapping("/medicineController")
public class MedicineController extends BaseManageController {

	@Resource
	private MedicineService medicineService;

	/**
	 * 打开首页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/subMain" })
	public String subMain() throws IOException {
		// 初始化帮助信息和功能权限信息
		super.setCommonAttribute(request);
		return "medicine/medicineList";
	}

	/**
	 * 打开编辑页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/openEditPage" })
	public String openEditPage(String id) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentMedicineRoleId = user.getId();
		MedicineEntity editMedicine = null;
		if (StringUtil.isNotNull(id)) {
			editMedicine = medicineService.getMedicineById(id);
		}
		request.setAttribute("editMedicine", editMedicine);
//		request.setAttribute("currentMedicineRoleId", currentMedicineRoleId);
		return "medicine/medicineEdit";
	}

	/**
	 * 查询用户列表
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = { "/selectMedicineList" })
	public Map<String, Object> selectMedicineList(MedicineEntity paraMedicine) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", medicineService.countMedicine(paraMedicine));
		map.put("rows", medicineService.listMedicine(paraMedicine));
		return map;
	}

	/**
	 * 新增用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/insertMedicine" })
	public int insertMedicine(MedicineEntity paraMedicine) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraMedicine.setCreate_by(user.getUserId());
		return medicineService.insertMedicine(paraMedicine);
	}

	/**
	 * 修改用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/updateMedicine" })
	public long updateMedicine(MedicineEntity paraMedicine) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraMedicine.setUpdateBy(user.getId());
		return medicineService.updateMedicine(paraMedicine);
	}
	
	
	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/deleteMedicine" })
	public int deleteSales(Model model,String Ids) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentSalesId = user.getId();
		String editMedicineIds = user.getUserId();
		if (StringUtil.isNotNull(Ids)) {
			return medicineService.deleteMedicineByIds(Ids,editMedicineIds, currentSalesId);
		}
		return 0;
	}
}
