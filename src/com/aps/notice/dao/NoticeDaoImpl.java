package com.aps.notice.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.aps.entity.Notice;
import com.framework.BaseDao;
import com.framework.Page;
import com.framework.SqlUtils;

@Repository
public class NoticeDaoImpl extends BaseDao<Notice, String> {
	
	@Resource
	private SessionFactory sessionFactory;
	
	/**
	 * @Title: findAllNotice
	 * @Description: 记者获取所有的通知   分页
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @return
	 * @author HanChen
	 * @return Page<Notice>
	 */
	public Page<Notice> findAllNotice(int pageNum, int pageSize, Object[] params) {
		
		String hql;
		/*if(params!=null && params.length>0){
			hql="from Notice n where n.noticeContent like ? and n.noticeType != 3 order by n.noticeCreatTime desc";
			params[0]="%"+params[0]+"%";
		}else{
			hql="from Notice n where n.noticeType != 3 order by n.noticeCreatTime desc";
		}*/
		hql="from Notice n where n.reciveId = ? and n.noticeType != 3 order by n.noticeCreatTime desc";
		params[0]=params[0];
		
		try{
			Page<Notice> page = new Page<Notice>();
			page.setCurrentPageNum(pageNum);
			page.setPageSize(pageSize);
			page = this.findByPage(pageNum, pageSize, hql, params);
			return page;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @Title: findAllNotice1
	 * @Description: 记者获取所有的通知   分页
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @return
	 * @author HanChen 
	 * @return Page<Notice>
	 */
	public Page<Notice> findAllNotice1(int pageNum, int pageSize, Object[] params) {
		
		String hql;
		/*if(params!=null && params.length>0){
			hql="from Notice n where n.noticeContent like ? and n.noticeType != 3 order by n.noticeCreatTime desc";
			params[0]="%"+params[0]+"%";
		}else{
			hql="from Notice n where n.noticeType != 3 order by n.noticeCreatTime desc";
		}*/
		hql="from Notice n where n.reciveId = ? and n.noticeType = 3 order by n.noticeCreatTime desc";
		params[0]=params[0];
		
		try{
			Page<Notice> page = new Page<Notice>();
			page.setCurrentPageNum(pageNum);
			page.setPageSize(pageSize);
			page = this.findByPage(pageNum, pageSize, hql, params);
			return page;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @Title: getNoticeById
	 * @Description: 根据noticeId 查询Notice
	 * @param noticeId
	 * @return
	 * @author HanChen
	 * @return Notice
	 */
	public Notice getNoticeById(int noticeId){
		Notice notice;
		try {
			notice = this.get(noticeId);
			return notice;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	/**
	 * @Title: getNoticeByNewsId
	 * @Description: 根据新闻id查询通知id
	 * @param newsIds
	 * @return HanChen
	 * @author 
	 * @return String
	 */
	public String getNoticeByNewsId(String newsIds){
		String hql = "";
		hql = "from Notice n where n.news.newsId in " + SqlUtils.toLikeSqlForStr(newsIds, ",");
		Session session = super.getSession();
		Query query = session.createQuery(hql);
		List<Notice> notices = new ArrayList<Notice>();
		notices = query.list();
		String noticeIds = "";
		Iterator<Notice> it = notices.iterator();
		while (it.hasNext()) {
			Notice notice_next = it.next();
			noticeIds += notice_next.getNoticeId() + ",";
		}
		return noticeIds;
	}
	
	/**
	 * @Title: getNoticeByUserId
	 * @Description: getNoticeByUserId
	 * @param userIds
	 * @return
	 * @author HanChen
	 * @return String
	 */
	public String getNoticeByUserId(String userIds){
		String hql = "";
		hql = "from Notice n where n.userInfo.userInfoId in " + SqlUtils.toLikeSqlForStr(userIds, ",");
		hql += " or n.reciveId in " + SqlUtils.toLikeSqlForStr(userIds, ",");
		Session session = super.getSession();
		Query query = session.createQuery(hql);
		List<Notice> notices = new ArrayList<Notice>();
		notices = query.list();
		String noticeIds = "";
		Iterator<Notice> it = notices.iterator();
		while (it.hasNext()) {
			Notice notice_next = it.next();
			noticeIds += notice_next.getNoticeId() + ",";
		}
		return noticeIds;
	}
	
	/**
	 * @Title: saveNotice
	 * @Description: 创建通知
	 * @param notice
	 * @return
	 * @author HanChen
	 * @return String
	 */
	public int saveNotice(Notice notice){
		try {
			this.save(notice);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	/**
	 * @Title: deleteNotice
	 * @Description: 删除通知
	 * @param noticeIds
	 * @return
	 * @author HanChen 
	 * @return int
	 */
	public int deleteNotice(String noticeIds){
		int ret = 0;
		try {
			Query query = this.sessionFactory.getCurrentSession()
					.createQuery("delete from Notice n where n.noticeId in" + SqlUtils.toLikeSqlForStr(noticeIds, ","));
			ret = query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	
}
