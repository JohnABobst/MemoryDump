package com.javacollab.memorydump.services;

import java.util.Optional;

import com.javacollab.memorydump.models.Comment;
import com.javacollab.memorydump.repositories.CommentRepo;

import org.springframework.stereotype.Service;

@Service
public class CommentService {
    private final CommentRepo commentRepository;
        public CommentService(CommentRepo commentRepository) {
            this.commentRepository = commentRepository;
        }
        public Comment findCommentById(Long id) {
            Optional<Comment> u = commentRepository.findById(id);
            
            if(u.isPresent()) {
                return u.get();
            } else {
                return null;
            }
        }
}