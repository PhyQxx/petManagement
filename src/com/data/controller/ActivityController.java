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
import com.data.entity.ActivityEntity;
import com.data.service.ActivityService;
import com.framework.core.BaseManageController;
import com.framework.core.SessionManageEntity;
import com.framework.util.StringUtil;
/**
 * 
 * @author 
 */
@Scope("prototype")
@Controller
@RequestMapping("/activityController")
public class ActivityController extends BaseManageController {

	@Resource
	private ActivityService activityService;

	/**
	 * 打开首页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/subMain" })
	public String subMain() throws IOException {
		// 初始化帮助信息和功能权限信息
		super.setCommonAttribute(request);
		return "activity/activityList";
	}

	/**
	 * 打开编辑页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/openEditPage" })
	public String openEditPage(String id) throws IOException {
		SessionManageEntity activity = SessionUtil.getSession(request);
//		String currentActivityRoleId = activity.getId();
		ActivityEntity editActivity = null;
		if (StringUtil.isNotNull(id)) {
			editActivity = activityService.getActivityById(id);
		}
		request.setAttribute("editActivity", editActivity);
//		request.setAttribute("currentActivityRoleId", currentActivityRoleId);
		return "activity/activityEdit";
	}

	/**
	 * 查询用户列表
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = { "/selectActivityList" })
	public Map<String, Object> selectActivityList(ActivityEntity paraActivity) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", activityService.countActivity(paraActivity));
		map.put("rows", activityService.listActivity(paraActivity));
		return map;
	}

	/**
	 * 新增用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/insertActivity" })
	public int insertActivity(ActivityEntity paraActivity) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraActivity.setCreate_by(user.getUserId());
		return activityService.insertActivity(paraActivity);
	}

	/**
	 * 修改用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/updateActivity" })
	public long updateActivity(ActivityEntity paraActivity) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraActivity.setUpdateBy(activity.getId());
		return activityService.updateActivity(paraActivity);
	}
	
	
	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/deleteActivity" })
	public int deleteSales(Model model,String Ids) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentSalesId = user.getId();
		String editActivityIds = user.getUserId();
		if (StringUtil.isNotNull(Ids)) {
			return activityService.deleteActivityByIds(Ids,editActivityIds, currentSalesId);
		}
		return 0;
	}
}
