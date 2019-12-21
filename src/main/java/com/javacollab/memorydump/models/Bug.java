package com.javacollab.memorydump.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;


@Entity
@Table(name="bugs")
public class Bug {
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	private String errorCode;
	private String additionalDetails;
	private Date createdAt;
    private Date updatedAt;
    private boolean solved = false;
    
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "bookmarks", 
        joinColumns = @JoinColumn(name = "bug_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )   
    private List<User> bookmarkers;
    
    @OneToMany(fetch=FetchType.LAZY, cascade = CascadeType.REMOVE, orphanRemoval = true)
    private List<Step> steps;
    
    @OneToMany(fetch=FetchType.LAZY, cascade = CascadeType.REMOVE, orphanRemoval = true)
    private List<Comment> commented_ons;
    
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User creator;	
	
    @ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(
    		name="bugTechnologies",
    		joinColumns = @JoinColumn(name="bug_id"),
    		inverseJoinColumns = @JoinColumn(name="technology_id")
    		)
    private List<Technology> technologies;
    
    public Bug(){

	}
    //Getters and Setters
	public String getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
	public String getAdditionalDetails() {
		return additionalDetails;
	}
	public void setAdditionalDetails(String additionalDetails) {
		this.additionalDetails = additionalDetails;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public boolean isSolved() {
		return solved;
	}
	public void setSolved(boolean solved) {
		this.solved = solved;
	}
	public List<Step> getSteps() {
		return steps;
	}
	
	public User getCreator() {
		return creator;
	}
	public void setCreator(User creator) {
		this.creator = creator;
	}
	public List<Technology> getTechnologies() {
		return technologies;
	}
	public void setTechnologies(List<Technology> technologies) {
		this.technologies = technologies;
	}
	public List<User> getBookmarkers() {
		return bookmarkers;
	}
	public void setBookmarkers(List<User> bookmarkers) {
		this.bookmarkers = bookmarkers;
	}
	public void setSteps(List<Step> steps) {
		this.steps = steps;
	}
	public List<Comment> getCommented_ons() {
		return commented_ons;
	}
	public void setCommented_ons(List<Comment> commented_ons) {
		this.commented_ons = commented_ons;
	}
	
	
}
