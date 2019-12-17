package com.javacollab.memorydump.services;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.javacollab.memorydump.models.Bug;
import com.javacollab.memorydump.repositories.BugRepo;

@Service
public class BugService {
    private BugRepo bugRepo;

    public BugService(BugRepo bugRepo) {
        this.bugRepo = bugRepo;
    }

    public Bug findById(Long id) {
        Optional<Bug> bug = bugRepo.findById(id);
        if  (bug.isPresent()) {
            return bug.get();
        } else {
            return null;
        }
    }
}
