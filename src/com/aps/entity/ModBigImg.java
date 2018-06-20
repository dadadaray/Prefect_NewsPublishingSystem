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
@Table(name = "modBigImg")
public class ModBigImg {
	private Integer modBigImgId;
	private String modBigImgUrl;
	private String modBigImgContent;
	private News news;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getModBigImgId() {
		return modBigImgId;
	}

	public void setModBigImgId(Integer modBigImgId) {
		this.modBigImgId = modBigImgId;
	}

	public String getModBigImgUrl() {
		return modBigImgUrl;
	}

	public void setModBigImgUrl(String modBigImgUrl) {
		this.modBigImgUrl = modBigImgUrl;
	}

	public String getModBigImgContent() {
		return modBigImgContent;
	}

	public void setModBigImgContent(String modBigImgContent) {
		this.modBigImgContent = modBigImgContent;
	}

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinColumn(name = "newsId")
	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

}
