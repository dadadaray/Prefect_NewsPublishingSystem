package com.aps.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "notice")
public class Notice {
	private Integer noticeId;
	private String noticeContent;
	private Integer noticeType; // 0 未通过 1 通过 2 推荐 3管理员收到的待审核消息
	private Date noticeCreatTime;
	private UserInfo userInfo;//发送通知的人员
	private News news;
	private Integer reciveId;  //接受通知人员

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(Integer noticeId) {
		this.noticeId = noticeId;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Integer getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(Integer noticeType) {
		this.noticeType = noticeType;
	}

	public Date getNoticeCreatTime() {
		return noticeCreatTime;
	}

	public void setNoticeCreatTime(Date noticeCreatTime) {
		this.noticeCreatTime = noticeCreatTime;
	}

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinColumn(name = "sendUserId")
	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
	
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinColumn(name = "newsId")
	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public Integer getReciveId() {
		return reciveId;
	}

	public void setReciveId(Integer reciveId) {
		this.reciveId = reciveId;
	}
	
}
