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
import com.data.entity.CuringEntity;
import com.data.service.CuringService;
import com.framework.core.BaseManageController;
import com.framework.core.SessionManageEntity;
import com.framework.util.StringUtil;
/**
 * 
 * @author 
 */
@Scope("prototype")
@Controller
@RequestMapping("/curingController")
public class CuringController extends BaseManageController {

	@Resource
	private CuringService curingService;

	/**
	 * 打开首页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/subMain" })
	public String subMain() throws IOException {
		// 初始化帮助信息和功能权限信息
		super.setCommonAttribute(request);
		return "curing/curingList";
	}

	/**
	 * 打开编辑页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/openEditPage" })
	public String openEditPage(String id) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentCuringRoleId = user.getId();
		CuringEntity editCuring = null;
		if (StringUtil.isNotNull(id)) {
			editCuring = curingService.getCuringById(id);
		}
		request.setAttribute("editCuring", editCuring);
//		request.setAttribute("currentCuringRoleId", currentCuringRoleId);
		return "curing/curingEdit";
	}

	/**
	 * 查询用户列表
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = { "/selectCuringList" })
	public Map<String, Object> selectCuringList(CuringEntity paraCuring) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", curingService.countCuring(paraCuring));
		map.put("rows", curingService.listCuring(paraCuring));
		return map;
	}

	/**
	 * 新增用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/insertCuring" })
	public int insertCuring(CuringEntity paraCuring) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraCuring.setCreate_by(user.getUserId());
		return curingService.insertCuring(paraCuring);
	}

	/**
	 * 修改用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/updateCuring" })
	public long updateCuring(CuringEntity paraCuring) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraCuring.setUpdateBy(user.getId());
		return curingService.updateCuring(paraCuring);
	}
	
	
	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/deleteCuring" })
	public int deleteSales(Model model,String Ids) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentSalesId = user.getId();
		String editCuringIds = user.getUserId();
		if (StringUtil.isNotNull(Ids)) {
			return curingService.deleteCuringByIds(Ids,editCuringIds, currentSalesId);
		}
		return 0;
	}
}
