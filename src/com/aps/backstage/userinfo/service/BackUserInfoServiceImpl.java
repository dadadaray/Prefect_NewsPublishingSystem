package com.aps.backstage.userinfo.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aps.entity.UserInfo;
import com.aps.userinfo.dao.UserInfoDaoImpl;

@Service
public class BackUserInfoServiceImpl {
	@Resource
	private UserInfoDaoImpl UserInfoDaoImpl;

	/**
	 * @dec 更新用户名
	 * @author Ray
	 * @param id
	 * @param url
	 */
	@Transactional(readOnly = false)
	public void updateImgUrl(int id, String url) {
		UserInfoDaoImpl.updateImgUrl(id, url);
	}
	/**
	 * @dec  更新用户信息
	 * @author Ray
	 * @param u
	 */
	@Transactional(readOnly = false)
	public void updateUserInfo(UserInfo u){
		System.out.print("到了service");
		this.UserInfoDaoImpl.updateUserInfo(u);
	}

}
