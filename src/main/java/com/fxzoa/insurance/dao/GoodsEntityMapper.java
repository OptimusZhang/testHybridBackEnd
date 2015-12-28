package com.fxzoa.insurance.dao;

import java.util.List;

import com.fxzoa.insurance.entity.GoodsEntity;

public interface GoodsEntityMapper {
    int deleteByPrimaryKey(Integer goodsId);

    int insert(GoodsEntity record);

    int insertSelective(GoodsEntity record);

    GoodsEntity selectByPrimaryKey(Integer goodsId);

    int updateByPrimaryKeySelective(GoodsEntity record);

    int updateByPrimaryKey(GoodsEntity record);
    
    List<GoodsEntity> selectByCompanyId(String companyId);
}