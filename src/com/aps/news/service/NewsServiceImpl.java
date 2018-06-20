/**
 * @FileName com.aps.news.service/NewsServiceImpl.java 
 * @Project News-Publishing-System
 * @author Hanchen 
 * @version 
 * @Description TODO
 */

package com.aps.news.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aps.entity.ModMixLR;
import com.aps.entity.News;
import com.aps.news.dao.NewsDaoImpl;
import com.framework.Page;

/**
 * 
 * @ClassName NewsServiceImpl
 * @Description 新闻Service实现
 * @author HanChen
 * @version
 *
 */
@Service
public class NewsServiceImpl {
	@Resource
	private NewsDaoImpl newsDaoImpl;
	
	/**
	 * @dec 文章推荐
	 * @author Ray
	 * @param newsId
	 */
	@Transactional(readOnly = false)
	public void topSelect(Integer newsId) {
		this.newsDaoImpl.topSelect(newsId);
	}
	
	
	/**
	 * @dec 按时间排序获取 首页推荐文章
	 * @author Ray
	 * @return
	 */
	public List<News> findNewsBigTop() {
		return newsDaoImpl.findNewsBigTop();
	}
	/**
	 * @dec 按时间排序获取 首页推荐文章
	 * @author Ray
	 * @return
	 */
	public List<News> leftVedio() {
		return newsDaoImpl.leftVedio();
	}
	/**
	 * @前台获取所有新闻
	 * @author Ray
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @return
	 */
	public Page<News>findAllNewsFront(int pageNum, int pageSize, Object[] params) {
		return this.newsDaoImpl.findAllNewsFront(pageNum, pageSize, params);
	}
	/**
	 * @dec 按照新闻类别对新闻进行查询
	 * @author Ray
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @return
	 */
	public Page<News>findNewsByTypeId(int pageNum, int pageSize, Object[] params) {
		return this.newsDaoImpl.findnewsByType(pageNum, pageSize, params);
	}
	
	/**
	 * @dec 今天 按浏览量排序的新闻
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @return
	 */
	public Page<News>findANewsFrontToday(int pageNum, int pageSize) {
		return this.newsDaoImpl.findNewsFrontToday(pageNum, pageSize);
	}
	
	
	
	
	/**
	 * @dec  查询单个新闻
	 * @author Ray
	 * @param newsId
	 * @return
	 */
	public News getOneNews(Integer newsId) {
		try {
			return newsDaoImpl.getOneNews(newsId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @dec 返回首页新闻查询列表  按浏览量数排序
	 * @author Ray
	 * @return
	 */
	public List<News> findHonor() {
		return newsDaoImpl.findNewsRecommend();
	}
	
	/**
	 * @function 更新单个新闻
	 * @author Ray
	 * @param News
	 */
	@Transactional(readOnly = false)
	public void updateNews(News news) {
		try {
			this.newsDaoImpl.updateNews(news);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * @Title: publishNewsList
	 * @Description: 得到新闻发布列表
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @param orderBy 排序方式 默认：发布时间  1：分享 2：浏览 3：留言
	 * @return
	 * @author HanChen
	 * @return Page<News>
	 */
	public Page<News> publishNewsList(int pageNum, int pageSize, Object[] params, int orderBy) {
		return this.newsDaoImpl.findPublishList(pageNum, pageSize, params, orderBy);
	}
	
	/**
	 * @Title: checkingNewsList
	 * @Description: 得到新闻编辑者正在审核的新闻列表
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @return
	 * @author HanChen 
	 * @return Page<News>
	 */
	public Page<News> checkingNewsList(int pageNum, int pageSize, Object[] params){
		return this.newsDaoImpl.checkingNewsList(pageNum, pageSize, params);
	}
	
	/**
	 * @Title: uncheckedNewsList
	 * @Description: 新闻编辑者--审核未通过新闻列表
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @return HanChen
	 * @author  
	 * @return Page<News>
	 */
	public Page<News> uncheckedNewsList(int pageNum, int pageSize, Object[] params){
		return this.newsDaoImpl.uncheckedNewsList(pageNum, pageSize, params);
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
	public Page<News> backCheckingNewsList(int pageNum, int pageSize, Object[] params){
		return this.newsDaoImpl.backCheckingNewsList(pageNum, pageSize, params);
	}
	
	/**
	 * @Title: backPublishNewsList
	 * @Description: 后台管理员已发布文章列表
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @param orderBy
	 * @return
	 * @author HanChen 
	 * @return Page<News>
	 */
	public Page<News> backPublishNewsList(int pageNum, int pageSize, Object[] params, int orderBy){
		return this.newsDaoImpl.backPublishList(pageNum, pageSize, params, orderBy);
	}
	
	/**
	 * @Title: backUncheckedNewsList
	 * @Description: 后台管理员审核未通过文章列表
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @return HanChen
	 * @author 
	 * @return Page<News>
	 */
	public Page<News> backUncheckedNewsList(int pageNum, int pageSize, Object[] params){
		return this.newsDaoImpl.backUncheckingNewsList(pageNum, pageSize, params);
	}
	
	/**
	 * @Title: getHotNewsList
	 * @Description: 后台管理员首页文章排行
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @param timeSlot 排序时间段 默认0：昨天； 1：前天； 2：本周 ；
	 * @return
	 * @author HanChen 
	 * @return Page<News>
	 */
	public Page<News> getHotNewsList(int pageNum, int pageSize, Object[] params, int timeSlot){
		return this.newsDaoImpl.getHotNewsList(pageNum, pageSize, params, timeSlot);
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
	public Page<News> draftNewsList(int pageNum, int pageSize, Object[] params){
		return this.newsDaoImpl.draftNewsList(pageNum, pageSize, params);
	}
	
	/**
	 * @Title: deleteNews
	 * @Description: 删除新闻
	 * @param newsIds
	 * @return
	 * @author HanChen 
	 * @return int
	 */
	@Transactional(readOnly = false)
	public int deleteNews(String newsIds) {
		return this.newsDaoImpl.deleteNews(newsIds);	
	}
	/**
	 * @dec 保存新闻
	 * @author Ray
	 * @param news
	 */
	@Transactional(readOnly = false)
	public void saveNews(News news){
		this.newsDaoImpl.saveNews(news);
	}
	
	/**
	 * @Title: getNewsIdByUserId
	 * @Description: 通过用户id得到用户所写文章
	 * @param loginUserIds
	 * @return
	 * @author HanChen
	 * @return String
	 */
	public String getNewsIdByUserId(String loginUserIds){
		return this.newsDaoImpl.getNewsIdByUserId(loginUserIds);	
	}
	
	/**
	 * @Title: getMostHotNews
	 * @Description: 最热文章
	 * @param timeSlot 排序时间段 默认0：昨天； 1：前天； 2：本周 ；	 * 
	 * @return
	 * @author HanChen
	 * @return News
	 */
	public News getMostHotNews(int timeSlot){
		return this.newsDaoImpl.getMostHotNews(timeSlot);
	}
	
}
