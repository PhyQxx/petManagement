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
import com.data.entity.SubscribeEntity;
import com.data.service.SubscribeService;
import com.framework.core.BaseManageController;
import com.framework.core.SessionManageEntity;
import com.framework.util.StringUtil;
/**
 * 
 * @author 
 */
@Scope("prototype")
@Controller
@RequestMapping("/subscribeController")
public class SubscribeController extends BaseManageController {

	@Resource
	private SubscribeService subscribeService;

	/**
	 * 打开首页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/subMain" })
	public String subMain() throws IOException {
		// 初始化帮助信息和功能权限信息
		super.setCommonAttribute(request);
		return "subscribe/subscribeList";
	}

	/**
	 * 打开编辑页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/openEditPage" })
	public String openEditPage(String id) throws IOException {
		SessionManageEntity subscribe = SessionUtil.getSession(request);
//		String currentSubscribeRoleId = subscribe.getId();
		SubscribeEntity editSubscribe = null;
		if (StringUtil.isNotNull(id)) {
			editSubscribe = subscribeService.getSubscribeById(id);
		}
		request.setAttribute("editSubscribe", editSubscribe);
//		request.setAttribute("currentSubscribeRoleId", currentSubscribeRoleId);
		return "subscribe/subscribeEdit";
	}

	/**
	 * 查询用户列表
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = { "/selectSubscribeList" })
	public Map<String, Object> selectSubscribeList(SubscribeEntity paraSubscribe) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", subscribeService.countSubscribe(paraSubscribe));
		map.put("rows", subscribeService.listSubscribe(paraSubscribe));
		return map;
	}

	/**
	 * 新增用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/insertSubscribe" })
	public int insertSubscribe(SubscribeEntity paraSubscribe) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraSubscribe.setCreate_by(user.getUserId());
		return subscribeService.insertSubscribe(paraSubscribe);
	}

	/**
	 * 修改用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/updateSubscribe" })
	public long updateSubscribe(SubscribeEntity paraSubscribe) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraSubscribe.setUpdateBy(subscribe.getId());
		return subscribeService.updateSubscribe(paraSubscribe);
	}
	
	
	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/deleteSubscribe" })
	public int deleteSales(Model model,String Ids) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentSalesId = user.getId();
		String editSubscribeIds = user.getUserId();
		if (StringUtil.isNotNull(Ids)) {
			return subscribeService.deleteSubscribeByIds(Ids,editSubscribeIds, currentSalesId);
		}
		return 0;
	}
}
