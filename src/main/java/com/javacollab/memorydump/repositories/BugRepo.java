package com.javacollab.memorydump.repositories;

import java.util.List;

import com.javacollab.memorydump.models.Bug;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository 
public interface BugRepo extends CrudRepository<Bug, Long> {

    List<Bug> findAll();
}
