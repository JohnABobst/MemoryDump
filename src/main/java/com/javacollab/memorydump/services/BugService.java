package com.javacollab.memorydump.services;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.javacollab.memorydump.models.Bug;
import com.javacollab.memorydump.repositories.BugRepo;

@Service
public class BugService {
    private final BugRepo bugRepository;

    public BugService(BugRepo bugRepository) {
        this.bugRepository = bugRepository;
    }

    public Bug findBugById(Long id) {
        Optional<Bug> u = bugRepository.findById(id);

        if (u.isPresent()) {
            return u.get();
        } else {
            return null;
        }
    }
}
