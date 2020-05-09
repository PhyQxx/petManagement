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
import com.data.entity.SalesEntity;
import com.data.service.SalesService;
import com.framework.core.BaseManageController;
import com.framework.core.SessionManageEntity;
import com.framework.util.StringUtil;
/**
 * 
 * @author 
 */
@Scope("prototype")
@Controller
@RequestMapping("/salesController")
public class SalesController extends BaseManageController {

	@Resource
	private SalesService salesService;

	/**
	 * 打开首页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/subMain" })
	public String subMain() throws IOException {
		// 初始化帮助信息和功能权限信息
		super.setCommonAttribute(request);
		return "sales/salesList";
	}

	/**
	 * 打开编辑页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/openEditPage" })
	public String openEditPage(String id) throws IOException {
		SessionManageEntity sales = SessionUtil.getSession(request);
//		String currentSalesRoleId = sales.getId();
		SalesEntity editSales = null;
		if (StringUtil.isNotNull(id)) {
			editSales = salesService.getSalesById(id);
		}
		request.setAttribute("editSales", editSales);
//		request.setAttribute("currentSalesRoleId", currentSalesRoleId);
		return "sales/salesEdit";
	}

	/**
	 * 查询用户列表
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = { "/selectSalesList" })
	public Map<String, Object> selectSalesList(SalesEntity paraSales) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", salesService.countSales(paraSales));
		map.put("rows", salesService.listSales(paraSales));
		return map;
	}

	/**
	 * 新增用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/insertSales" })
	public int insertSales(SalesEntity paraSales) throws IOException {
		SessionManageEntity sales = SessionUtil.getSession(request);
		paraSales.setSeller(sales.getUserId());
		return salesService.insertSales(paraSales);
	}

	/**
	 * 修改用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/updateSales" })
	public long updateSales(SalesEntity paraSales) throws IOException {
		SessionManageEntity sales = SessionUtil.getSession(request);
		paraSales.setUpdateBy(sales.getId());
		return salesService.updateSales(paraSales);
	}
	
	
	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/deleteSales" })
	public int deleteSales(Model model,String Ids) throws IOException {
		SessionManageEntity sales = SessionUtil.getSession(request);
		String currentSalesId = sales.getId();
		String editSalesIds = sales.getUserId();
		if (StringUtil.isNotNull(Ids)) {
			return salesService.deleteSalesByIds(Ids,editSalesIds, currentSalesId);
		}
		return 0;
	}
}
