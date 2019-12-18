package com.javacollab.memorydump.services;

import java.util.Optional;

import com.javacollab.memorydump.models.Technology;
import com.javacollab.memorydump.repositories.TechRepo;

import org.springframework.stereotype.Service;

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
}