package com.aps.backstage.loginUser.dao;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.aps.entity.LoginUser;
import com.framework.BaseDao;
import com.framework.Page;

@Repository
public class BackUserDaoImpl extends BaseDao<LoginUser, String> {
	@Resource
	private SessionFactory sessionFactory;

	/**
	 * 功能： 通过email得到loginUser 实体
	 * 
	 * @param loginName
	 * @return loginUser
	 * @author Ray
	 */
	public LoginUser bfindByEmil(String email) {
		try {
			Query query = this.sessionFactory.getCurrentSession()
					.createQuery("from LoginUser where loginEmail='" + email + "' and roleId>'1'");
			return (LoginUser) query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	

	/**
	 * @Title: userList
	 * @Description: 用户管理
	 * @param pageNum
	 * @param pageSize
	 * @param role
	 * @return
	 * @author HanChen 
	 * @return Page<LoginUser>
	 */
	public Page<LoginUser> userList(int pageNum, int pageSize, int role){
		String hql;
		hql="from LoginUser u where u.role.roleId = " + role;
		try{
			Page<LoginUser> page = new Page<LoginUser>();
			page.setCurrentPageNum(pageNum);
			page.setPageSize(pageSize);
			page = this.findByPage(pageNum, pageSize, hql, null);
			return page;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * @dec  修改用户的用户名
	 * @param l
	 */
	public void updateBUserName(LoginUser l) {
		try {
			super.excuteBySql(
					"update loginUser set loginName=? where loginUserId=?",
					new Object[] { l.getLoginName(), l.getLoginUserId() });
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
