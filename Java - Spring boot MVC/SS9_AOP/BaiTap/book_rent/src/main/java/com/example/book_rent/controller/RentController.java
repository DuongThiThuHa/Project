package com.example.book_rent.controller;

import ch.qos.logback.core.model.Model;
import com.example.book_rent.model.Book;
import com.example.book_rent.model.Rent;
import com.example.book_rent.service.IBookService;
import com.example.book_rent.service.IRentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/rent")
public class RentController {
    @Autowired
    private IRentService iRentService;

    @Autowired
    private IBookService iBookService;

    @GetMapping("")
    public String showList(Model model) {
        model.addAttribute("rent", iRentService.findAll());
        return "/rent_list";
    }

    @GetMapping("/create")
    public String showRent(Model model, @RequestParam("id") int id) {
        model.addAttribute("book", iBookService.findByID(id));
        return "/rent";
    }

    @GetMapping("/back")
    public String showGiveBack() {
        return "/give_back";
    }

    @PostMapping("/back")
    public String giveBack(RedirectAttributes redirectAttributes, @RequestParam("rent_id") String id) {
        Rent rent = iRentService.findByID(id);
        if (rent == null){
            redirectAttributes.addFlashAttribute("error", "Can't find that rent id!");
            return "redirect:/rent/back";
        }
        Book book = rent.getBook();
        book.setQuantity(book.getQuantity() + 1);
        iRentService.delete(rent);
        iBookService.rent(book);
        redirectAttributes.addFlashAttribute("error", "Give back that book successfully!");
        return "redirect:/book";
    }

    @PostMapping("/create")
    public String rent(Book book, RedirectAttributes redirectAttributes) {
        try {
            book.setQuantity(book.getQuantity() - 1);
            iBookService.rent(book);
            String rentCode = getRandomCode();
            iRentService.create(new Rent(rentCode, book));
            redirectAttributes.addFlashAttribute("error", "Your rent code is " + rentCode);
            return "redirect:/book";
        }catch (Exception e){
            redirectAttributes.addFlashAttribute("error", "Quantity = 0. Can't rent that book");
            return "redirect:/book";
        }
    }

    private String getRandomCode() {
        while (true) {
            long codeDigit = 10000 + Math.round(Math.random() * 89999);
            String code = String.valueOf(codeDigit);
            if (iRentService.findByID(String.valueOf(code)) == null) {
                return code;
            }
        }
    }
}