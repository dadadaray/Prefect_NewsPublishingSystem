package com.aps.entity;

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
import javax.persistence.Table;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Store;

@Entity
@Table(name = "news")
public class News {
	private Integer newsId;
	private String newsTitle; // 新闻标题
	private String coverImgUrl; // 封面图片
	private Date publishTime; // 发表时间
	private Date createTime; // 创作时间
	private Integer statues; // 文章状态 0：草稿 1：待审核 2：审核通过 3：未通过 4：发布        注意：2不要使用
	private Integer topShow; // 推荐文章 0：不推 1：推荐
	private Integer views; // 文章浏览量
	private Integer likes; // 文章点赞数
	private Integer share; //文章分享数量
	private Integer commentNum; // 文章评论数量

	private Integer auditorId; // 审核人id
	private UserInfo userInfo; // 文章的作者
	private NewsType newsType; // 文章类型
	private Set<ModFree> modFrees = new HashSet<ModFree>(0); // 自由模板
	private Set<ModBigImg> modBigImgs = new HashSet<ModBigImg>(0); // 大图模板
	private Set<ModVedio> modVedios = new HashSet<ModVedio>(0); // 视频模板
	private Set<ModAudio> modAudios = new HashSet<ModAudio>(0); // 音频模板
	private Set<ModMixCenter> modMixCenters = new HashSet<ModMixCenter>(0); // 混合居中模板
	private Set<ModMixLR> modMixLRs = new HashSet<ModMixLR>(0);// 图文左右
	private Set<ModMixSingle> modMixSingles = new HashSet<ModMixSingle>(0);// 图文一个图
	private Set<Comment> comments = new HashSet<Comment>(0); // 新闻的评论
	private Set<Notice> notices = new HashSet<Notice>(0);// 新闻的消息
	private String bigImgContent;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getNewsId() {
		return newsId;
	}

	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}

	@Field(index = Index.YES, analyze = Analyze.YES, store = Store.NO)
	@Analyzer(impl = StandardAnalyzer.class)
	public String getNewsTitle() {
		return newsTitle;
	}

	@OneToMany(mappedBy = "news")
	public Set<ModMixSingle> getModMixSingles() {
		return modMixSingles;
	}

	public void setModMixSingles(Set<ModMixSingle> modMixSingles) {
		this.modMixSingles = modMixSingles;
	}

	public String getBigImgContent() {
		return bigImgContent;
	}

	public void setBigImgContent(String bigImgContent) {
		this.bigImgContent = bigImgContent;
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

	public String getCoverImgUrl() {
		return coverImgUrl;
	}

	public void setCoverImgUrl(String coverImgUrl) {
		this.coverImgUrl = coverImgUrl;
	}

	public Date getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date currentTime) {
		this.createTime = currentTime;
	}

	public Integer getTopShow() {
		return topShow;
	}

	public void setTopShow(Integer topShow) {
		this.topShow = topShow;
	}

	public Integer getShare() {
		return share;
	}

	public void setShare(Integer share) {
		this.share = share;
	}

	public Integer getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(Integer commentNum) {
		this.commentNum = commentNum;
	}

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinColumn(name = "newTypeId")
	public NewsType getNewsType() {
		return newsType;
	}

	public void setNewsType(NewsType newsType) {
		this.newsType = newsType;
	}

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinColumn(name = "newsAuthorId")
	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	@OneToMany(mappedBy = "news")
	public Set<ModFree> getModFrees() {
		return modFrees;
	}

	public void setModFrees(Set<ModFree> modFrees) {
		this.modFrees = modFrees;
	}

	@OneToMany(mappedBy = "news")
	public Set<ModVedio> getModVedios() {
		return modVedios;
	}

	public void setModVedios(Set<ModVedio> modVedios) {
		this.modVedios = modVedios;
	}

	@OneToMany(mappedBy = "news")
	public Set<ModAudio> getModAudios() {
		return modAudios;
	}

	public void setModAudios(Set<ModAudio> modAudios) {
		this.modAudios = modAudios;
	}

	@OneToMany(mappedBy = "news")
	public Set<ModMixCenter> getModMixCenters() {
		return modMixCenters;
	}

	public void setModMixCenters(Set<ModMixCenter> modMixCenters) {
		this.modMixCenters = modMixCenters;
	}

	@OneToMany(mappedBy = "news")
	public Set<ModMixLR> getModMixLRs() {
		return modMixLRs;
	}

	public void setModMixLRs(Set<ModMixLR> modMixLRs) {
		this.modMixLRs = modMixLRs;
	}

	@OneToMany(mappedBy = "news")
	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	public Integer getStatues() {
		return statues;
	}

	public void setStatues(Integer statues) {
		this.statues = statues;
	}

	public Integer getLikes() {
		return likes;
	}

	public void setLikes(Integer likes) {
		this.likes = likes;
	}

	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	@OneToMany(mappedBy = "news")
	public Set<Notice> getNotices() {
		return notices;
	}

	public void setNotices(Set<Notice> notices) {
		this.notices = notices;
	}

	public Integer getAuditorId() {
		return auditorId;
	}

	public void setAuditorId(Integer auditorId) {
		this.auditorId = auditorId;
	}

	@OneToMany(mappedBy = "news")
	public Set<ModBigImg> getModBigImgs() {
		return modBigImgs;
	}

	public void setModBigImgs(Set<ModBigImg> modBigImgs) {
		this.modBigImgs = modBigImgs;
	}

}
