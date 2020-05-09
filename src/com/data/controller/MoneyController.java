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
import com.data.entity.MoneyEntity;
import com.data.service.MoneyService;
import com.framework.core.BaseManageController;
import com.framework.core.SessionManageEntity;
import com.framework.util.StringUtil;
/**
 * 
 * @author 
 */
@Scope("prototype")
@Controller
@RequestMapping("/moneyController")
public class MoneyController extends BaseManageController {

	@Resource
	private MoneyService MoneyService;

	/**
	 * 打开首页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/subMain" })
	public String subMain() throws IOException {
		// 初始化帮助信息和功能权限信息
		super.setCommonAttribute(request);
		return "money/moneyList";
	}

	/**
	 * 打开编辑页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/openEditPage" })
	public String openEditPage(String id) throws IOException {
		SessionManageEntity Money = SessionUtil.getSession(request);
//		String currentMoneyRoleId = Money.getId();
		MoneyEntity editMoney = null;
		if (StringUtil.isNotNull(id)) {
			editMoney = MoneyService.getMoneyById(id);
		}
		request.setAttribute("editMoney", editMoney);
//		request.setAttribute("currentMoneyRoleId", currentMoneyRoleId);
		return "money/moneyEdit";
	}

	/**
	 * 查询用户列表
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = { "/selectMoneyList" })
	public Map<String, Object> selectMoneyList(MoneyEntity paraMoney) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", MoneyService.countMoney(paraMoney));
		map.put("rows", MoneyService.listMoney(paraMoney));
		return map;
	}

	/**
	 * 新增用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/insertMoney" })
	public int insertMoney(MoneyEntity paraMoney) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraMoney.setCreate_by(user.getUserId());
		return MoneyService.insertMoney(paraMoney);
	}

	/**
	 * 修改用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/updateMoney" })
	public long updateMoney(MoneyEntity paraMoney) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraMoney.setUpdateBy(Money.getId());
		return MoneyService.updateMoney(paraMoney);
	}
	
	
	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/deleteMoney" })
	public int deleteSales(Model model,String Ids) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentSalesId = user.getId();
		String editMoneyIds = user.getUserId();
		if (StringUtil.isNotNull(Ids)) {
			return MoneyService.deleteMoneyByIds(Ids,editMoneyIds, currentSalesId);
		}
		return 0;
	}
}
