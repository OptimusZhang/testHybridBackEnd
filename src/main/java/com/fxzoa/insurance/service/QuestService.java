package com.fxzoa.insurance.service;

import java.util.List;

import com.fxzoa.insurance.entity.QuestEntity;
import com.fxzoa.insurance.form.QuestForm;

public interface QuestService {
	public void insert(QuestForm form);
	public void update(QuestForm form);
	public void delete(QuestForm form);
	public List<QuestEntity> selectByEntity(QuestForm form);
	public QuestEntity searchByPrimaryKey(QuestForm form);
}
