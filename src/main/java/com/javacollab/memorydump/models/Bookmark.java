package com.javacollab.memorydump.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="bookmarks")
public class Bookmark {
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="bug_id")
	private Bug bugBookmark;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User bookmarker;
	
	
	@Column(updatable=false)
	private Date createdAt;
    private Date updatedAt;
    
    
    //Getters and Setters
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Bug getBugBookmark() {
		return bugBookmark;
	}
	public void setBugBookmark(Bug bugBookmark) {
		this.bugBookmark = bugBookmark;
	}

	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public User getBookmarker() {
		return bookmarker;
	}
	public void setBookmarker(User bookmarker) {
		this.bookmarker = bookmarker;
	}

	
	
}
