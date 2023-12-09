package com.example.book_rent.service;

import com.example.book_rent.model.Rent;

import java.util.List;

public interface IRentService {
    void create(Rent rent);

    Rent findByID(String id);

    List<Rent> findAll();

    void delete(Rent rent);
}
