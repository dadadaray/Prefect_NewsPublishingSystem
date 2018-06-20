package com.aps.modMixSingle;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.aps.entity.ModMixSingle;
import com.framework.BaseDao;
import com.framework.SqlUtils;

@Repository
public class modMixSingleDaoImpl extends BaseDao<ModMixSingle,String>{

	@Resource
	private SessionFactory sessionFactory;
	
	/**
	 * @dec  保存图文混合模板一
	 * @author Ray
	 * @param mod
	 */
	public void saveModMixSingle(ModMixSingle mod){
		try {
			this.save(mod);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * @Title: deleteModMixSingle
	 * @Description: 删除图文混合模板三
	 * @param newsIds
	 * @return
	 * @author HanChen
	 * @return int
	 */
	public int deleteModMixSingle(String newsIds) {
		int ret = 0;
		try {
			Query query = this.sessionFactory.getCurrentSession()
					.createQuery("delete from ModMixSingle m where m.news.newsId in" + SqlUtils.toLikeSqlForStr(newsIds, ","));
			ret = query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	
	
}
