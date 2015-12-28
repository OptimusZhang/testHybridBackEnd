package com.fxzoa.insurance.dao;

import java.util.List;

import com.fxzoa.insurance.entity.QuestEntity;

public interface QuestEntityMapper {
    int deleteByPrimaryKey(Integer questId);

    int insert(QuestEntity record);

    int insertSelective(QuestEntity record);

    QuestEntity selectByPrimaryKey(Integer questId);

    int updateByPrimaryKeySelective(QuestEntity record);

    int updateByPrimaryKey(QuestEntity record);
    
    List<QuestEntity> selectByEntity(QuestEntity record);
}