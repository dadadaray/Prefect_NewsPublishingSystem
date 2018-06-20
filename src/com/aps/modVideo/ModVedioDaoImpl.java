/**
 * @FileName com.aps.modVideo/ModVedioDaoImpl.java 
 * @Project News-Publishing-System
 * @author lenovo 
 * @date 2018年5月3日 上午7:39:59
 * @version 
 * @Description TODO
 */

package com.aps.modVideo;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.aps.entity.ModVedio;
import com.framework.BaseDao;
import com.framework.SqlUtils;

/**
 * 
 * @ClassName ModVedioDaoImpl
 * @Description 视频模板
 * @author HanChen 
 * @version
 *
 */
@Repository
public class ModVedioDaoImpl extends BaseDao<ModVedio, String> {
	@Resource
	private SessionFactory sessionFactory;
	
	public void saveModVedioDao(ModVedio mod) {
		try {
			this.save(mod);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int deleteModVedio(String newsIds) {
		int ret = 0;
		try {
			Query query = this.sessionFactory.getCurrentSession()
					.createQuery("delete from ModVedio m where m.news.newsId in" + SqlUtils.toLikeSqlForStr(newsIds, ","));
			ret = query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}
}
