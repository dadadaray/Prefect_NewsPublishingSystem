package com.aps.modFree;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import com.aps.entity.ModFree;
import com.framework.BaseDao;
import com.framework.SqlUtils;

@Repository
public class ModFreeDaoImpl extends BaseDao<ModFree, String>{
	@Resource
	private SessionFactory sessionFactory;
	
	public void saveModFreeDao(ModFree mod) {
		try {
			this.save(mod);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int deleteModFree(String newsIds) {
		int ret = 0;
		try {
			Query query = this.sessionFactory.getCurrentSession()
					.createQuery("delete from ModFree m where m.news.newsId in" + SqlUtils.toLikeSqlForStr(newsIds, ","));
			ret = query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

}
