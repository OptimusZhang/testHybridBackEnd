package com.fxzoa.insurance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fxzoa.insurance.common.BaseController;
import com.fxzoa.insurance.entity.GoodsEntity;
import com.fxzoa.insurance.entity.QuestEntity;
import com.fxzoa.insurance.form.QuestForm;
import com.fxzoa.insurance.service.GoodsService;
import com.fxzoa.insurance.service.QuestService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/questUpdate")
public class QuestUpdateController extends BaseController {	
	
	@Autowired
	QuestService questService;
	@Autowired
	GoodsService goodsService;

	@RequestMapping(value = "/init")
	public String init(QuestForm form, Model model) {
		QuestEntity entity = new QuestEntity();
		
		if (form.getQuestId() != null) {
			entity = questService.searchByPrimaryKey(form);
		}
		
		List<GoodsEntity> goodsList = goodsService.getGoodsList("10000000");
		
		model.addAttribute("entity", entity);
		model.addAttribute("goodsList", goodsList);
		
		return "add";
	}
	
	@RequestMapping(value = "/")
	public String none(QuestForm form, Model model) {
		return "forward:" + PATH_QUEST_UPDATE;
	}
	
	@RequestMapping(value = "/add", params = "add")
	public String addQuest(QuestForm form, Model model) {
		logger.info("addQuest started.");
	
		questService.insert(form);	
		
		return "redirect:" + PATH_QUEST_SEARCH;
	}
	
	@RequestMapping(value = "/add", params = "mod")
	public String modQuest(QuestForm form, Model model) {
		logger.info("modQuest started.");
	
		questService.update(form);	
		
		return "forward:" + PATH_QUEST_UPDATE;
	}
}
