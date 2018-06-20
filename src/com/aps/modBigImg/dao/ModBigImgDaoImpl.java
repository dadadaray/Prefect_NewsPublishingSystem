package com.aps.modBigImg.dao;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.aps.entity.ModBigImg;
import com.framework.BaseDao;
import com.framework.SqlUtils;

@Repository
public class ModBigImgDaoImpl extends BaseDao<ModBigImg, String> {
	@Resource
	private SessionFactory sessionFactory;
	
	public void saveModBigImgDao(ModBigImg mod) {
		try {
			this.save(mod);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int deleteModBigImg(String newsIds) {
		int ret = 0;
		try {
			Query query = this.sessionFactory.getCurrentSession()
					.createQuery("delete from ModBigImg m where m.news.newsId in" + SqlUtils.toLikeSqlForStr(newsIds, ","));
			ret = query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}
}
