package com.aps.entity;

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
@Table(name = "modVedio")
public class ModVedio {
	private Integer modVedioId;
	private String mvideoUrl;
	private String modVedioContent;
	private String mVideoCoverImgUrl;
	private News news;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getModVedioId() {
		return modVedioId;
	}

	public void setModVedioId(Integer modVedioId) {
		this.modVedioId = modVedioId;
	}

	public String getMvideoUrl() {
		return mvideoUrl;
	}

	public void setMvideoUrl(String mvideoUrl) {
		this.mvideoUrl = mvideoUrl;
	}

	public String getModVedioContent() {
		return modVedioContent;
	}

	public void setModVedioContent(String modVedioContent) {
		this.modVedioContent = modVedioContent;
	}

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinColumn(name = "newsId")
	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public String getmVideoCoverImgUrl() {
		return mVideoCoverImgUrl;
	}

	public void setmVideoCoverImgUrl(String mVideoCoverImgUrl) {
		this.mVideoCoverImgUrl = mVideoCoverImgUrl;
	}

}
