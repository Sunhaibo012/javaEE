package com.example.nenu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class TurnoverApplication {

    public static void main(String[] args) {
        SpringApplication.run(TurnoverApplication.class, args);
    }

}
