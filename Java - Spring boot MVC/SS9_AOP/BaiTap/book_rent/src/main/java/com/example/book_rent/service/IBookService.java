package com.example.book_rent.service;

import com.example.book_rent.model.Book;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;

import java.util.List;

public interface IBookService {
    public List<Book> findAll();

    public Book findByID(int id);

    public void rent(Book book);
}
