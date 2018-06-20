package com.aps.loginUser.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aps.entity.Role;
import com.aps.entity.LoginUser;
import com.aps.entity.UserInfo;
import com.aps.loginUser.service.UserServiceImpl;
import com.aps.role.service.RoleServiceImpl;
import com.framework.EncodingTool;

@Controller
@RequestMapping("loginUser")
public class UserControllerImpl {
	@Resource
	private UserServiceImpl userServiceImpl;
	@Resource
	private RoleServiceImpl roleServiceImpl;

	/**
	 * 功能： 实现注册功能 同时实现发送邮件的功能！
	 * 
	 * @param name
	 * @param email
	 * @param password
	 * @param session
	 * @return 0表示邮件发送成功 1 代表数据库连接失败，服务器问题 2 代表参数传递错误，网络问题，请刷新重试 3
	 *         代表用户名已经存在，请重新输入 4 代表邮箱已经存在，请重新输入 5 代表邮箱不符合格式
	 * @author Ray
	 */
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(@RequestParam(name = "name") String name, @RequestParam(name = "email") String email,
			@RequestParam(name = "password") String password, HttpSession session, HttpServletRequest request) {
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
			Role role = this.roleServiceImpl.getRole(1);
			loginUser.setRole(role);
			userInfo.setUserRegistTime(time);
			userInfo.setLoginUser(loginUser);
			userInfo.setHeadUrl("default.png");
			loginUser.setUserInfo(userInfo);
			String result = this.userServiceImpl.register(loginUser,
					request.getServerName() + ":" + request.getServerPort());
			if (result == "0") {
				System.out.print("为什么不跳转到registerSure 页面");
				// 这里是迫不得已才改成的自动跳转，本来想的是自动关闭页面，但是由于google浏览器的限制，没有实现该功能！
				String welcome = "您的注册邮箱为：" + email + "快去邮箱激活账户吧！";
				session.setAttribute("regiserWelcome", welcome);
				session.setAttribute("registerTitle", "注册成功");
				session.setAttribute("registerEmail", email);
				// System.out.print("都获取了email哦！");
				return "registerSure";
			}
			return result;
		}
		return "5";
	}

	/**
	 * 功能： 1.激活注册账号 2.使页面跳转到登录页面 3.设置用户头像
	 * 
	 * @param active
	 * @param loginName
	 * @param session
	 * @return 跳转到注册确认界面
	 * @author Ray
	 * 
	 */
	@RequestMapping(value = "activeLoginUser", method = RequestMethod.GET)
	public String activeLoginUser(@RequestParam(name = "loginName") String loginName, HttpSession session,
			HttpServletRequest request) {
		loginName = EncodingTool.encodeStr(loginName);
		LoginUser loginUser = this.userServiceImpl.findByName(loginName);
		System.out.print("这是注册完的用户名：" + loginName);
		if (loginUser == null) {
			return "error";
		}
		loginUser.setLoginActive(true); // 激活用户
		this.userServiceImpl.updateLoginUser(loginUser); // 更新
		String content = "<h4> <small>本页面将于10秒内自动跳转到登录！<a href='" + request.getContextPath()
				+ "/login.jsp'>立即跳转</a></small></h4>";
		session.setAttribute("regiserWelcome", "您的注册邮箱为:" + loginUser.getLoginEmail() + ",恭喜您激活成功，快去体验新闻天下吧！");
		session.setAttribute("registerTitle", "激活成功");
		session.setAttribute("registerEmail", loginUser.getLoginEmail());
		session.setAttribute("registerContent", content);
		return "registerSure";
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
			@RequestParam(name = "password") String password,
			@RequestParam(name = "codeValue", defaultValue = "") String codeValue, HttpSession session) {
		String code = (String) session.getAttribute("post_validate_code");
		if (!code.equalsIgnoreCase(codeValue)) {
			return "-1";
		}
		String result = this.userServiceImpl.loginVerify(loginName, password);
		if (!result.equals("0")) {
			return result;
		}
		// 输入正确
		LoginUser loginUser = this.userServiceImpl.findLoginUser(loginName);
		if (result.equals("0")) {
			session.setAttribute("loginUser", loginUser);
		}
		Calendar date = Calendar.getInstance();
		//System.out.print(result);
		return result;
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
		session.invalidate();
		// session.removeAttribute("loginUser");
		return "login";
	}


}
