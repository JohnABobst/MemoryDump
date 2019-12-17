package com.javacollab.memorydump.repositories;

import java.util.List;

import com.javacollab.memorydump.models.Bug;

import org.springframework.data.repository.CrudRepository;

public interface BugRepo extends CrudRepository<Bug, Long> {

    List<Bug> findAll();
}
