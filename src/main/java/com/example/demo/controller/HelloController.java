package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
	
	@Value("${inputValue}")
	private String inputValue;

    @GetMapping("/hello")
    public String hello() {
        return "Hello "+ inputValue;
    }
}