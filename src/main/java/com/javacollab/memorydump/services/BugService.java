package com.javacollab.memorydump.services;

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
