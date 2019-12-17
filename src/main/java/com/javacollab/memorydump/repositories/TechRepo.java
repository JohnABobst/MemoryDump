package com.javacollab.memorydump.repositories;

import java.util.List;

import com.javacollab.memorydump.models.Technology;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TechRepo extends CrudRepository<Technology, Long> {

    List<Technology> findAll();
}