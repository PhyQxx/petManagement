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
import com.data.entity.ReceivableEntity;
import com.data.service.ReceivableService;
import com.framework.core.BaseManageController;
import com.framework.core.SessionManageEntity;
import com.framework.util.StringUtil;
/**
 * 
 * @author 
 */
@Scope("prototype")
@Controller
@RequestMapping("/receivableController")
public class ReceivableController extends BaseManageController {

	@Resource
	private ReceivableService receivableService;

	/**
	 * 打开首页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/subMain" })
	public String subMain() throws IOException {
		// 初始化帮助信息和功能权限信息
		super.setCommonAttribute(request);
		return "receivable/receivableList";
	}

	/**
	 * 打开编辑页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/openEditPage" })
	public String openEditPage(String id) throws IOException {
		SessionManageEntity receivable = SessionUtil.getSession(request);
//		String currentReceivableRoleId = receivable.getId();
		ReceivableEntity editReceivable = null;
		if (StringUtil.isNotNull(id)) {
			editReceivable = receivableService.getReceivableById(id);
		}
		request.setAttribute("editReceivable", editReceivable);
//		request.setAttribute("currentReceivableRoleId", currentReceivableRoleId);
		return "receivable/receivableEdit";
	}

	/**
	 * 查询用户列表
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = { "/selectReceivableList" })
	public Map<String, Object> selectReceivableList(ReceivableEntity paraReceivable) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", receivableService.countReceivable(paraReceivable));
		map.put("rows", receivableService.listReceivable(paraReceivable));
		return map;
	}

	/**
	 * 新增用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/insertReceivable" })
	public int insertReceivable(ReceivableEntity paraReceivable) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraReceivable.setCreate_by(user.getUserId());
		return receivableService.insertReceivable(paraReceivable);
	}

	/**
	 * 修改用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/updateReceivable" })
	public long updateReceivable(ReceivableEntity paraReceivable) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraReceivable.setUpdateBy(receivable.getId());
		return receivableService.updateReceivable(paraReceivable);
	}
	
	
	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/deleteReceivable" })
	public int deleteSales(Model model,String Ids) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentSalesId = user.getId();
		String editReceivableIds = user.getUserId();
		if (StringUtil.isNotNull(Ids)) {
			return receivableService.deleteReceivableByIds(Ids,editReceivableIds, currentSalesId);
		}
		return 0;
	}
}
