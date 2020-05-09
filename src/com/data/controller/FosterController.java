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
import com.data.entity.FosterEntity;
import com.data.service.FosterService;
import com.framework.core.BaseManageController;
import com.framework.core.SessionManageEntity;
import com.framework.util.StringUtil;
/**
 * 
 * @author 
 */
@Scope("prototype")
@Controller
@RequestMapping("/fosterController")
public class FosterController extends BaseManageController {

	@Resource
	private FosterService fosterService;

	/**
	 * 打开首页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/subMain" })
	public String subMain() throws IOException {
		// 初始化帮助信息和功能权限信息
		super.setCommonAttribute(request);
		return "foster/fosterList";
	}

	/**
	 * 打开编辑页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/openEditPage" })
	public String openEditPage(String id) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentFosterRoleId = user.getId();
		FosterEntity editFoster = null;
		if (StringUtil.isNotNull(id)) {
			editFoster = fosterService.getFosterById(id);
		}
		request.setAttribute("editFoster", editFoster);
		request.setAttribute("currentFosterRoleId", currentFosterRoleId);
		return "foster/fosterEdit";
	}

	/**
	 * 查询用户列表
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = { "/selectFosterList" })
	public Map<String, Object> selectFosterList(FosterEntity paraFoster) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", fosterService.countFoster(paraFoster));
		map.put("rows", fosterService.listFoster(paraFoster));
		return map;
	}

	/**
	 * 新增用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/insertFoster" })
	public int insertFoster(FosterEntity paraFoster) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraFoster.setCreate_by(user.getUserId());
		return fosterService.insertFoster(paraFoster);
	}

	/**
	 * 修改用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/updateFoster" })
	public long updateFoster(FosterEntity paraFoster) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraFoster.setUpdateBy(user.getId());
		return fosterService.updateFoster(paraFoster);
	}
	
	
	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/deleteFoster" })
	public int deleteSales(Model model,String Ids) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentSalesId = user.getId();
		String editFosterIds = user.getUserId();
		if (StringUtil.isNotNull(Ids)) {
			return fosterService.deleteFosterByIds(Ids,editFosterIds, currentSalesId);
		}
		return 0;
	}
}
