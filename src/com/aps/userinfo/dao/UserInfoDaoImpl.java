package com.aps.userinfo.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.aps.entity.Notice;
import com.aps.entity.UserInfo;
import com.framework.BaseDao;
import com.framework.SqlUtils;

@Repository
public class UserInfoDaoImpl extends BaseDao<UserInfo, String> {
	@Resource
	private SessionFactory sessionFactory;
	/**
	 * @function 根据id查询单个UserInfo
	 * @author Ray
	 * @param id
	 * @return
	 */
	public UserInfo findById(Integer id) {
		try {
			return super.findOne("from UserInfo u where u.userInfoId=?", new Object[] { id });
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	

	/**
	 * @author Ray_1 更新用户的个人头像 保存到数据库
	 * @param u
	 */
	public void updateImgUrl(int id, String url) {
		UserInfo u = findById(id);
		//System.out.println("url:" + url);
		u.setHeadUrl(url);
		updateUserInfo(u);
	}
	
	 /**
     * @function 更新用户信息
     * @author Ray
     * @param u
     */
	public void updateUserInfo(UserInfo u) {
		System.out.print("到了dao");
		try {
			this.excuteBySql("update userinfo set phone=?, creed=?, headUrl=?,info=?,headUrl=? where userInfoId=?",
					new Object[]{u.getPhone(),u.getCreed(),u.getHeadUrl(),u.getInfo(),u.getHeadUrl(),u.getUserInfoId()});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @Title: deleteUserInfo
	 * @Description: 删除用户详情
	 * @param userInfoIds
	 * @return
	 * @author HanChen 
	 * @return int
	 */
	public int deleteUserInfo(String userInfoIds){
		int ret = 0;
		try {
			Query query = this.sessionFactory.getCurrentSession()
					.createQuery("delete from UserInfo u where u.userInfoId in" + SqlUtils.toLikeSqlForStr(userInfoIds, ","));
			ret = query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	/**
	 * @Title: getLoginUserId
	 * @Description: 根据UserInfoIds获得LoginUserIds
	 * @param userInfoIds
	 * @return
	 * @author HanChen
	 * @return String
	 */
	public String getLoginUserId(String userInfoIds){
		String hql = "";
		hql = "from UserInfo u where u.userInfoId in " + SqlUtils.toLikeSqlForStr(userInfoIds, ",");
		Session session = super.getSession();
		Query query = session.createQuery(hql);
		List<UserInfo> userInfos = new ArrayList<UserInfo>();
		userInfos = query.list();
		String loginUserIds = "";
		Iterator<UserInfo> it = userInfos.iterator();
		while (it.hasNext()) {
			UserInfo userInfo_next = it.next();
			loginUserIds += userInfo_next.getLoginUser().getLoginUserId()+ ",";
		}
		return loginUserIds;
	}

}
