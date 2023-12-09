package com.example.book_rent.service;

import com.example.book_rent.model.Rent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RentService implements IRentService{
    @Autowired
    private IRentService iRentService;

    @Override
    public void create(Rent rent) {
        iRentService.create(rent);
    }

    @Override
    public Rent findByID(String id) {
        return iRentService.findByID(id);
    }

    @Override
    public List< Rent > findAll() {
        return iRentService.findAll();
    }

    @Override
    public void delete(Rent rent) {
        iRentService.delete(rent);
    }
}
