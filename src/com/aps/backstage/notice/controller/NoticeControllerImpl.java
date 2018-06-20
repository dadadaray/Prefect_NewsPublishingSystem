/**
 * @FileName com.aps.notice.controller/NoticeControllerImpl.java 
 * @Project News-Publishing-System
 * @author lenovo 
 * @date 2018年3月14日 上午10:30:46
 * @version 
 * @Description TODO
 */

package com.aps.backstage.notice.controller;

import java.util.Date;

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
import com.aps.entity.Notice;
import com.aps.entity.UserInfo;
import com.aps.loginUser.service.UserServiceImpl;
import com.aps.news.service.NewsServiceImpl;
import com.aps.notice.service.NoticeServiceImpl;
import com.framework.Page;

@Controller
@RequestMapping("backstage/notice")
public class NoticeControllerImpl {

	@Resource
	private NoticeServiceImpl noticeServiceImpl;

	@Resource
	private UserServiceImpl userServiceImpl;

	@Resource
	private NewsServiceImpl newsServiceImpl;

	/**
	 * @Title: listNotice
	 * @Description:分页查询所有通知,每页8个
	 * @param pageNum
	 *            页码
	 * @param request
	 * @param session
	 * @return
	 * @author HanChen
	 * @return String
	 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String listNotice(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(name = "noticeType", defaultValue = "") String noticeType, HttpServletRequest request,
			HttpSession session) {
		// 获取用户信息
		LoginUser loginUser = (LoginUser) session.getAttribute("bloginUser");

		Page<Notice> page = new Page<Notice>();
		page = this.noticeServiceImpl.listNotice(pageNum, 8, new Object[] { loginUser.getUserInfo().getUserInfoId() });
		session.setAttribute("page", page);

		return "backstage/tongzhi";
	}

	/**
	 * @Title: deleteNotice
	 * @Description: 删除通知
	 * @param noticeId
	 * @param session
	 * @return
	 * @author HanChen
	 * @return String
	 */
	@RequestMapping(value = "deleteNotice", method = RequestMethod.POST)
	@ResponseBody
	public String deleteNotice(@RequestParam(name = "noticeIds") String noticeIds, HttpSession session) {

		int delNum = this.noticeServiceImpl.deleteNotice(noticeIds);

		return delNum + "";
	}

	/**
	 * @Title: getNews
	 * @Description: 后台打开文章详情或审核页面
	 * @param newsId
	 * @param tag
	 *            0 查看文章详情 1审核页面
	 * @param request
	 * @return
	 * @author HanChen
	 * @return String
	 */
	@RequestMapping(value = "findoneNews", method = RequestMethod.GET)
	public String getNews(@RequestParam(name = "newsId") Integer newsId,
			@RequestParam(name = "noticeId", required = false) String noticeId,
			@RequestParam(name = "tag", defaultValue = "1") int tag, HttpServletRequest request, HttpSession session) {
		News news = this.newsServiceImpl.getOneNews(newsId);
		LoginUser user = (LoginUser) session.getAttribute("bloginUser");

		request.setAttribute("OneNews", news);
		request.setAttribute("tag", tag);
		//管理员
		if (user.getRole().getRoleId() == 3) {
			if(StringUtils.isNotEmpty(noticeId)){
				this.noticeServiceImpl.deleteNotice(noticeId);
			}

			if (news.getModVedios().size() > 0) {
				return "backstage/check_content_video";
			}
			if (news.getModFrees().size() > 0) {
				return "backstage/check_content_modelFree";
			}
			if (news.getModMixCenters().size() > 0) {
				return "backstage/check_content_tuwenModel1";
			}
			if (news.getModMixLRs().size() > 0) {
				return "backstage/check_content_tuwenModel2";
			}
			if (news.getModMixSingles().size() > 0) {
				return "backstage/check_content_tuwenModel3";
			}
			if (news.getModAudios().size() > 0) {
				return "check_content_audio";
			}
			if (news.getModBigImgs().size() > 0) {
				return "check_content_bigImg";
			}
		} else {
			// 记者的跳转页面
			if (news.getModVedios().size() > 0) {
				return "backstage/checkb_content_video";
			}
			if (news.getModFrees().size() > 0) {
				return "backstage/checkb_content_modelFree";
			}
			if (news.getModMixCenters().size() > 0) {
				return "backstage/checkb_content_tuwenModel1";
			}
			if (news.getModMixLRs().size() > 0) {
				return "backstage/checkb_content_tuwenModel2";
			}
			if (news.getModMixSingles().size() > 0) {
				return "backstage/checkb_content_tuwenModel3";
			}
			if (news.getModAudios().size() > 0) {
				return "check_content_audio";
			}
			if (news.getModBigImgs().size() > 0) {
				return "check_content_bigImg";
			}
		}
		return null;
	}

	/**
	 * @Title: check
	 * @Description: 新闻审核通过
	 * @param newsId
	 * @param session
	 * @return
	 * @author HanChen
	 * @return int
	 */
	@RequestMapping(value = "check", method = RequestMethod.POST)
	@ResponseBody
	public int check(@RequestParam(name = "newsId") Integer newsId, HttpSession session) {
		// 获取用户信息
		LoginUser loginUser = (LoginUser) session.getAttribute("bloginUser");
		int result = 0;
		Date currentTime = new Date();

		News news = this.newsServiceImpl.getOneNews(newsId);
		news.setStatues(4);
		news.setPublishTime(currentTime);
		this.newsServiceImpl.updateNews(news);

		Notice notice = new Notice();
		notice.setNoticeContent("你的文章《" + news.getNewsTitle() + "》审核通过！");
		notice.setNoticeType(1);
		notice.setNews(news);
		notice.setNoticeCreatTime(currentTime);

		// 设置通知发送人
		UserInfo sendPerson = new UserInfo();
		sendPerson = loginUser.getUserInfo();
		notice.setUserInfo(sendPerson);

		// 设置通知接收人
		notice.setReciveId(news.getUserInfo().getUserInfoId());

		result = this.noticeServiceImpl.saveNotice(notice);

		return result;
	}

	/**
	 * @Title: uncheck
	 * @Description: 审核未通过
	 * @param newsId
	 * @param noticeContent
	 * @param session
	 * @return
	 * @author HanChen
	 * @return int
	 */
	@RequestMapping(value = "uncheck", method = RequestMethod.POST)
	@ResponseBody
	public int uncheck(@RequestParam(name = "newsId") Integer newsId,
			@RequestParam(name = "noticeContent") String noticeContent, HttpSession session) {
		// 获取用户信息
		LoginUser loginUser = (LoginUser) session.getAttribute("bloginUser");
		int result = 0;

		News news = this.newsServiceImpl.getOneNews(newsId);
		news.setStatues(3);
		this.newsServiceImpl.updateNews(news);

		Notice notice = new Notice();
		notice.setNoticeContent("你的文章《" + news.getNewsTitle() + "》需要修改！<br/>修改意见：" + noticeContent.trim());
		notice.setNoticeType(0);
		notice.setNews(news);
		Date currentTime = new Date();
		notice.setNoticeCreatTime(currentTime);

		// 设置通知发送人
		UserInfo sendPerson = new UserInfo();
		sendPerson = loginUser.getUserInfo();
		notice.setUserInfo(sendPerson);

		// 设置通知接收人
		notice.setReciveId(news.getUserInfo().getUserInfoId());

		result = this.noticeServiceImpl.saveNotice(notice);

		return result;

	}

}
