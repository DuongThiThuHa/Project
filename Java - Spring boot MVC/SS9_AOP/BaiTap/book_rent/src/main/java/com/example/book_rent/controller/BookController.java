package com.example.book_rent.controller;

import com.example.book_rent.model.Book;
import com.example.book_rent.service.IBookService;
import com.example.book_rent.service.IRentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Slice;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.awt.print.Pageable;

@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    private IBookService iBookService;

    @GetMapping("")
    public String showList(Model model){
        model.addAttribute("books", iBookService.findAll());
        return "/index";
    }
}
