package com.aps.hibernateSearch.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aps.entity.News;
import com.aps.hibernateSearch.service.HibernateServiceImpl;
import com.framework.EncodingTool;
import com.framework.Page;

@Controller
@RequestMapping("Search")
public class HibernateSearchControllerImpl  {
	@Resource
	private HibernateServiceImpl hibernateSearchServiceImpl;
	/**
	 * @author Ray_1
	 * @param search
	 * @param pageNum
	 * @param session
	 * @return
	 */
	@RequestMapping("/hibsearnews")
	public String listbug(@RequestParam("s") String search,
			@RequestParam(name = "pageBugNum", defaultValue = "1") int pageNum, HttpSession session) {
		//Date startTime =new Date();
		Page<News> page;
		search = EncodingTool.encodeStr(search);
		// System.out.println("search:" + search );
		// System.out.println("到了controller"+"search"+search);
		page = this.hibernateSearchServiceImpl.findNewsByHiberPage(pageNum, 8, search);
		// System.out.println("一共多少条："+page.getTotalCount());
		if (page != null)
			session.setAttribute("newsPageCount", page.getTotalCount());
		Date endTime =new Date();
		//session.setAttribute("experienceTime", (endTime.getTime()-startTime.getTime())/1000+"."+(endTime.getTime()-startTime.getTime())%1000/100);
		session.setAttribute("newspages", page);
		session.setAttribute("searchValue", search);
		return "/lists";
	}


}
