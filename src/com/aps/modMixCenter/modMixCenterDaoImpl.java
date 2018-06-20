package com.aps.modMixCenter;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import com.aps.entity.ModMixCenter;
import com.aps.entity.ModMixLR;
import com.framework.BaseDao;
import com.framework.SqlUtils;

@Repository
public class modMixCenterDaoImpl extends BaseDao<ModMixCenter, String> {
	@Resource
	private SessionFactory sessionFactory;

	/**
	 * @dec 保存混合居中模板
	 * @author Ray
	 * @param mod
	 */
	public void saveModMixCenterDao(ModMixCenter mod) {
		try {
			this.save(mod);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * @Title: deleteModMixCenter
	 * @Description: 图文混合模板一删除
	 * @param newsIds
	 * @return
	 * @author HanChen
	 * @return int
	 */
	public int deleteModMixCenter(String newsIds) {
		int ret = 0;
		try {
			Query query = this.sessionFactory.getCurrentSession()
					.createQuery("delete from ModMixCenter m where m.news.newsId in" + SqlUtils.toLikeSqlForStr(newsIds, ","));
			ret = query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}
}
