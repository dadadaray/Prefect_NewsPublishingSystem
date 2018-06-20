package com.aps.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "modFree")
public class ModFree {
	private Integer modFreeId;
	private String modFreeContent;
	private News news;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getModFreeId() {
		return modFreeId;
	}

	public void setModFreeId(Integer modFreeId) {
		this.modFreeId = modFreeId;
	}

	public String getModFreeContent() {
		return modFreeContent;
	}

	public void setModFreeContent(String modFreeContent) {
		this.modFreeContent = modFreeContent;
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
