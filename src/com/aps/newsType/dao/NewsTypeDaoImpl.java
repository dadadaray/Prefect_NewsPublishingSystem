package com.aps.newsType.dao;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.aps.entity.NewsType;
import com.framework.BaseDao;

@Repository
public class NewsTypeDaoImpl extends BaseDao<NewsType, String>{
	@Resource
	private SessionFactory sessionFactory;
	
//	/**@dec 通过新闻类型名查询新闻类型
//	 * @author Ray
//	 * @param newsTypeName
//	 * @return
//	 */
//	public NewsType findNewsTypeByName(String newsTypeName){
//		String hql="from NewsType t where t.typeName="+ newsTypeName;
//		try {
//			return this.findOne(hql, null);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return null;
//		}	
//	}
//	
	/**
	 * @dec 根据id查类型
	 * @author Ray
	 * @param id
	 * @return
	 */
	public NewsType findNewsTypeById(Integer id){
		 try {
			return this.get(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	

}
