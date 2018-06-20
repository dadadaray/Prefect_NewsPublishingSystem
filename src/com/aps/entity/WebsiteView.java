package com.aps.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "websiteView")
public class WebsiteView {
	private Integer websiteViewId;
	private Integer num; // 网站浏览量

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getWebsiteViewId() {
		return websiteViewId;
	}

	public void setWebsiteViewId(Integer websiteViewId) {
		this.websiteViewId = websiteViewId;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

}
