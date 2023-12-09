package com.example.book_rent.repository;

import com.example.book_rent.model.Rent;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IRentRepo extends JpaRepository<Rent,String> {
}
