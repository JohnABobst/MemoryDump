package com.javacollab.memorydump.services;

<<<<<<< HEAD
import com.javacollab.memorydump.repositories.BugRepo;

import org.springframework.stereotype.Service;

@Service
public class BugService {

    private final BugRepo bugRepo;

    public BugService(BugRepo bugRepo){
        this.bugRepo = bugRepo;
    }
=======
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
>>>>>>> d5c805436891a460581ebd997fb34702174ab651
}
