package com.example.book_rent.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import java.util.logging.Logger;
@Aspect
@Component
public class BookAspect {
    private Logger logger = Logger.getLogger(Logger.class.getName());
    public void BookService(){}

}
