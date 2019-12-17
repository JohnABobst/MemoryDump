package com.javacollab.memorydump.repositories;

import java.util.List;

import com.javacollab.memorydump.models.Bookmark;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository 
public interface BookmarkRepo extends CrudRepository<Bookmark, Long> {

    List<Bookmark> findAll();
}