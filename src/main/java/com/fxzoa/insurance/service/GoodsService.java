package com.fxzoa.insurance.service;

import java.util.List;

import com.fxzoa.insurance.entity.GoodsEntity;

public interface GoodsService {
	public void insert(GoodsEntity entity);
	public void update(GoodsEntity entity);
	public void delete(GoodsEntity entity);
	public List<GoodsEntity> getGoodsList(String companyId);
	public GoodsEntity searchByPrimaryKey(GoodsEntity entity);
}
