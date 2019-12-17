package com.javacollab.memorydump.repositories;

import java.util.List;

import com.javacollab.memorydump.models.Comment;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository 
public interface CommentRepo extends CrudRepository<Comment, Long> {

    List<Comment> findAll();
}