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
import com.data.entity.WorkEntity;
import com.data.service.WorkService;
import com.framework.core.BaseManageController;
import com.framework.core.SessionManageEntity;
import com.framework.util.StringUtil;
/**
 * 
 * @author 
 */
@Scope("prototype")
@Controller
@RequestMapping("/workController")
public class WorkController extends BaseManageController {

	@Resource
	private WorkService WorkService;

	/**
	 * 打开首页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/subMain" })
	public String subMain() throws IOException {
		// 初始化帮助信息和功能权限信息
		super.setCommonAttribute(request);
		return "work/workList";
	}

	/**
	 * 打开编辑页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/openEditPage" })
	public String openEditPage(String id) throws IOException {
		SessionManageEntity Work = SessionUtil.getSession(request);
//		String currentWorkRoleId = Work.getId();
		WorkEntity editWork = null;
		if (StringUtil.isNotNull(id)) {
			editWork = WorkService.getWorkById(id);
		}
		request.setAttribute("editWork", editWork);
//		request.setAttribute("currentWorkRoleId", currentWorkRoleId);
		return "work/workEdit";
	}

	/**
	 * 查询用户列表
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = { "/selectWorkList" })
	public Map<String, Object> selectWorkList(WorkEntity paraWork) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", WorkService.countWork(paraWork));
		map.put("rows", WorkService.listWork(paraWork));
		return map;
	}

	/**
	 * 新增用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/insertWork" })
	public int insertWork(WorkEntity paraWork) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraWork.setCreate_by(user.getUserId());
		return WorkService.insertWork(paraWork);
	}

	/**
	 * 修改用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/updateWork" })
	public long updateWork(WorkEntity paraWork) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraWork.setUpdateBy(Work.getId());
		return WorkService.updateWork(paraWork);
	}
	
	
	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/deleteWork" })
	public int deleteSales(Model model,String Ids) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentSalesId = user.getId();
		String editWorkIds = user.getUserId();
		if (StringUtil.isNotNull(Ids)) {
			return WorkService.deleteWorkByIds(Ids,editWorkIds, currentSalesId);
		}
		return 0;
	}
}
