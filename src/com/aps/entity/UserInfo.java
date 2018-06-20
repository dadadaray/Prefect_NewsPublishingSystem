package com.aps.entity;


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name = "userinfo")
public class UserInfo {

	private Integer userInfoId; // id
	private String phone; // 电话号码
	private String creed; // 信条
	private String info; // 个人简介
	private Integer sendpassNum; // 发送文章数量
	private String headUrl; // 头像
	private Date userRegistTime; // 用户注册时间
	private LoginUser loginUser; // 用户
	private Set<News> news = new HashSet<News>(0); // 用户写的新闻
	private Set<Notice> notices = new HashSet<Notice>(0); // 用户的评论

	@Id
	@GenericGenerator(name = "foreignkey", strategy = "foreign", parameters = @Parameter(value = "loginUser", name = "property"))
	@GeneratedValue(generator = "foreignkey")
	public Integer getUserInfoId() {
		return userInfoId;
	}

	public void setUserInfoId(Integer userInfoId) {
		this.userInfoId = userInfoId;
	}

	@OneToOne(mappedBy = "userInfo", fetch = FetchType.EAGER)
	public LoginUser getLoginUser() {
		return loginUser;
	}

	public void setLoginUser(LoginUser loginUser) {
		this.loginUser = loginUser;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCreed() {
		return creed;
	}

	public void setCreed(String creed) {
		this.creed = creed;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Integer getSendpassNum() {
		return sendpassNum;
	}

	public void setSendpassNum(Integer sendpassNum) {
		this.sendpassNum = sendpassNum;
	}

	public String getHeadUrl() {
		return headUrl;
	}

	public void setHeadUrl(String headUrl) {
		this.headUrl = headUrl;
	}

	public Date getUserRegistTime() {
		return userRegistTime;
	}

	public void setUserRegistTime(Date userRegistTime) {
		this.userRegistTime = userRegistTime;
	}

	@OneToMany(mappedBy = "userInfo")
	public Set<News> getNews() {
		return news;
	}

	public void setNews(Set<News> news) {
		this.news = news;
	}

	@OneToMany(mappedBy = "userInfo")
	public Set<Notice> getNotices() {
		return notices;
	}

	public void setNotices(Set<Notice> notices) {
		this.notices = notices;
	}

}
