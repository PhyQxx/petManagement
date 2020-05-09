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
import com.data.entity.GeneralEntity;
import com.data.service.GeneralService;
import com.framework.core.BaseManageController;
import com.framework.core.SessionManageEntity;
import com.framework.util.StringUtil;
/**
 * 
 * @author 
 */
@Scope("prototype")
@Controller
@RequestMapping("/generalController")
public class GeneralController extends BaseManageController {

	@Resource
	private GeneralService generalService;

	/**
	 * 打开首页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/subMain" })
	public String subMain() throws IOException {
		// 初始化帮助信息和功能权限信息
		super.setCommonAttribute(request);
		return "general/generalList";
	}

	/**
	 * 打开编辑页
	 * @throws IOException 
	 */
	@RequestMapping(value = { "/openEditPage" })
	public String openEditPage(String id) throws IOException {
		SessionManageEntity general = SessionUtil.getSession(request);
//		String currentGeneralRoleId = general.getId();
		GeneralEntity editGeneral = null;
		if (StringUtil.isNotNull(id)) {
			editGeneral = generalService.getGeneralById(id);
		}
		request.setAttribute("editGeneral", editGeneral);
//		request.setAttribute("currentGeneralRoleId", currentGeneralRoleId);
		return "general/generalEdit";
	}

	/**
	 * 查询用户列表
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = { "/selectGeneralList" })
	public Map<String, Object> selectGeneralList(GeneralEntity paraGeneral) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", generalService.countGeneral(paraGeneral));
		map.put("rows", generalService.listGeneral(paraGeneral));
		return map;
	}

	/**
	 * 新增用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/insertGeneral" })
	public int insertGeneral(GeneralEntity paraGeneral) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraGeneral.setCreate_by(user.getUserId());
		return generalService.insertGeneral(paraGeneral);
	}

	/**
	 * 修改用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/updateGeneral" })
	public long updateGeneral(GeneralEntity paraGeneral) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
//		paraGeneral.setUpdateBy(general.getId());
		return generalService.updateGeneral(paraGeneral);
	}
	
	
	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping(value = { "/deleteGeneral" })
	public int deleteSales(Model model,String Ids) throws IOException {
		SessionManageEntity user = SessionUtil.getSession(request);
		String currentSalesId = user.getId();
		String editGeneralIds = user.getUserId();
		if (StringUtil.isNotNull(Ids)) {
			return generalService.deleteGeneralByIds(Ids,editGeneralIds, currentSalesId);
		}
		return 0;
	}
}
