/**
 * @FileName com.aps.userinfo/UserInfoServiceImpl.java 
 * @Project News-Publishing-System
 * @author lenovo 
 * @date 2018年4月28日 下午8:28:58
 * @version 
 * @Description TODO
 */

package com.aps.userinfo.service;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.aps.userinfo.dao.UserInfoDaoImpl;

/**
 * 
 * @ClassName UserInfoServiceImpl
 * @Description 用户详情service 
 * @author HanChen 
 * @version
 *
 */

public class UserInfoServiceImpl {
	
	@Resource
	private UserInfoDaoImpl userInfoDaoImpl;
	
	/**
	 * @Title: deleteUserInfo
	 * @Description: 删除用户详情
	 * @param userInfoIds
	 * @return
	 * @author HanChen 
	 * @return int
	 */
	@Transactional(readOnly = false)
	public int deleteUserInfo(String userInfoIds) {
		return this.userInfoDaoImpl.deleteUserInfo(userInfoIds);
	}	

}
