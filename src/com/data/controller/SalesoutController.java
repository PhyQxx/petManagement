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
import com.data.entity.SalesoutEntity;
import com.data.service.SalesoutService;
import com.framework.core.BaseManageController;
import com.framework.core.SessionManageEntity;
import com.framework.util.StringUtil;
/**
 * 
 * @author 
 */
@Scope("prototype")
@Controller
@RequestMapping("/salesoutController")
public class SalesoutController extends BaseManageController {

	@Resource
	private SalesoutService salesoutService;

	/**
	 * 打开首页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/subMain" })
	public String subMain() throws IOException {
		// 初始化帮助信息和功能权限信息
		super.setCommonAttribute(request);
		return "salesout/salesoutList";
	}

	/**
	 * 打开编辑页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/openEditPage" })
	public String openEditPage(String id) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentSalesoutRoleId = user.getId();
		SalesoutEntity editSalesout = null;
		if (StringUtil.isNotNull(id)) {
			editSalesout = salesoutService.getSalesoutById(id);
		}
		request.setAttribute("editSalesout", editSalesout);
//		request.setAttribute("currentSalesoutRoleId", currentSalesoutRoleId);
		return "salesout/salesoutEdit";
	}

	/**
	 * 查询用户列表
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = { "/selectSalesoutList" })
	public Map<String, Object> selectSalesoutList(SalesoutEntity paraSalesout) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", salesoutService.countSalesout(paraSalesout));
		map.put("rows", salesoutService.listSalesout(paraSalesout));
		return map;
	}

	/**
	 * 新增用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/insertSalesout" })
	public int insertSalesout(SalesoutEntity paraSalesout) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraSalesout.setCreate_by(user.getUserId());
		return salesoutService.insertSalesout(paraSalesout);
	}

	/**
	 * 修改用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/updateSalesout" })
	public long updateSalesout(SalesoutEntity paraSalesout) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraSalesout.setUpdateBy(user.getId());
		return salesoutService.updateSalesout(paraSalesout);
	}
	
	
	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/deleteSalesout" })
	public int deleteSales(Model model,String Ids) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentSalesId = user.getId();
		String editSalesoutIds = user.getUserId();
		if (StringUtil.isNotNull(Ids)) {
			return salesoutService.deleteSalesoutByIds(Ids,editSalesoutIds, currentSalesId);
		}
		return 0;
	}
}
