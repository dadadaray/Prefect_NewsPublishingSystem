package com.aps.comment.controller;

import java.util.Date;
import java.util.Iterator;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aps.backstage.userinfo.service.BackUserInfoServiceImpl;
import com.aps.comment.service.CommentServiceImpl;
import com.aps.entity.Comment;
import com.aps.entity.LoginUser;
import com.aps.entity.News;
import com.aps.news.controller.NewsFrontControllerImpl;
import com.aps.news.service.NewsServiceImpl;
import com.aps.userinfo.service.UserInfoServiceImpl;
import com.framework.EncodingTool;

@Controller
@RequestMapping("comment")
public class CommentControllerImpl {

	@Resource
	private NewsServiceImpl newsServiceImpl;

	@Resource
	private CommentServiceImpl commentServiceImpl;

	/**
	 * @dec 删除用户的所有评论
	 * @author Ray
	 * @param noticeIdsIds
	 * @return
	 */
	@RequestMapping(value = "delectAllComment", method = RequestMethod.GET)
	@ResponseBody
	public int deleteComments(@RequestParam(name = "userInfoId") String noticeIdsIds){
		int  delNews =  this.commentServiceImpl.deleteComments(noticeIdsIds);
		return delNews;
	}

	/**
	 * @dec 添加父级评论和二级评论
	 * @author Ray
	 * @param newsId
	 * @param content
	 * @param commentId
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "{newsId}", method = RequestMethod.GET)
	public String submitComment(@PathVariable("newsId") Integer newsId, @RequestParam(name = "content") String content,
			@RequestParam(name = "commentId", required = false) Integer commentId, HttpServletRequest request,
			HttpSession session) {
		LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login";
		}
		// code转换
		content = EncodingTool.encodeStr(content);
		News news = this.newsServiceImpl.getOneNews(newsId);
		if (commentId == null) {
			// 添加父元素
			Comment comment = new Comment();
			comment.setNews(news);
			comment.setCommentContent(content);
			comment.setCommentPublishTime(new Date());
			comment.setUserInfo(loginUser.getUserInfo());
			news.getComments().add(comment);
			this.commentServiceImpl.saveComment(comment);
		} else {
			//添加自评论
			Comment comment = new Comment();
			comment.setNews(news);
			comment.setCommentContent(content);
			comment.setCommentPublishTime(new Date());
			comment.setParentComment(this.commentServiceImpl.getCommentById(commentId));
			comment.setUserInfo(loginUser.getUserInfo());
			this.commentServiceImpl.saveComment(comment);
		}
		// 评论量加一
		if(news.getCommentNum()==null){
			news.setCommentNum(0);
		}
		news.setCommentNum(news.getCommentNum() + 1);
	    this.newsServiceImpl.updateNews(news);
		return "redirect:/newsFront/findoneNews?newsId=" + newsId;
	}

}
