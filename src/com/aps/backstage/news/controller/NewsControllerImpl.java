/**
 * @FileName com.aps.backstage.news.controller/PublishNews.java 
 * @Project News-Publishing-System
 * @author lenovo 
 * @date 2018年4月17日 下午8:58:45
 * @version 
 * @Description TODO
 */

package com.aps.backstage.news.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aps.entity.LoginUser;
import com.aps.entity.News;
import com.aps.news.service.NewsServiceImpl;
import com.aps.notice.service.NoticeServiceImpl;
import com.aps.news.service.DeleteNewsServiceImpl;
import com.framework.Page;
import com.sun.org.glassfish.gmbal.ParameterNames;

/**
 * 
 * @ClassName NewsFrontControllerImpl
 * @Description 新闻管理
 * @author HanChen
 * @version
 *
 */
@Controller
@RequestMapping("backstage/news")
public class NewsControllerImpl {
	
	@Resource
	private NewsServiceImpl newsServiceImpl;
	
	@Resource
	private NoticeServiceImpl noticeServiceImpl;
	
	@Resource
	private DeleteNewsServiceImpl deleteNewsServiceImpl;
	
	/**
	 * @dec 推荐位
	 * @author Ray
	 * @param newsId
	 * @return
	 */
	@RequestMapping(value="topSelect",method=RequestMethod.GET)
	public String topselect(@RequestParam(name="newsId") Integer newsId){
		this.newsServiceImpl.topSelect(newsId);
		return "backstage/all_news_back";
	}
	
	/**
	 * @Title: publishNewsList
	 * @Description: 已发布的新闻列表
	 * @param pageNum
	 * @param orderBy 排序方式 默认：发布时间  1：分享 2：浏览 3：留言
	 * @param session
	 * @return
	 * @author HanChen 
	 * @return String
	 */
	@RequestMapping(value = "publish/list", method = RequestMethod.GET)
	public String publishList(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum, 
			@RequestParam(name = "orderBy", defaultValue = "0") int orderBy, HttpSession session)  {

		// 获取用户信息
		LoginUser loginUser = (LoginUser) session.getAttribute("bloginUser");
		
		Page<News> page = new Page<News>();
		page = this.newsServiceImpl.publishNewsList(pageNum, 8, new Object[] { loginUser.getUserInfo().getUserInfoId()}, orderBy);

		session.setAttribute("page", page);
		return "backstage/all_news";
	}
	
	/**
	 * @Title: checkingList
	 * @Description: 正在审核的新闻列表
	 * @param pageNum
	 * @param session
	 * @return
	 * @author HanChen  
	 * @return String
	 */
	@RequestMapping(value = "checking/list", method = RequestMethod.GET)
	public String checkingList(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum, HttpSession session){
		
		// 获取用户信息
		LoginUser loginUser = (LoginUser) session.getAttribute("bloginUser");
		
		Page<News> page = new Page<News>();
		page = this.newsServiceImpl.checkingNewsList(pageNum, 8, new Object[] { loginUser.getUserInfo().getUserInfoId()});

		session.setAttribute("page", page);
		return "backstage/all_news_checking";
	}
	
	/**
	 * @Title: unCheckedList
	 * @Description: 未审核通过的新闻列表
	 * @param pageNum
	 * @param session
	 * @return
	 * @author HanChen
	 * @return String
	 */
	@RequestMapping(value = "unchecked/list", method = RequestMethod.GET)
	public String unCheckedList(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum, HttpSession session){
		// 获取用户信息
		LoginUser loginUser = (LoginUser) session.getAttribute("bloginUser");
		
		Page<News> page = new Page<News>();
		page = this.newsServiceImpl.uncheckedNewsList(pageNum, 8, new Object[] { loginUser.getUserInfo().getUserInfoId()});

		session.setAttribute("page", page);
		return "backstage/all_news_checked";
	}
	
	/**
	 * @Title: backCheckingList
	 * @Description: 后台管理员待审核文章列表
	 * @param pageNum
	 * @param session
	 * @return
	 * @author HanChen 
	 * @return String
	 */
	@RequestMapping(value = "back/checking/list", method = RequestMethod.GET)
	public String backCheckingList(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum, HttpSession session){
		// 获取用户信息
		LoginUser loginUser = (LoginUser) session.getAttribute("bloginUser");
		
		Page<News> page = new Page<News>();
		page = this.newsServiceImpl.backCheckingNewsList(pageNum, 8, new Object[] { loginUser.getUserInfo().getUserInfoId()});

		session.setAttribute("page", page);
		return "backstage/all_news_back_checking";		
	}	
	
