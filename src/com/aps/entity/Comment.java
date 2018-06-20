package com.aps.entity;

import javax.persistence.Table;

import com.aps.entity.Comment;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
@Table(name = "comment")
public class Comment {
	// 属性
	private Integer commentId;
	private String commentContent;// 评论内容
	private Date commentPublishTime;// 评论发表时间
	private News news;// 评论对应的新闻
	private UserInfo userInfo;// 评论对应的用户
	private Comment parentComment;// 父评论
	private Set<Comment> comments = new HashSet<Comment>(0);

	// set/get方法
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Date getCommentPublishTime() {
		return commentPublishTime;
	}

	public void setCommentPublishTime(Date commentPublishTime) {
		this.commentPublishTime = commentPublishTime;
	}

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "newsId")
	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.EAGER)
	@JoinColumn(name = "commentAuthorID")
	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "commentParentId", referencedColumnName = "commentId", updatable = true)
	public Comment getParentComment(){
		return parentComment;
	}

	public void setParentComment(Comment parentComment) {
		this.parentComment = parentComment;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "comment_Id")
	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

}
