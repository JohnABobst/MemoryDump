package com.javacollab.memorydump.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javacollab.memorydump.models.Bug;
import com.javacollab.memorydump.models.Step;
import com.javacollab.memorydump.models.Technology;
import com.javacollab.memorydump.models.User;
import com.javacollab.memorydump.repositories.BookmarkRepo;
import com.javacollab.memorydump.repositories.BugRepo;
import com.javacollab.memorydump.repositories.CommentRepo;
import com.javacollab.memorydump.repositories.StepRepo;
import com.javacollab.memorydump.repositories.TechRepo;
import com.javacollab.memorydump.repositories.UserRepo;
import com.javacollab.memorydump.services.BookmarkService;
import com.javacollab.memorydump.services.BugService;
import com.javacollab.memorydump.services.CommentService;
import com.javacollab.memorydump.services.StepService;
import com.javacollab.memorydump.services.TechnologyService;
import com.javacollab.memorydump.services.UserService;
import com.javacollab.memorydump.validators.UserValidator;

@Controller
public class BugController {

	private final BookmarkRepo bookmarkRepository1;
	private final BugRepo bugRepository;
	private final CommentRepo commentRepository1;
	private final StepRepo stepRepository1;
	private final TechRepo techRepo;
	private final UserRepo userRepository;

	private final BookmarkService bookmarkService1;
	private final BugService bugService;
	private final CommentService commentService1;
	private final StepService stepService1;
	private final TechnologyService technologyService1;
	private final UserService userService;

	private final UserValidator userValidator;
	private TechnologyService technologyService;
	private StepService stepService;
	private CommentService commentService;
	private BookmarkService bookmarkService;
	private StepRepo stepRepository;
	private CommentRepo commentRepository;
	private BookmarkRepo bookmarkRepository;

	public BugController(BookmarkRepo bookmarkRepository, BugRepo bugRepository, CommentRepo commentRepository,
			StepRepo stepRepository, TechRepo techRepo, UserRepo userRepository, BookmarkService bookmarkService,
			BugService bugService, CommentService commentService, StepService stepService,
			TechnologyService technologyService, UserService userService, UserValidator userValidator) {

		this.bookmarkRepository1 = bookmarkRepository;
		this.bugRepository = bugRepository;
		this.commentRepository1 = commentRepository;
		this.stepRepository1 = stepRepository;
		this.techRepo = techRepo;
		this.userRepository = userRepository;
		this.bookmarkService1 = bookmarkService;
		this.bugService = bugService;
		this.commentService1 = commentService;
		this.stepService1 = stepService;
		this.technologyService1 = technologyService;
		this.userService = userService;
		this.userValidator = userValidator;

	}

	// new landing page
	@GetMapping("/")
	public String index() {
		return "index.jsp";
	}

	@GetMapping("/logReg")
	public String regAndLogin(Model model) {
		User user_r = new User();

		model.addAttribute("user_r", user_r);

		return "logReg.jsp";
	}


	@PostMapping("/registration")
	public String register(@Valid @ModelAttribute("user_r") User user, BindingResult result, HttpSession session) {

		userValidator.validate(user, result);
		if (result.hasErrors()) {
			return "logReg.jsp";
		}
		User u = userService.registerUser(user);

		session.setAttribute("userId", u.getId());
		session.setAttribute("userName", u.getName());

		return "redirect:/dashboard";
	}

	@PostMapping("/login")
	public String login(@ModelAttribute("user_r") User user, @RequestParam("email_l") String email,
			@RequestParam("password_l") String password, Model model, HttpSession session) {

		boolean isAuthenticated = userService.authenticateUser(email, password);
		if (isAuthenticated) {
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
	public String dashboard(Model model, HttpSession session) {

		User u = userService.findUserById((Long) session.getAttribute("userId"));
		// place holder for now until we get just the users specific list of bugs
		List<Bug> bugs = bugRepository.findAll();

		model.addAttribute("user", u);
		model.addAttribute("bugs", bugs);

		return "dashboard.jsp";
	}

	@GetMapping("/bugs/new")
	public String createBug(@ModelAttribute("bug") Bug bug,Model model,HttpSession session) {		
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		List<Technology> technologies = techRepo.findAll();

		User u = userService.findUserById((Long) session.getAttribute("userId"));
		
		model.addAttribute("user", u);
		model.addAttribute("technologies", technologies);
		return "createBug.jsp";
	}

	@PostMapping("/bugs/create")
	public String processNewBug(@Valid @ModelAttribute("bug") Bug bug, BindingResult result) {
		System.out.println(bug.getTechnologies());
		if (result.hasErrors()) {
			return "createBug.jsp";
		} else {
			bugRepository.save(bug);
			return "redirect:/dashboard";
		}

	}

	@PostMapping("/bugs/step")
	public String addStep(Model model, @RequestParam("description")String description, @RequestParam("bugId") Long id) {
		Step step = new Step();
		step.setDescription(description);
		step.setSolutionStep(bugService.findBugById(id));
		stepRepository.save(step);
		model.addAttribute("step", step);
		return "_step.jsp";
		
	}
	@GetMapping("/bugs/{id}")
	public String bugDetail(@ModelAttribute("step") Step step,@PathVariable("id") Long id, Model model) {
		Bug bug = bugService.findBugById(id);
		step.setSolutionStep(bug);
		model.addAttribute("bug", bug);
		return "show.jsp";
	}

	@GetMapping("/bugs/{id}/edit")
	public String editBug(@PathVariable("id") Long id, Model model) {
		Bug bug = bugService.findBugById(id);
		model.addAttribute("bug", bug);
		return "createBug.jsp";

	}

	@PostMapping("/bugs/{id}/update")
	public String processEditBug(@PathVariable("id") Long id, @Valid @ModelAttribute("bug") Bug bug,
			BindingResult result) {
		if (result.hasErrors()) {
			return "createBug.jsp";
		} else {
			Bug b = bugService.findBugById(id);
			b.setErrorCode(bug.getErrorCode());
			b.setTechnologies(bug.getTechnologies());
			b.setAdditionalDetails(bug.getAdditionalDetails());
			b.setCreator(bug.getCreator());
			bugRepository.save(b);
			return "redirect:/dashboard";
		}

	}

	@PostMapping("/bugs/{id}/destroy")
	public String deleteBug(@PathVariable("id") Long id) {
		bugRepository.deleteById(id);
		return "redirect: /dashboard";
	}

	@GetMapping("/bugs")
	public String allBugs(Model model, HttpSession session) {

		List<Bug> bugs = bugRepository.findAll();

		model.addAttribute("bugs", bugs);

		return "allBugs.jsp";
	}

	@PostMapping("/technologies")
	public String createTech(Model model, @RequestParam("name") String name, @RequestParam("version") double version) {
		System.out.println(name);
		System.out.println(version);
		Technology tech = new Technology();
		tech.setName(name);
		tech.setVersion(version);
		Technology savedTech = techRepo.save(tech);
		System.out.println(savedTech);
		model.addAttribute("technology", tech);
		return "technology.jsp";
	}
	public Technology createTech(@RequestParam("name") String name, @RequestParam("version") double version) {
		Technology tech = new Technology(name, version);
		return techRepo.save(tech);
	}

}
