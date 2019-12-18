package com.javacollab.memorydump.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javacollab.memorydump.models.Technology;
import com.javacollab.memorydump.repositories.TechRepo;
import com.javacollab.memorydump.services.TechnologyService;

@Controller
public class TechnologyController {
	public TechRepo techRepo;
	public TechnologyService technologyService;
	
	
	@PostMapping("/technologies")
	public Technology createTech(@RequestParam("name") String name, @RequestParam("version") double version) {
		Technology tech = new Technology(name,version);
		return techRepo.save(tech);		
	}
	
}

