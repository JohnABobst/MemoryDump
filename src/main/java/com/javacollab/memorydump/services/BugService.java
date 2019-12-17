package com.javacollab.memorydump.services;
import java.util.Optional;

<<<<<<< HEAD
import java.util.Optional;

import com.javacollab.memorydump.models.Bug;
import com.javacollab.memorydump.repositories.BugRepo;

import org.springframework.stereotype.Service;

@Service
public class BugService {
    private final BugRepo bugRepository;
        public BugService(BugRepo bugRepository) {
            this.bugRepository = bugRepository;
        }
        public Bug findBugById(Long id) {
            Optional<Bug> u = bugRepository.findById(id);
            
            if(u.isPresent()) {
                return u.get();
            } else {
                return null;
            }
        }
=======
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
>>>>>>> 58479e090bbc455697fb566e97ed6bba31593167
}
