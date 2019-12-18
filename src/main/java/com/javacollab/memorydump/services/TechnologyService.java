package com.javacollab.memorydump.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.javacollab.memorydump.models.Technology;
import com.javacollab.memorydump.repositories.TechRepo;

@Service
public class TechnologyService {
    private final TechRepo technologyRepository;
        public TechnologyService(TechRepo technologyRepository) {
            this.technologyRepository = technologyRepository;
        }
        public Technology findTechnologyById(Long id) {
            Optional<Technology> u = technologyRepository.findById(id);
            
            if(u.isPresent()) {
                return u.get();
            } else {
                return null;
            }
        }
        
        public void saveNewTechnologies(List<Technology> t) {
        	List<Technology> allTech = technologyRepository.findAll();
        	for (Technology key : t) {
        		if (!allTech.contains(key)) {
        			technologyRepository.save(key);
        		}
        	}
        }
}