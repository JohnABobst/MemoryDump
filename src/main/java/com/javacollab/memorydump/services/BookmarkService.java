package com.javacollab.memorydump.services;

import java.util.Optional;

import com.javacollab.memorydump.models.Bookmark;
import com.javacollab.memorydump.repositories.BookmarkRepo;

import org.springframework.stereotype.Service;

@Service
public class BookmarkService {
    private final BookmarkRepo bookmarkRepository;
        public BookmarkService(BookmarkRepo bookmarkRepository) {
            this.bookmarkRepository = bookmarkRepository;
        }
        public Bookmark findBookmarkById(Long id) {
            Optional<Bookmark> u = bookmarkRepository.findById(id);
            
            if(u.isPresent()) {
                return u.get();
            } else {
                return null;
            }
        }
}