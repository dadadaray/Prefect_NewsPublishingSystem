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
@Table(name = "modMixCenter")
public class ModMixCenter {
	private Integer mMixCenterId;
	private String mMixCenterImgOne;
	private String mMixCenterContentOne;
	private String mMixCenterImgTwo;
	private String mMixCenterContentTwo;
	private String mMixCenterImgThree;
	private String mMixCenterContentThree;
	private News news;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getmMixCenterId() {
		return mMixCenterId;
	}

	public void setmMixCenterId(Integer mMixCenterId) {
		this.mMixCenterId = mMixCenterId;
	}

	public String getmMixCenterImgOne() {
		return mMixCenterImgOne;
	}

	public void setmMixCenterImgOne(String mMixCenterImgOne) {
		this.mMixCenterImgOne = mMixCenterImgOne;
	}

	public String getmMixCenterContentOne() {
		return mMixCenterContentOne;
	}

	public void setmMixCenterContentOne(String mMixCenterContentOne) {
		this.mMixCenterContentOne = mMixCenterContentOne;
	}

	public String getmMixCenterImgTwo() {
		return mMixCenterImgTwo;
	}

	public void setmMixCenterImgTwo(String mMixCenterImgTwo) {
		this.mMixCenterImgTwo = mMixCenterImgTwo;
	}

	public String getmMixCenterContentTwo() {
		return mMixCenterContentTwo;
	}

	public void setmMixCenterContentTwo(String mMixCenterContentTwo) {
		this.mMixCenterContentTwo = mMixCenterContentTwo;
	}

	public String getmMixCenterImgThree() {
		return mMixCenterImgThree;
	}

	public void setmMixCenterImgThree(String mMixCenterImgThree) {
		this.mMixCenterImgThree = mMixCenterImgThree;
	}

	public String getmMixCenterContentThree() {
		return mMixCenterContentThree;
	}

	public void setmMixCenterContentThree(String mMixCenterContentThree) {
		this.mMixCenterContentThree = mMixCenterContentThree;
	}
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinColumn(name = "newsId")
	public News getNews(){
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

}
