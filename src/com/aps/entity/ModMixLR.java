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
@Table(name = "modMixLR")
public class ModMixLR {
	private Integer modMixLRId;
	private String mMixLRImgOne;
	private String mMixLRContentOne;
	private String mMixLRImgTwo;
	private String mMixLRContentTwo;
	private String mMixLRImgThree;
	private String mMixLRContentThree;
	private News news;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getModMixLRId() {
		return modMixLRId;
	}

	public void setModMixLRId(Integer modMixLRId) {
		this.modMixLRId = modMixLRId;
	}

	public String getmMixLRImgOne() {
		return mMixLRImgOne;
	}

	public void setmMixLRImgOne(String mMixLRImgOne) {
		this.mMixLRImgOne = mMixLRImgOne;
	}

	public String getmMixLRContentOne() {
		return mMixLRContentOne;
	}

	public void setmMixLRContentOne(String mMixLRContentOne) {
		this.mMixLRContentOne = mMixLRContentOne;
	}

	public String getmMixLRImgTwo() {
		return mMixLRImgTwo;
	}

	public void setmMixLRImgTwo(String mMixLRImgTwo) {
		this.mMixLRImgTwo = mMixLRImgTwo;
	}

	public String getmMixLRContentTwo() {
		return mMixLRContentTwo;
	}

	public void setmMixLRContentTwo(String mMixLRContentTwo) {
		this.mMixLRContentTwo = mMixLRContentTwo;
	}

	public String getmMixLRImgThree() {
		return mMixLRImgThree;
	}

	public void setmMixLRImgThree(String mMixLRImgThree) {
		this.mMixLRImgThree = mMixLRImgThree;
	}

	public String getmMixLRContentThree() {
		return mMixLRContentThree;
	}

	public void setmMixLRContentThree(String mMixLRContentThree) {
		this.mMixLRContentThree = mMixLRContentThree;
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
