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
import com.data.entity.PurchaseEntity;
import com.data.service.PurchaseService;
import com.framework.core.BaseManageController;
import com.framework.core.SessionManageEntity;
import com.framework.util.StringUtil;
/**
 * 
 * @author 
 */
@Scope("prototype")
@Controller
@RequestMapping("/purchaseController")
public class PurchaseController extends BaseManageController {

	@Resource
	private PurchaseService purchaseService;

	/**
	 * 打开首页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/subMain" })
	public String subMain() throws IOException {
		// 初始化帮助信息和功能权限信息
		super.setCommonAttribute(request);
		return "purchase/purchaseList";
	}

	/**
	 * 打开编辑页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/openEditPage" })
	public String openEditPage(String id) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentPurchaseRoleId = user.getId();
		PurchaseEntity editPurchase = null;
		if (StringUtil.isNotNull(id)) {
			editPurchase = purchaseService.getPurchaseById(id);
		}
		request.setAttribute("editPurchase", editPurchase);
//		request.setAttribute("currentPurchaseRoleId", currentPurchaseRoleId);
		return "purchase/purchaseEdit";
	}

	/**
	 * 查询用户列表
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = { "/selectPurchaseList" })
	public Map<String, Object> selectPurchaseList(PurchaseEntity paraPurchase) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", purchaseService.countPurchase(paraPurchase));
		map.put("rows", purchaseService.listPurchase(paraPurchase));
		return map;
	}

	/**
	 * 新增用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/insertPurchase" })
	public int insertPurchase(PurchaseEntity paraPurchase) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraPurchase.setCreate_by(user.getUserId());
		return purchaseService.insertPurchase(paraPurchase);
	}

	/**
	 * 修改用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/updatePurchase" })
	public long updatePurchase(PurchaseEntity paraPurchase) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraPurchase.setUpdateBy(user.getId());
		return purchaseService.updatePurchase(paraPurchase);
	}
	
	
	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/deletePurchase" })
	public int deleteSales(Model model,String Ids) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentSalesId = user.getId();
		String editPurchaseIds = user.getUserId();
		if (StringUtil.isNotNull(Ids)) {
			return purchaseService.deletePurchaseByIds(Ids,editPurchaseIds, currentSalesId);
		}
		return 0;
	}
}
