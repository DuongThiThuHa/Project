package com.example.book_rent.service;

import com.example.book_rent.model.Book;
import com.example.book_rent.repository.IBookRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService implements IBookService {
    @Autowired
    private IBookRepo iBookRepo;

    @Override
    public List<Book> findAll() {
        return iBookRepo.findAll();
    }

    @Override
    public Book findByID(int id) {
        return iBookRepo.findById(id).orElse(null);
    }

    @Override
    public void rent(Book book) {
        iBookRepo.save(book);
    }
}
