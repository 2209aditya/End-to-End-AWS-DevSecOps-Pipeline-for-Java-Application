package com.devsecops.app.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/health")
    public String health() {
        return "UP";
    }

    @GetMapping("/")
    public String hello() {
        return "AWS DevSecOps Java App Running 🚀";
    }
}
