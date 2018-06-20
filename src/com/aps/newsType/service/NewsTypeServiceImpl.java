package com.aps.newsType.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.aps.entity.NewsType;
import com.aps.newsType.dao.NewsTypeDaoImpl;

@Service
public class NewsTypeServiceImpl {
	@Resource
	private NewsTypeDaoImpl newsTypeDaoImpl;

	/**
	 * @dec 通过类别名查询新闻类别
	 * @author Ray
	 * @param name
	 * @return
	 */
//	public NewsType getNewType(String name) {
//		return this.newsTypeDaoImpl.findNewsTypeByName(name);
//	}
	
	public NewsType getNewTypeById(Integer id) {
		return this.newsTypeDaoImpl.findNewsTypeById(id);
	}
	

}
