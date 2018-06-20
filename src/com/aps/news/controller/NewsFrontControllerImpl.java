package com.aps.news.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.aps.entity.News;
import com.aps.entity.NewsType;
import com.aps.news.service.NewsServiceImpl;
import com.aps.newsType.service.NewsTypeServiceImpl;
import com.framework.EncodingTool;
import com.framework.Page;

@Controller
@RequestMapping("newsFront")
public class NewsFrontControllerImpl {

	@Resource
	private NewsServiceImpl newsServiceImpl;
	
	@Resource
	private NewsTypeServiceImpl NewsTypeServiceImpl;
	
	/**
	 * @dec 显示一条新闻
	 * @author Ray
	 * @param newsId
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "findoneNews", method = RequestMethod.GET)
	public String getNews(@RequestParam(name = "newsId") Integer newsId, HttpServletRequest request) {
		News news = this.newsServiceImpl.getOneNews(newsId);
		// LoginUser loginUser = (LoginUser)
		// request.getSession().getAttribute("loginUser");
		// System.out.print(newsId);
		news.setViews(news.getViews() + 1);
		this.newsServiceImpl.updateNews(news);
		request.setAttribute("OneNews", news);
		if (news.getModVedios().size() > 0) {
			return "news_post_video";
		}
		if (news.getModFrees().size() > 0) {
			return "news_free";
		}
		if (news.getModMixCenters().size() > 0) {
			return "news_post_style1";
		}
		if (news.getModMixLRs().size() > 0) {
			return "news_post_style2";
		}
		if (news.getModMixSingles().size() > 0) {
			return "news_post_style3";
		}
		if (news.getModAudios().size() > 0) {
			return "news_post_listen";
		}
		if (news.getModBigImgs().size() > 0) {
			return "Bgimgshow";
		}
		return null;
	}

	/**
	 * @dec 前台分页获取所有新闻 每页七条 按时间排序
	 * @author Ray
	 * @param pageNum
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="frontListAllNews",method=RequestMethod.GET)
	public String frontListAllNews(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum, HttpSession session,
			HttpServletRequest request) {
		Page<News> page;
		page = this.newsServiceImpl.findAllNewsFront(pageNum, 7, null);
		if (page == null) {
			request.setAttribute("page", null);
		} else {
			request.setAttribute("page", page);
		}
		return "lists";

	}
	/**
	 * @dec  前台按类别显示新闻
	 * @author Ray
	 * @param newsTypeName
	 * @param pageNum
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="frontListNewsByType",method=RequestMethod.GET)
	public String frontListNewsByType(@RequestParam(name="newsTypeId") Integer newsTypeId,@RequestParam(name = "pageNum", defaultValue = "1") int pageNum, HttpSession session,
			HttpServletRequest request) {
		NewsType type=this.NewsTypeServiceImpl.getNewTypeById(newsTypeId);
		Page<News> page;
		page = this.newsServiceImpl.findNewsByTypeId(pageNum, 7,new Object[]{type.getNewsTypeId()});
		if (page == null) {
			request.setAttribute("page", null);
		} else {
			request.setAttribute("page", page);
		}
		request.setAttribute("newsTypeNameFront", type.getTypeName());
		return "lists";

	}	
	

}
