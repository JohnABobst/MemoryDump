package com.javacollab.memorydump.services;

import java.util.Optional;

import com.javacollab.memorydump.models.Step;
import com.javacollab.memorydump.repositories.StepRepo;

import org.springframework.stereotype.Service;

@Service
public class StepService {
    private final StepRepo stepRepository;
        public StepService(StepRepo stepRepository) {
            this.stepRepository = stepRepository;
        }
        public Step findStepById(Long id) {
            Optional<Step> u = stepRepository.findById(id);
            
            if(u.isPresent()) {
                return u.get();
            } else {
                return null;
            }
        }
}