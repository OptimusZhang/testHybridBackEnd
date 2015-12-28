package com.fxzoa.insurance.service.impl;

import java.util.List;

import org.springframework.beans.BeanUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fxzoa.insurance.dao.QuestEntityMapper;
import com.fxzoa.insurance.entity.QuestEntity;
import com.fxzoa.insurance.form.QuestForm;
import com.fxzoa.insurance.service.QuestService;

@Service
public class QuestServiceImp implements QuestService {
	
	@Autowired
	QuestEntityMapper questEntityMapper;
	
	@Override
	public void insert(QuestForm form) {
		QuestEntity entity = new QuestEntity();
		BeanUtils.copyProperties(form, entity);
		entity.setUpdateUser("admin");
		
		questEntityMapper.insertSelective(entity);		
	}
	
	@Override
	public QuestEntity searchByPrimaryKey(QuestForm form) {		
		return questEntityMapper.selectByPrimaryKey(form.getQuestId());
	}
	
	@Override
	public List<QuestEntity> selectByEntity(QuestForm form) {
		QuestEntity entity = new QuestEntity();
		BeanUtils.copyProperties(form, entity);
		
		return questEntityMapper.selectByEntity(entity);
	}
	
	@Override
	public void update(QuestForm form) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(QuestForm form) {
		// TODO Auto-generated method stub

	}

}
