package com.fxzoa.insurance.controller;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fxzoa.insurance.common.BaseController;
import com.fxzoa.insurance.dto.QuestDto;
import com.fxzoa.insurance.entity.GoodsEntity;
import com.fxzoa.insurance.entity.QuestEntity;
import com.fxzoa.insurance.form.QuestForm;
import com.fxzoa.insurance.service.GoodsService;
import com.fxzoa.insurance.service.QuestService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/questSearch")
@SessionAttributes(value = "questForm")
public class QuestSearchController extends BaseController {	

	@Autowired
	QuestService questService;
	@Autowired
	GoodsService goodsService;
	
	@RequestMapping(value = "/init")
	public String init(QuestForm form, Model model) {
		List<QuestEntity> questList = questService.selectByEntity(form);		
		List<GoodsEntity> goodsList = goodsService.getGoodsList("10000000");
		
		model.addAttribute("questList", questList);
		model.addAttribute("goodsList", goodsList);
		
		return "search";
	}
	
	@RequestMapping(value = "/")
	public String none(QuestForm form, Model model) {
		return "forward:" + PATH_QUEST_SEARCH;
	}
	
	@RequestMapping(value = "/search", params = "search")
	public String search(QuestForm form, Model model) {
		logger.info("search() started.");

		return "forward:" + PATH_QUEST_SEARCH;
	}
	
	@RequestMapping(value = "/search", params = "add")
	public String add(QuestForm form, Model model) {
		logger.info("search() started.");
		
		return "forward:" + PATH_QUEST_UPDATE;
	}
	
	@RequestMapping(value = "/jsonSearch", params = "search")
	public @ResponseBody QuestDto jsonSearch(@RequestBody QuestForm form, Model model) {
		logger.info("search() started.");

		QuestDto dto = new QuestDto();
		BeanUtils.copyProperties(form, dto);
		
		return dto;
	}
	
}
