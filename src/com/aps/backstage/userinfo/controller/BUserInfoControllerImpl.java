package com.aps.backstage.userinfo.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aps.backstage.loginUser.service.BackUserServiceImpl;
import com.aps.backstage.userinfo.service.BackUserInfoServiceImpl;
import com.aps.entity.LoginUser;
import com.aps.entity.UserInfo;
import com.framework.EncodingTool;

@Controller
@RequestMapping("backstage/userInfo")
public class BUserInfoControllerImpl {
	
	@Resource
	private BackUserServiceImpl backUserServiceImpl;
	
	@Resource
	private BackUserInfoServiceImpl backUserInfoServiceImpl;

	@RequestMapping(value = "saveEditor", method = RequestMethod.POST)
	public String saveInfo(@RequestParam(name = "bUserName") String userName,
			@RequestParam(name = "bphone") String phone, @RequestParam(name = "creed") String creed,
			@RequestParam(name = "intro") String intro, HttpSession session, HttpServletRequest request) {
		
		userName=EncodingTool.encodeStr(userName);
		creed=EncodingTool.encodeStr(creed);
		intro=EncodingTool.encodeStr(intro);
		//System.out.print(userName+phone+creed+intro);
		LoginUser user = (LoginUser) session.getAttribute("bloginUser");
		
		UserInfo userInfo=user.getUserInfo();
		userInfo.getLoginUser().setLoginName(userName);
		userInfo.setCreed(creed);
		userInfo.setInfo(intro);
		userInfo.setPhone(phone);
		user.setUserInfo(userInfo);       
        this.backUserInfoServiceImpl.updateUserInfo(userInfo);
        
		return "backstage/userinfo";
	}
	
	

}
