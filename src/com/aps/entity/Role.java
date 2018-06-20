package com.aps.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="role")
public class Role {
	//属性 
		private Integer roleId; //id //主键
		private String  roleName; //角色名
		private Set<LoginUser> loginUsers = new HashSet<LoginUser>(0); // 角色所拥有用户
		//set/get方法	
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		public Integer getRoleId() {
			return roleId;
		}
		public void setRoleId(Integer roleId) {
			this.roleId = roleId;
		}
		public String getRoleName() {
			return roleName;
		}
		public void setRoleName(String roleName) {
			this.roleName = roleName;
		}
		@OneToMany(mappedBy = "role")
		public Set<LoginUser> getUsers() {
			return loginUsers;
		}
		public void setUsers(Set<LoginUser> loginUsers) {
			this.loginUsers = loginUsers;
		}
}
