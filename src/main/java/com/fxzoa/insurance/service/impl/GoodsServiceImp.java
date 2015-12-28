package com.fxzoa.insurance.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fxzoa.insurance.dao.GoodsEntityMapper;
import com.fxzoa.insurance.entity.GoodsEntity;
import com.fxzoa.insurance.service.GoodsService;

@Service
public class GoodsServiceImp implements GoodsService {
	
	@Autowired
	GoodsEntityMapper goodsEntityMapper;

	@Override
	public void insert(GoodsEntity entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(GoodsEntity entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(GoodsEntity entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<GoodsEntity> getGoodsList(String companyId) {
		return goodsEntityMapper.selectByCompanyId(companyId);
	}

	@Override
	public GoodsEntity searchByPrimaryKey(GoodsEntity entity) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
