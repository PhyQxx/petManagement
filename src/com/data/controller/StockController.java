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
import com.data.entity.StockEntity;
import com.data.service.StockService;
import com.framework.core.BaseManageController;
import com.framework.core.SessionManageEntity;
import com.framework.util.StringUtil;
/**
 * 
 * @author 
 */
@Scope("prototype")
@Controller
@RequestMapping("/stockController")
public class StockController extends BaseManageController {

	@Resource
	private StockService stockService;

	/**
	 * 打开首页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/subMain" })
	public String subMain() throws IOException {
		// 初始化帮助信息和功能权限信息
		super.setCommonAttribute(request);
		return "stock/stockList";
	}

	/**
	 * 打开编辑页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/openEditPage" })
	public String openEditPage(String id) throws IOException {
		SessionManageEntity stock = SessionUtil.getSession(request);
//		String currentStockRoleId = stock.getId();
		StockEntity editStock = null;
		if (StringUtil.isNotNull(id)) {
			editStock = stockService.getStockById(id);
		}
		request.setAttribute("editStock", editStock);
//		request.setAttribute("currentStockRoleId", currentStockRoleId);
		return "stock/stockEdit";
	}

	/**
	 * 查询用户列表
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = { "/selectStockList" })
	public Map<String, Object> selectStockList(StockEntity paraStock) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", stockService.countStock(paraStock));
		map.put("rows", stockService.listStock(paraStock));
		return map;
	}

	/**
	 * 新增用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/insertStock" })
	public int insertStock(StockEntity paraStock) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraStock.setCreate_by(user.getUserId());
		return stockService.insertStock(paraStock);
	}

	/**
	 * 修改用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/updateStock" })
	public long updateStock(StockEntity paraStock) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraStock.setUpdateBy(stock.getId());
		return stockService.updateStock(paraStock);
	}
	
	
	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/deleteStock" })
	public int deleteSales(Model model,String Ids) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentSalesId = user.getId();
		String editStockIds = user.getUserId();
		if (StringUtil.isNotNull(Ids)) {
			return stockService.deleteStockByIds(Ids,editStockIds, currentSalesId);
		}
		return 0;
	}
}