	/**
	 * @Title: backPublishList
	 * @Description: 后台管理员已发布文章列表
	 * @param pageNum
	 * @param orderBy
	 * @param session
	 * @return
	 * @author HanChen  
	 * @return String
	 */
	@RequestMapping(value = "back/publish/list", method = RequestMethod.GET)
	public String backPublishList(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum, 
			@RequestParam(name = "orderBy", defaultValue = "0") int orderBy, HttpSession session)  {
		// 获取用户信息
		LoginUser loginUser = (LoginUser) session.getAttribute("bloginUser");
		
		Page<News> page = new Page<News>();
		page = this.newsServiceImpl.backPublishNewsList(pageNum, 8, new Object[] { loginUser.getUserInfo().getUserInfoId()}, orderBy);

		session.setAttribute("page", page);
		return "backstage/all_news_back";		
	}
	
	/**
	 * @Title: backUncheckedList
	 * @Description: 后台管理员审核未通过文章列表
	 * @param pageNum
	 * @param session
	 * @return
	 * @author HanChen
	 * @return String
	 */
	@RequestMapping(value = "back/unchecked/list", method = RequestMethod.GET)
	public String backUncheckedList(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum, HttpSession session){
		// 获取用户信息
		LoginUser loginUser = (LoginUser) session.getAttribute("bloginUser");
		
		Page<News> page = new Page<News>();
		page = this.newsServiceImpl.backUncheckedNewsList(pageNum, 8, new Object[] { loginUser.getUserInfo().getUserInfoId()});

		session.setAttribute("page", page);
		
		return "backstage/all_news_back_checked";		
	}
	
	/**
	 * @Title: deleteNews
	 * @Description: 删除新闻与新闻相关的通知
	 * @param newsIds
	 * @return
	 * @author HanChen 
	 * @return int
	 */
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public int deleteNews(@RequestParam(name = "newsIds") String newsIds){
		int delNotice = 0, delNews = 0, results = 0;
		String noticeIds = this.noticeServiceImpl.getNoticeByNewsId(newsIds);
		if(!StringUtils.isBlank(noticeIds)){//需要删除文章相关的通知
			delNotice =  this.noticeServiceImpl.deleteNotice(noticeIds);
		}
		//删除新闻涉及的所有模板
		this.deleteNewsServiceImpl.deleteModFree(newsIds);
		this.deleteNewsServiceImpl.deleteMixCenter(newsIds);
		this.deleteNewsServiceImpl.deleteMixLF(newsIds);
		this.deleteNewsServiceImpl.deleteModMixSingle(newsIds);
		this.deleteNewsServiceImpl.deleteModBigImg(newsIds);
		this.deleteNewsServiceImpl.deleteModVedio(newsIds);
		this.deleteNewsServiceImpl.deleteModAudio(newsIds);
		
		delNews =  this.newsServiceImpl.deleteNews(newsIds);
		if( 0 != delNews){
			results = delNotice + delNews;
		}
		
		return results;
	}
	
	/**
	 * @Title: openEdit
	 * @Description: 打开编辑页面
	 * @param newsId
	 * @param request
	 * @return
	 * @author HanChen
	 * @return String
	 */
	@RequestMapping(value = "openEdit", method = RequestMethod.GET)
	public String openEdit(@RequestParam(name = "newsId") Integer newsId, HttpServletRequest request) {
		News news = this.newsServiceImpl.getOneNews(newsId);
		request.setAttribute("OneNews", news);
		if (news.getModVedios().size() > 0) {
			return "backstage/add_news_video";
		}
		if (news.getModFrees().size() > 0) {
			return "backstage/add_news";
		}
		if (news.getModMixCenters().size() > 0) {
			return 	"backstage/add_news_tuwenModel2";		
		}
		if (news.getModMixLRs().size() > 0) {
			return "backstage/add_news_tuwenModel1";
			
		}
		if (news.getModMixSingles().size() > 0) {
			return "backstage/add_news_tuwenModel3";
		}
		if (news.getModAudios().size() > 0) {
			return "backstage/add_news_audio";
		}
		if (news.getModBigImgs().size() > 0) {
			return "backstage/add_news_img";
		}
		return null;
	}	
	
}
