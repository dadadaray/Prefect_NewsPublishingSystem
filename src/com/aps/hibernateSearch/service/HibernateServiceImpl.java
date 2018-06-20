package com.aps.hibernateSearch.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aps.entity.News;
import com.aps.hibernateSearch.dao.HibernateSearchDaoImpl;
import com.framework.Page;


@Service
@Transactional(readOnly = true)
public class HibernateServiceImpl {
	@Resource
	private HibernateSearchDaoImpl hibernateSearchDaoImpl;
//	/**
//	 * @author Ray_1
//	 * @功能：用hibernateSearch 获取4条news，并用高亮显示。
//	 * @param search
//	 * @return
//	 */
//	public List<Object> searchNewsByHiber(String search) {
//		return hibernateSearchDaoImpl.searchNewsByHiber(search);
//	}
	
	/**
	 * @author Ray_1
	 * @desc hibernate Search 分页查询bug并实现高亮
	 * @param pageNum
	 * @param pageSize
	 * @param search
	 * @return
	 */
	public Page<News> findNewsByHiberPage(int pageNum, int pageSize, String search) {
		try {
			return hibernateSearchDaoImpl.findNewsByHiberPage(pageNum, pageSize, search);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}






