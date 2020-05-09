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
import com.data.entity.CustomerEntity;
import com.data.service.CustomerService;
import com.framework.core.BaseManageController;
import com.framework.core.SessionManageEntity;
import com.framework.util.StringUtil;
/**
 * 
 * @author 
 */
@Scope("prototype")
@Controller
@RequestMapping("/customerController")
public class CustomerController extends BaseManageController {

	@Resource
	private CustomerService customerService;

	/**
	 * 打开首页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/subMain" })
	public String subMain() throws IOException {
		// 初始化帮助信息和功能权限信息
		super.setCommonAttribute(request);
		return "customer/customerList";
	}

	/**
	 * 打开编辑页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/openEditPage" })
	public String openEditPage(String id) throws IOException {
		SessionManageEntity customer = SessionUtil.getSession(request);
//		String currentCustomerRoleId = customer.getId();
		CustomerEntity editCustomer = null;
		if (StringUtil.isNotNull(id)) {
			editCustomer = customerService.getCustomerById(id);
		}
		request.setAttribute("editCustomer", editCustomer);
//		request.setAttribute("currentCustomerRoleId", currentCustomerRoleId);
		return "customer/customerEdit";
	}

	/**
	 * 查询用户列表
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = { "/selectCustomerList" })
	public Map<String, Object> selectCustomerList(CustomerEntity paraCustomer) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", customerService.countCustomer(paraCustomer));
		map.put("rows", customerService.listCustomer(paraCustomer));
		return map;
	}

	/**
	 * 新增用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/insertCustomer" })
	public int insertCustomer(CustomerEntity paraCustomer) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraCustomer.setCreate_by(user.getUserId());
		return customerService.insertCustomer(paraCustomer);
	}

	/**
	 * 修改用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/updateCustomer" })
	public long updateCustomer(CustomerEntity paraCustomer) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraCustomer.setUpdateBy(customer.getId());
		return customerService.updateCustomer(paraCustomer);
	}
	
	
	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/deleteCustomer" })
	public int deleteSales(Model model,String Ids) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentSalesId = user.getId();
		String editCustomerIds = user.getUserId();
		if (StringUtil.isNotNull(Ids)) {
			return customerService.deleteCustomerByIds(Ids,editCustomerIds, currentSalesId);
		}
		return 0;
	}
}
