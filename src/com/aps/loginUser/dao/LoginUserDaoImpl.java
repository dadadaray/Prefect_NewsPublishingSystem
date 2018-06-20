package com.aps.loginUser.dao;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import com.aps.entity.LoginUser;
import com.framework.BaseDao;
import com.framework.SqlUtils;

@Repository
public class LoginUserDaoImpl extends BaseDao<LoginUser, String> {
	@Resource
	private SessionFactory sessionFactory;

	/**
	 * 注册页面
	 * 
	 * @author Ray
	 * @param loginUser
	 * @return
	 */
	public String register(LoginUser loginUser) {
		try {			
			super.save(loginUser);
			//System.out.print("数据库保存成功！");
			return "0";
		} catch (Exception e) {
			e.printStackTrace();
			return "1";
		}
	}

	/**
	 * 功能： 通过loginName得到loginUser 实体
	 * 
	 * @param loginName
	 * @return loginUser
	 * @author Ray
	 */
	public LoginUser findByLoginName(String loginName) {
		try {
			Query query = this.sessionFactory.getCurrentSession()
					.createQuery("from LoginUser where loginName='" + loginName + "' and roleId='1'");
			return (LoginUser) query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 功能： 通过email得到loginUser 实体
	 * 
	 * @param loginName
	 * @return loginUser
	 * @author Ray
	 */
	public LoginUser findByEmil(String email) {
		try {
			Query query = this.sessionFactory.getCurrentSession()
					.createQuery("from LoginUser where loginEmail='" + email + "' and roleId='1'");
			return (LoginUser) query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 功能： 更新用户信息
	 * 
	 * @param loginUser
	 * @author Ray
	 * 
	 */
	public void updateLoginUser(LoginUser loginUser) {
		try {
			LoginUser l1 = this.findByLoginName(loginUser.getLoginName());
			super.excuteBySql(
					"update loginUser set loginName=?,loginPassword=?,loginEmail=?,loginActive=? where loginUserId=?",
					new Object[] { loginUser.getLoginName(), loginUser.getLoginPassword(), loginUser.getLoginEmail(),
							loginUser.isLoginActive(), l1.getLoginUserId() });
		} catch (Exception e) {
			e.printStackTrace();
			// 对错误的处理

		}
	}
	
	
	/**
	 * @Title: deleteUser
	 * @Description: 删除用户
	 * @param userIds
	 * @return
	 * @author HanChen 
	 * @return int
	 */
	public int deleteUser(String userIds){
		int ret = 0;
		try {
			Query query = this.sessionFactory.getCurrentSession()
					.createQuery("delete from LoginUser u where u.loginUserId in" + SqlUtils.toLikeSqlForStr(userIds, ","));
			ret = query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

}
