package com.aps.news.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import com.aps.entity.News;
import com.framework.BaseDao;
import com.framework.Page;
import com.framework.SqlUtils;;

@Repository
public class NewsDaoImpl extends BaseDao<News, String> {
	@Resource
	private SessionFactory sessionFactory;
	
	/**
	 * @dec 新闻推荐实现
	 * @author Ray
	 * @param newsId
	 */
	public void topSelect(int newsId){
	    try {
			News news=this.get(newsId);
			news.setTopShow(1);
			this.updateNews(news);
			System.out.print(news.getTopShow());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * @dec 按时间排序获取 首页推荐文章
	 * @author Ray
	 * @return
	 */
	public List<News> findNewsBigTop() {
		Session session = super.getSession();
		// 按照赞的数量排序
		Query query = session.createQuery("from News where statues=4 and topShow=1 order by publishTime DESC,views DESC");
		return query.list();
	}
	/**
	 * @dec 按浏览量排序获取 首页推荐视频
	 * @author Ray
	 * @return
	 */
	public List<News> leftVedio() {
		Session session = super.getSession();
		// 按照赞的数量排序
		Query query = session.createQuery("from News n where n.statues=4  and n.modVedios.length>0 order by n.views DESC");
		return query.list();
	}
	/**
	 * @dec 查询所有已发表文章
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @return
	 */
	public Page<News> findAllNewsFront(int pageNum, int pageSize, Object[] params) {
		String hql;

		hql = "from News where statues=4"; // 查询所有已发表的文章
		try {
			Page<News> page = new Page<News>();
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
	 * @dec 按类查询已经发表的文章
	 * @author Ray
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @return
	 */
	public Page<News> findnewsByType(int pageNum, int pageSize, Object[] params) {
		String hql;

		hql = "from News n where n.newsType.newsTypeId = ? and n.statues=4 order by n.publishTime desc";
		params[0] = params[0];
		try {
			Page<News> page = new Page<News>();
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
	 * @dec 按浏览量查询昨天的新闻
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @return
	 */
	public Page<News> findNewsFrontToday(int pageNum, int pageSize) {
		String hql;

		hql = "from News n where n.statues=4";

		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String startDate = "", endDate = "", date = "";
		calendar.add(Calendar.DATE, -1); // 昨天
		date = df.format(calendar.getTime());
		startDate = date + " 00:00:00";
		endDate = date + " 23:59:59";

		if (StringUtils.isNotEmpty(startDate) && StringUtils.isNotEmpty(endDate)) {
			hql += " and n.publishTime >= '" + startDate.trim() + "'";
			hql += " and n.publishTime <= '" + endDate.trim() + "'";
		}
		hql += " order by n.views desc, commentNum desc";
		//params[0] = params[0];
		try {
			Page<News> page = new Page<News>();
			page.setCurrentPageNum(pageNum);
			page.setPageSize(pageSize);
			page = this.findByPage(pageNum, pageSize, hql, null);
			return page;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 查询所有news 无序
	 * 
	 * @author Ray
	 * @return
	 */
	public List<News> getAllNews() {
		Session session = super.getSession();
		return session.createQuery("from News").list();
	}

	/**
	 * @dec 根据id 得到news实体
	 * @author Ray
	 * @param newsId
	 * @return
	 */
	public News getOneNews(int newsId) {
		try {
			News news = this.get(newsId);
			return news;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * @Title: findPublishList
	 * @Description: 得到发布新闻的列表
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @param orderBy
	 *            排序方式 默认0：发布时间 1：分享 2：浏览 3：留言 4:按浏览量、评论量排序
	 * @return
	 * @author HanChen
	 * @return Page<News>
	 */
	public Page<News> findPublishList(int pageNum, int pageSize, Object[] params, int orderBy) {
		String hql, orderParam = "";
		switch (orderBy) {
		case 0:
			orderParam = "publishTime";
			break;
		case 1:
			orderParam = "share";
			break;
		case 2:
			orderParam = "views";
			break;
		case 3:
			orderParam = "commentNum";
			break;
		}
		hql = "from News n where n.userInfo.userInfoId = ? and n.statues = 4 order by n." + orderParam + " desc";
		params[0] = params[0];

		try {
			Page<News> page = new Page<News>();
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
	 * @Title: getHotNewsList
	 * @Description: 后台管理员首页文章排行
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @param timeSlot
	 *            排序时间段 默认0：昨天； 1：前天； 2：本周 ；
	 * @return
	 * @author HanChen
	 * @return Page<News>
	 */
	public Page<News> getHotNewsList(int pageNum, int pageSize, Object[] params, int timeSlot) {
		String hql = "from News n where n.auditorId = ? and n.statues = 4 ";
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String startDate = "", endDate = "", date = "";
		switch (timeSlot) {
		case 0:
			calendar.add(Calendar.DATE, -1); // 昨天
			date = df.format(calendar.getTime());
			startDate = date + " 00:00:00";
			endDate = date + " 23:59:59";
			break;
		case 1:
			calendar.add(Calendar.DATE, -2); // 前天
			date = df.format(calendar.getTime());
			startDate = date + " 00:00:00";
			endDate = date + " 23:59:59";
			break;
		case 2:
			calendar.add(Calendar.DATE, -1); // 昨天
			endDate = df.format(calendar.getTime()) + " 23:59:59";
			calendar.add(Calendar.DAY_OF_MONTH, -6); // 前一周
			startDate = df.format(calendar.getTime()) + " 00:00:00";
			break;
		}
		if (StringUtils.isNotEmpty(startDate) && StringUtils.isNotEmpty(endDate)) {
			hql += " and n.publishTime >= '" + startDate.trim() + "'";
			hql += " and n.publishTime <= '" + endDate.trim() + "'";
		}
		hql += " order by n.views desc, commentNum desc";
		params[0] = params[0];

		try {
			Page<News> page = new Page<News>();
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
	 * @Title: checkingNewsList
	 * @Description: 得到待审核的新闻列表
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @return
	 * @author HanChen
	 * @return Page<News>
	 */
	public Page<News> checkingNewsList(int pageNum, int pageSize, Object[] params) {
		String hql;
		hql = "from News n where n.userInfo.userInfoId = ? and n.statues = 1 order by n.createTime desc";
		params[0] = params[0];
		try {
			Page<News> page = new Page<News>();
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
	 * @Title: uncheckedNewsList
	 * @Description: 新闻编辑者--审核未通过新闻列表
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @return
	 * @author HanChen
	 * @return Page<News>
	 */
	public Page<News> uncheckedNewsList(int pageNum, int pageSize, Object[] params) {
		String hql;
		hql = "from News n where n.userInfo.userInfoId = ? and n.statues = 3 order by n.createTime desc";
		params[0] = params[0];
		try {
			Page<News> page = new Page<News>();
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
	 * @Title: backCheckingNewsList
	 * @Description: 后台管理员待审核文章列表
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @return
	 * @author HanChen
	 * @return Page<News>
	 */
	public Page<News> backCheckingNewsList(int pageNum, int pageSize, Object[] params) {
		String hql;
		hql = "from News n where n.auditorId = ? and n.statues = 1 order by n.createTime desc";
		params[0] = params[0];
		try {
			Page<News> page = new Page<News>();
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
	 * @Title: backPublishList
	 * @Description: 后台管理员已发布文章列表
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @param orderBy
	 *            排序方式 默认0：发布时间 1：分享 2：浏览 3：留言
	 * @return
	 * @author HanChen
	 * @return Page<News>
	 */
	public Page<News> backPublishList(int pageNum, int pageSize, Object[] params, int orderBy) {
		String hql, orderParam = "";
		switch (orderBy) {
		case 0:
			orderParam = "publishTime";
			break;
		case 1:
			orderParam = "share";
			break;
		case 2:
			orderParam = "views";
			break;
		case 3:
			orderParam = "commentNum";
			break;
		}
		hql = "from News n where n.auditorId = ? and n.statues = 4 order by n." + orderParam + " desc";
		params[0] = params[0];

		try {
			Page<News> page = new Page<News>();
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
	 * @Title: backUncheckingNewsList
	 * @Description: 后台管理员审核未通过文章列表
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @return
	 * @author HanChen
	 * @return Page<News>
	 */
	public Page<News> backUncheckingNewsList(int pageNum, int pageSize, Object[] params) {
		String hql;
		hql = "from News n where n.auditorId = ? and n.statues = 3 order by n.createTime desc";
		params[0] = params[0];
		try {
			Page<News> page = new Page<News>();
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
	 * @Title: draftNewsList
	 * @Description: 草稿箱
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @return
	 * @author HanChen
	 * @return Page<News>
	 */
	public Page<News> draftNewsList(int pageNum, int pageSize, Object[] params) {
		String hql;
		hql = "from News n where n.userInfo.userInfoId = ? and n.statues = 0 order by n.createTime desc";
		params[0] = params[0];
		try {
			Page<News> page = new Page<News>();
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
	 * @Title: deleteNews
	 * @Description: 删除新闻
	 * @param newsIds
	 * @return
	 * @author HanChen
	 * @return int
	 */
	public int deleteNews(String newsIds) {
		int ret = 0;
		try {
			Query query = this.sessionFactory.getCurrentSession()
					.createQuery("delete from News n where n.newsId in" + SqlUtils.toLikeSqlForStr(newsIds, ","));
			ret = query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

	/**
	 * 根据newsId 查询news
	 * 
	 * @author Ray
	 * @param newsId
	 * @return
	 */
	public News getNewsById(int newsId) {
		News news;
		try {
			news = this.get(newsId);
			return news;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 更新新闻
	 * 
	 * @author Ray
	 * @param news
	 */
	public void updateNews(News news) {
		try {
			super.update(news);
			//System.out.print("已更新news基础实体");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 保存新闻
	 * 
	 * @author Ray
	 * @param n
	 */
	public void saveNews(News n) {
		try {
			this.save(n);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * @Title: getNewsIdByUserId
	 * @Description: 通过用户id得到用户所写文章
	 * @param loginUserIds
	 * @return
	 * @author HanChen
	 * @return String
	 */
	public String getNewsIdByUserId(String loginUserIds) {
		String hql = "";
		hql = "from News n where n.userInfo.userInfoId in " + SqlUtils.toLikeSqlForStr(loginUserIds, ",");
		Session session = super.getSession();
		Query query = session.createQuery(hql);
		List<News> notices = new ArrayList<News>();
		notices = query.list();
		String newsIds = "";
		Iterator<News> it = notices.iterator();
		while (it.hasNext()) {
			News news_next = it.next();
			newsIds += news_next.getNewsId() + ",";
		}
		return newsIds;
	}

	/**
	 * @dec 返回首页中的新闻列表 按浏览量、点赞量降序
	 * @author Ray
	 * @return
	 */
	public List<News> findNewsRecommend() {
		Session session = super.getSession();
		// 按照赞的数量排序
		Query query = session.createQuery("from News where statues=4 order by views DESC,share DESC");
		return query.list();
	}
	
	/**
	 * @Title: getMostHotNews
	 * @Description: 最热文章
	 * @param timeSlot
	 *            排序时间段 默认0：昨天； 1：前天； 2：本周 ；
	 * @return
	 * @author HanChen
	 * @return News
	 */
	public News getMostHotNews(int timeSlot){
		Session session = super.getSession();
		String hql = "from News n where 1=1 and n.publishTime != null and n.auditorId = 30 and n.statues = 4";
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String startDate = "", endDate = "", date = "";
		switch (timeSlot) {
		case 0:
			calendar.add(Calendar.DATE, -1); // 昨天
			date = df.format(calendar.getTime());
			startDate = date + " 00:00:00";
			endDate = date + " 23:59:59";
			break;
		case 1:
			calendar.add(Calendar.DATE, -2); // 前天
			date = df.format(calendar.getTime());
			startDate = date + " 00:00:00";
			endDate = date + " 23:59:59";
			break;
		case 2:
			calendar.add(Calendar.DATE, -1); // 昨天
			endDate = df.format(calendar.getTime()) + " 23:59:59";
			calendar.add(Calendar.DAY_OF_MONTH, -6); // 前一周
			startDate = df.format(calendar.getTime()) + " 00:00:00";
			break;
		}
		if (StringUtils.isNotEmpty(startDate) && StringUtils.isNotEmpty(endDate)) {
			hql += " and n.publishTime >= '" + startDate.trim() + "'";
			hql += " and n.publishTime <= '" + endDate.trim() + "'";
		}
		hql += " order by n.views desc, commentNum desc";		
		Query query = session.createQuery(hql);
		List<News> news = new ArrayList<News>();
		news = query.list();
		News news_next = new News();
		Iterator<News> it = news.iterator();
		while (it.hasNext()) {
			news_next = it.next();
			break;
		}
		return news_next;
	}
}
