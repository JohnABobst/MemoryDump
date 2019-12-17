package com.javacollab.memorydump.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javacollab.memorydump.models.User;
import com.javacollab.memorydump.services.UserService;
import com.javacollab.memorydump.validators.UserValidator;

@Controller
public class BugController {
	
	private final UserService userService;
	private final UserValidator userValidator;
	
	public BugController(UserService userService, UserValidator userValidator) {
		super();
		this.userService = userService;
		this.userValidator = userValidator;
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
	public String dashboard() {
		return "index.jsp";
	}
}
