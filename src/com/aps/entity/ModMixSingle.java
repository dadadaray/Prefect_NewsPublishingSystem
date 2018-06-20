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
import javax.persistence.Table;

@Entity
@Table(name = "modMixSingle")
public class ModMixSingle {
	private Integer modMixSingleId;
	private String mMixSingleImgOne;
	private String mMixSingleContentOne;
	private News news;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getModMixSingleId() {
		return modMixSingleId;
	}

	public void setModMixSingleId(Integer modMixSingleId) {
		this.modMixSingleId = modMixSingleId;
	}

	public String getmMixSingleImgOne() {
		return mMixSingleImgOne;
	}

	public void setmMixSingleImgOne(String mMixSingleImgOne) {
		this.mMixSingleImgOne = mMixSingleImgOne;
	}

	public String getmMixSingleContentOne() {
		return mMixSingleContentOne;
	}

	public void setmMixSingleContentOne(String mMixSingleContentOne) {
		this.mMixSingleContentOne = mMixSingleContentOne;
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
