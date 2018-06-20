package com.aps.backstage.loginUser.service;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor;

import com.aps.backstage.loginUser.dao.BackUserDaoImpl;
import com.aps.entity.LoginUser;
import com.aps.loginUser.dao.LoginUserDaoImpl;
import com.aps.userinfo.dao.UserInfoDaoImpl;
import com.framework.Page;

@Service
@Transactional(readOnly = true)
public class BackUserServiceImpl {
	
	@Resource
	private LoginUserDaoImpl loginUserDaoImpl;
	
	@Resource
	private BackUserDaoImpl backUserDaoImpl;
	
	@Resource
	private UserInfoDaoImpl userInfoDaoImpl;

	/**
	 * @dec  注册
	 * @author Ray
	 * @param loginUser
	 * @return
	 */
	@Transactional(readOnly = false)
	public String bregiste(LoginUser loginUser) {
		if (this.backUserDaoImpl.bfindByEmil(loginUser.getLoginEmail()) != null) {
			return "3";
		}
		this.loginUserDaoImpl.register(loginUser);
		return "0";

	}

	@Transactional(readOnly = false)
	public LoginUser bFindUserByEmail(String email) {
		return this.backUserDaoImpl.bfindByEmil(email);
	}

	/**
	 * 功能： 判断是否激活
	 * 
	 * @param loginName
	 * @param password
	 * @author Ray
	 * @return 0 表示登录成功 -1 表示验证码错误 1 表示数据连接错误 2 表示参数传递错误 14 表示用户名不存在 16 表示尚未激活
	 *         19 表示密码错误
	 * 
	 */
	public String loginVerifys(String email, String password) {
		// 判断登录名称是否为email
		LoginUser t1 = this.backUserDaoImpl.bfindByEmil(email);

		//// 判断密码是否正确

		if (t1 == null || !t1.getLoginPassword().equals(password)) {
			System.out.print("这是错误的账号");
			return "-1";
		}
		System.out.print("正确账号。");
		// 登录成功！
		//判断记者 跳转记者页面
		if(t1.getRole().getRoleId().equals(2)){
			return "0";
		}else if(t1.getRole().getRoleId().equals(3)){
			//管理员跳转
			return "5";
		}
		return "-1";
		
	}
	

	/**
	 * @Title: userList
	 * @Description: 用户管理
	 * @param pageNum
	 * @param pageSize
	 * @param roleId
	 * @return
	 * @author HanChen 
	 * @return Page<LoginUser>
	 */
	public Page<LoginUser> userList(int pageNum, int pageSize, int roleId){
		return this.backUserDaoImpl.userList(pageNum, pageSize, roleId);
	}

	/**
	 * @dec  更新用户名
	 * @param l
	 */
	@Transactional(readOnly = false)
	public void bupdateUserName(LoginUser l) {
		this.backUserDaoImpl.updateBUserName(l);
	}
	
	/**
	 * @Title: deleteUser
	 * @Description: 删除用户
	 * @param userIds
	 * @return
	 * @author HanChen 
	 * @return int
	 */
	@Transactional(readOnly = false)
	public int deleteUser(String userInfoIds){
		int delUserInfo = 0, delLoginUser = 0;
		
		String loginUserIds = userInfoDaoImpl.getLoginUserId(userInfoIds);
		if(!StringUtils.isBlank(loginUserIds)){
			//删除用户详情
			delUserInfo = userInfoDaoImpl.deleteUserInfo(userInfoIds);
			//删除用户基础信息
			delLoginUser = loginUserDaoImpl.deleteUser(loginUserIds);
		}
		if ( 0 != delLoginUser){
			return delUserInfo + delLoginUser;
		}else{
			return delLoginUser;
		}
		
	}
	
}
