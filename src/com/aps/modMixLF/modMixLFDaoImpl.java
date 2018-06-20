package com.aps.modMixLF;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import com.aps.entity.ModMixLR;
import com.framework.BaseDao;
import com.framework.SqlUtils;

@Repository
public class modMixLFDaoImpl extends BaseDao<ModMixLR, String> {
	@Resource
	private SessionFactory sessionFactory;
	/**
	 * @dec 保存混合左右模板
	 * @author Ray
	 * @param mod
	 */
	public void saveModMixLF(ModMixLR mod) {
		try {
			this.save(mod);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * @Title: updateModMixLR
	 * @Description: 更新
	 * @param mod
	 * @author HanChen 
	 * @return void
	 */
	public void updateModMixLR(ModMixLR mod){
		try {
			this.update(mod);
			System.out.print("已更新ModMixLR模板内容");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * @Title: getOneModMixLR
	 * @Description: 根据id得到对象
	 * @param modMixLRId
	 * @return
	 * @author HanChen 
	 * @return ModMixLR
	 */
	public ModMixLR getOneModMixLR(int modMixLRId){
		try {
			ModMixLR modMixLR = this.get(modMixLRId);
			return modMixLR;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}	
	}
	
	/**
	 * @Title: deleteModMixLR
	 * @Description: 图文混合模板2
	 * @param newsIds
	 * @return
	 * @author HanChen 
	 * @return int
	 */
	public int deleteModMixLR(String newsIds) {
		int ret = 0;
		try {
			Query query = this.sessionFactory.getCurrentSession()
					.createQuery("delete from ModMixLR m where m.news.newsId in" + SqlUtils.toLikeSqlForStr(newsIds, ","));
			ret = query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

}
