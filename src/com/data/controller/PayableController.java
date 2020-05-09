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
import com.data.entity.PayableEntity;
import com.data.service.PayableService;
import com.framework.core.BaseManageController;
import com.framework.core.SessionManageEntity;
import com.framework.util.StringUtil;
/**
 * 
 * @author 
 */
@Scope("prototype")
@Controller
@RequestMapping("/payableController")
public class PayableController extends BaseManageController {

	@Resource
	private PayableService payableService;

	/**
	 * 打开首页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/subMain" })
	public String subMain() throws IOException {
		// 初始化帮助信息和功能权限信息
		super.setCommonAttribute(request);
		return "payable/payableList";
	}

	/**
	 * 打开编辑页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/openEditPage" })
	public String openEditPage(String id) throws IOException {
		SessionManageEntity payable = SessionUtil.getSession(request);
//		String currentPayableRoleId = payable.getId();
		PayableEntity editPayable = null;
		if (StringUtil.isNotNull(id)) {
			editPayable = payableService.getPayableById(id);
		}
		request.setAttribute("editPayable", editPayable);
//		request.setAttribute("currentPayableRoleId", currentPayableRoleId);
		return "payable/payableEdit";
	}

	/**
	 * 查询用户列表
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = { "/selectPayableList" })
	public Map<String, Object> selectPayableList(PayableEntity paraPayable) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", payableService.countPayable(paraPayable));
		map.put("rows", payableService.listPayable(paraPayable));
		return map;
	}

	/**
	 * 新增用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/insertPayable" })
	public int insertPayable(PayableEntity paraPayable) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraPayable.setCreate_by(user.getUserId());
		return payableService.insertPayable(paraPayable);
	}

	/**
	 * 修改用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/updatePayable" })
	public long updatePayable(PayableEntity paraPayable) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraPayable.setUpdateBy(payable.getId());
		return payableService.updatePayable(paraPayable);
	}
	
	
	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/deletePayable" })
	public int deleteSales(Model model,String Ids) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentSalesId = user.getId();
		String editPayableIds = user.getUserId();
		if (StringUtil.isNotNull(Ids)) {
			return payableService.deletePayableByIds(Ids,editPayableIds, currentSalesId);
		}
		return 0;
	}
}
