package com.aps.backstage.loginUser.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aps.backstage.loginUser.service.BackUserServiceImpl;
import com.aps.entity.LoginUser;
import com.aps.entity.Role;
import com.aps.entity.UserInfo;
import com.aps.news.service.DeleteNewsServiceImpl;
import com.aps.news.service.NewsServiceImpl;
import com.aps.comment.service.CommentServiceImpl;
import com.aps.notice.service.NoticeServiceImpl;
import com.aps.role.service.RoleServiceImpl;
import com.framework.EncodingTool;
import com.framework.Page;

@Controller
@RequestMapping("backstageLoginUser")
public class LoginUserControllerImpl {

	@Resource
	private RoleServiceImpl roleServiceImpl;

	@Resource
	private BackUserServiceImpl backUserServiceImpl;

	@Resource
	private NoticeServiceImpl noticeServiceImpl;

	@Resource
	private NewsServiceImpl newsServiceImpl;
	
	@Resource
	private DeleteNewsServiceImpl deleteNewsServiceImpl;
	
	@Resource
	private CommentServiceImpl commentServiceImpl;

	/**
	 * 功能： 实现注册功能
	 * 
	 * @param name
	 * @param email
	 * @param password
	 * @param session
	 * @author Ray
	 */
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(@RequestParam(name = "username") String name, @RequestParam(name = "emint") String email,
			@RequestParam(name = "passone") String password, HttpSession session, HttpServletRequest request) {
		// code转换
		name = EncodingTool.encodeStr(name);
		// System.out.print("进入controller");
		// 判断email是否符合格式,使用java正则表达式
		if (EncodingTool.isEmail(email)) {
			LoginUser loginUser = new LoginUser();
			loginUser.setLoginEmail(email);
			loginUser.setLoginName(name);
			loginUser.setLoginPassword(password);
			UserInfo userInfo = new UserInfo();
			// 获取用户注册时间
			Date time = new Date();// new Date()为获取当前系统时间
			// 给新注册的用户分配角色
			Role role = this.roleServiceImpl.getRole(2);
			loginUser.setRole(role);
			userInfo.setUserRegistTime(time);
			userInfo.setLoginUser(loginUser);
			// 设置默认头像
			userInfo.setHeadUrl("default.png");
			loginUser.setUserInfo(userInfo);
			String reString = this.backUserServiceImpl.bregiste(loginUser);
			if (reString.equals("0")) {
				System.out.print("保存成功");
				return "/backstage/login";
			}
			// System.out.print(reString);
			return "/backstage/sign_up";
		}
		return "6";
	}

	/**
	 * 功能: 1.能够使用邮箱登录/也可以使用用户名登录 2.验证code 3.验证用户名/邮箱是否存在 4.验证密码的正确性
	 * 5.跳转到index.jsp //在js中修改
	 * 
	 * @param loginName
	 * @param password
	 * @param codeValue
	 * @param session
	 * @return 返回一个string值 0 表示登录成功 -1 表示验证码错误 1 表示数据连接错误 2 表示参数传递错误 14 表示用户名不存在
	 *         16 表示尚未激活 19 表示密码错误
	 * @author Ray
	 * 
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	@ResponseBody
	public String login(@RequestParam(name = "loginName") String loginName,
			@RequestParam(name = "password") String password, HttpSession session) {
		
		// System.out.print(loginName+password);
		String qString = this.backUserServiceImpl.loginVerifys(loginName, password);
		// System.out.print("这是返回值哦："+qString);
		LoginUser bloginUser = this.backUserServiceImpl.bFindUserByEmail(loginName);
		if (qString.equals("0") || qString.equals("5")) {
			session.setAttribute("bloginUser", bloginUser);
			return qString;
		}
		return qString;
	}

	/**
	 * @Title: userList
	 * @Description: 用户管理
	 * @param pageNum
	 * @param roleId
	 *            1：群众；2：记者
	 * @param session
	 * @return
	 * @author HanChen
	 * @return String
	 */
	@RequestMapping(value = "user/list", method = RequestMethod.GET)
	public String userList(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(name = "roleId") int roleId, HttpSession session) {

		Page<LoginUser> page = new Page<LoginUser>();
		page = this.backUserServiceImpl.userList(pageNum, 8, roleId);

		session.setAttribute("page", page);

		if (1 == roleId) {
			return "backstage/all_users";
		} else {
			return "backstage/all_repoter";
		}

	}

	/**
	 * @Title: deleteUsers
	 * @Description: 删除用户
	 * @param userIds
	 * @return
	 * @author HanChen
	 * @return int
	 */
	@RequestMapping(value = "user/delete", method = RequestMethod.POST)
	@ResponseBody
	public int deleteUsers(@RequestParam(name = "userIds") String userInfoIds,HttpSession session) {
		// 0 删除失败      
		//LoginUser user=(LoginUser) session.getAttribute("bloginUser");
		this.commentServiceImpl.deleteComments(userInfoIds);
		
		//删除通知
		String noticeIds = this.noticeServiceImpl.getNoticeByUserId(userInfoIds);
		if (!StringUtils.isBlank(noticeIds)) {// 需要删除用户相关的通知
			this.noticeServiceImpl.deleteNotice(noticeIds);
		}
		//3、删除新闻
		String newsIds = this.newsServiceImpl.getNewsIdByUserId(userInfoIds);
		//删除新闻涉及的所有模板
		this.deleteNewsServiceImpl.deleteModFree(newsIds);
		this.deleteNewsServiceImpl.deleteMixCenter(newsIds);
		this.deleteNewsServiceImpl.deleteMixLF(newsIds);
		this.deleteNewsServiceImpl.deleteModMixSingle(newsIds);
		this.deleteNewsServiceImpl.deleteModBigImg(newsIds);
		this.deleteNewsServiceImpl.deleteModVedio(newsIds);
		this.deleteNewsServiceImpl.deleteModAudio(newsIds);
		//删除新闻基础实体
		if (!StringUtils.isBlank(newsIds)) {
			this.newsServiceImpl.deleteNews(newsIds);
		}
		//删除用户
		this.backUserServiceImpl.deleteUser(userInfoIds);
		return 1 ;
	}

}
