package com.javacollab.memorydump.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.javacollab.memorydump.models.Bug;



@Repository
public interface BugRepo extends CrudRepository<Bug, Long>{

}
