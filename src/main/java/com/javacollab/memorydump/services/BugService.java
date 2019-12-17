package com.javacollab.memorydump.services;

import com.javacollab.memorydump.repositories.BugRepo;

import org.springframework.stereotype.Service;

@Service
public class BugService {

    private final BugRepo bugRepo;

    public BugService(BugRepo bugRepo){
        this.bugRepo = bugRepo;
    }
}
