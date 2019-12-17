package com.javacollab.memorydump.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
public class BugController {
	
	private final BookmarkRepo bookmarkRepository;
	private final BugRepo bugRepository;
	private final CommentRepo commentRepository;
	private final StepRepo stepRepository;
	private final TechRepo technologyRepository;
	private final UserRepo userRepository;
	
	private final BookmarkService bookmarkService;
	private final BugService bugService;
	private final CommentService commentService;
	private final StepService stepService;
	private final TechnologyService technologyService;
	private final UserService userService;

	private final UserValidator userValidator;

	public BugController(
			BookmarkRepo bookmarkRepository,
			BugRepo bugRepository,
			CommentRepo commentRepository,
			StepRepo stepRepository,
			TechRepo technologyRepository,
			UserRepo userRepository,
			BookmarkService bookmarkService,
			BugService bugService,
			CommentService commentService,
			StepService stepService,
			TechnologyService technologyService,
			UserService userService,
			UserValidator userValidator
			) {
		
		this.bookmarkRepo = bookmarkRepository;
		this.bugRepo = bugRepository;
		this.commentRepo = commentRepository;
		this.stepRepo = stepRepository;
		this.TechnologyRepo = technologyRepository;
		this.UserRepo = userRepository;
		this.BookmarkService = bookmarkService;
		this.BugService = bugService;
		this.CommentService = commentService;
		this.StepService = stepService;
		this.TechnologyService = technologyService;
		this.UserService = userService;
		this.UserValidator = userValidator;
	
	}

	@GetMapping("/")
	public String regAndLogin(Model model) {
		User user_r = new User();
		
		model.addAttribute("user_r", user_r);
		
		return "logReg.jsp";
	}
	
	@PostMapping("/registration")
	public String register(@Valid @ModelAttribute("user_r") User user, BindingResult result, HttpSession session) {
		
		userValidator.validate(user, result);
        if(result.hasErrors()) {
            return "logReg.jsp";
        }
        User u = userService.registerUser(user);
        
        session.setAttribute("userId", u.getId());
        session.setAttribute("userName", u.getName());
        
        return "redirect:/dashboard";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute("user_r") User user, @RequestParam("email_l") String email, @RequestParam("password_l") String password, Model model, HttpSession session) {
		
		boolean isAuthenticated = userService.authenticateUser(email, password);
		if(isAuthenticated) {
			User u = userService.findByEmail(email);
			session.setAttribute("userId", u.getId());
			session.setAttribute("userName", u.getName());
			return "redirect:/dashboard";
		} else {
			model.addAttribute("error", "Invalid Credentials. Please try again");
			return "logReg.jsp";
		}
	}
	
	@GetMapping("/dashboard")
	public String dashboard(
        Model model,
        HttpSession session) {

       // User u = userService.findUserById((Long) session.getAttribute("userId"));
        // place holder for now untill we get just the users specific list of bugs
       List<Bug> bugs = bugRepository.findAll();
    
        // model.addAttribute("user", u);
        // model.addAttribute("bugs", bugs);

		return "dashboard.jsp";
	}
}
