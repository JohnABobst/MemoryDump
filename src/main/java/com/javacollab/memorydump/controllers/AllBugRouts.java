package com.javacollab.memorydump.controllers;

import com.javacollab.memorydump.repositories.BookmarkRepo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javacollab.memorydump.models.Bug;
import com.javacollab.memorydump.models.User;
import com.javacollab.memorydump.repositories.BookmarkRepo;
import com.javacollab.memorydump.repositories.BugRepo;
import com.javacollab.memorydump.repositories.CommentRepo;
import com.javacollab.memorydump.repositories.StepRepo;
import com.javacollab.memorydump.repositories.TechRepo;
import com.javacollab.memorydump.repositories.UserRepo;
import com.javacollab.memorydump.services.BugService;
import com.javacollab.memorydump.services.UserService;
import com.javacollab.memorydump.validators.UserValidator;

@Controller
@RequestMapping("/bug")
public class AllBugRouts {

    // private final BookmarkRepo bookmarkRepository;
	// private final BugRepo bugRepository;
	// private final CommentRepo commentRepository;
	// private final StepRepo stepRepository;
	// private final TechRepo technologyRepository;
	// private final UserRepo userRepository;
	
	// // private final BookmarkService bookmarkService;
	// private final BugService bugService;
	// // private final CommentService commentService;
	// // private final StepService stepService;
	// // private final TechnologyService technologyService;
	// private final UserService userService;

	// private final UserValidator userValidator;

	// public AllBugRouts(
	// 		BookmarkRepo bookmarkRepository,
	// 		BugRepo bugRepository,
	// 		CommentRepo commentRepository,
	// 		StepRepo stepRepository,
	// 		TechRepo technologyRepository,
	// 		UserRepo userRepository,
			
	// 		// BookmarkService bookmarkService,
	// 		BugService bugService,
	// 		// CommentService commentService,
	// 		// StepService stepService,
	// 		// TechnologyService technologyService,
	// 		UserService userService,
			
	// 		UserValidator userValidator
	// 		) {
		
	// 	this.bookmarkRepository = bookmarkRepository;
	// 	this.bugRepository = bugRepository;
	// 	this.commentRepository = commentRepository;
	// 	this.stepRepository = stepRepository;
	// 	this.technologyRepository = technologyRepository;
	// 	this.userRepository = userRepository;
	// 	// // this.BookmarkService = bookmarkService;
	// 	this.bugService = bugService;
	// 	// // this.CommentService = commentService;
	// 	// // this.StepService = stepService;
	// 	// // this.TechnologyService = technologyService;
	// 	this.userService = userService;
	// 	this.userValidator = userValidator;
	
    // }
    
}
