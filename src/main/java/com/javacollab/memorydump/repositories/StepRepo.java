package com.javacollab.memorydump.repositories;

import java.util.List;

import com.javacollab.memorydump.models.Step;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository 
public interface StepRepo extends CrudRepository<Step, Long> {

    List<Step> findAll();
}