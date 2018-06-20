package com.aps.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "newsType")
public class NewsType {
	private Integer newsTypeId;
	private String typeName;
	private Set<News> comments = new HashSet<News>(0);

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getNewsTypeId() {
		return newsTypeId;
	}

	public void setNewsTypeId(Integer newsTypeId) {
		this.newsTypeId = newsTypeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@OneToMany(mappedBy = "newsType")
	public Set<News> getComments() {
		return comments;
	}

	public void setComments(Set<News> comments) {
		this.comments = comments;
	}
}
