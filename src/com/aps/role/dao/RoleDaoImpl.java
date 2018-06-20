package com.aps.role.dao;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.aps.entity.Role;
import com.framework.BaseDao;



@Repository
public class RoleDaoImpl extends BaseDao<Role, String>{
   
	@Resource
	private SessionFactory sessionFactory;
	/**
	 * @function 根据role的id查询单个role
	 * @author Ray
	 * @param bugId
	 * @return
	 */
	public Role getRole(Integer roleId){
		try {
			Role role=super.get(roleId);
			return role;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
}
