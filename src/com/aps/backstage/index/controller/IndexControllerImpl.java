
package com.aps.backstage.index.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aps.entity.LoginUser;
import com.aps.entity.News;
import com.aps.entity.Notice;
import com.aps.news.service.NewsServiceImpl;
import com.aps.notice.service.NoticeServiceImpl;
import com.framework.Page;

@Controller
@RequestMapping("backstage")
public class IndexControllerImpl {
	
	@Resource
	private NoticeServiceImpl noticeServiceImpl;
	
	@Resource
	private NewsServiceImpl newsServiceImpl;

	/**
	 * @Title: index
	 * @Description: 后台首页的通知列表和数据统计
	 * @param pageNum
	 * @param noticeType
	 * @param request
	 * @param session
	 * @return
	 * @author HanChen 
	 * @return String
	 */
	@RequestMapping(value = "indexs")
	public String index(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(name = "noticeType", defaultValue = "") String noticeType,
			 HttpServletRequest request, HttpSession session) {
		
		// 获取用户信息
		LoginUser loginUser = (LoginUser) session.getAttribute("bloginUser");
		
		Page<Notice> page = new Page<Notice>();
		page = this.noticeServiceImpl.listNotice(pageNum, 8, new Object[] { loginUser.getUserInfo().getUserInfoId()});
		session.setAttribute("page", page);
		
		return "backstage/index";
	}
	
	/**
	 * @Title: indexBack
	 * @Description: 后台管理员登录首页
	 * @param pageNum
	 * @param timeSlot
	 * @param request
	 * @param session
	 * @return
	 * @author HanChen  
	 * @return String
	 */
	@RequestMapping(value="indexBack")
	public String indexBack(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(name = "timeSlot", defaultValue = "0") int timeSlot,
			 HttpServletRequest request, HttpSession session) {
		
		// 获取用户信息
		LoginUser loginUser = (LoginUser) session.getAttribute("bloginUser");
		Page<News> page = new Page<News>();
		page = this.newsServiceImpl.getHotNewsList(pageNum, 5, new Object[] {30}, timeSlot);

		session.setAttribute("page",page);
		
		News theMostHot = new News();
		theMostHot = this.newsServiceImpl.getMostHotNews(timeSlot);
		session.setAttribute("theMostHot",theMostHot);
		
		Page<Notice> noticePage = new Page<Notice>();
		noticePage = this.noticeServiceImpl.listNotice1(pageNum, 8, new Object[] { loginUser.getUserInfo().getUserInfoId()});
		session.setAttribute("noticePage",noticePage);
		session.setAttribute("timeSlot", timeSlot);
		
		return "backstage/index_back";
	}
	
	/**
	 * @author Ray_1 用户退出
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/logOut")
	public String loginOut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.print("退出");
		HttpSession session = request.getSession();// 防止创建Session
		if (session == null) {
			return "backstage/login";
		}
		//session.invalidate();
		session.removeAttribute("loginUser");
		return "backstage/login";
	}
	
	
	
}
