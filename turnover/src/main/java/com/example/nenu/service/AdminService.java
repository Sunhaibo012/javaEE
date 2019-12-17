package com.example.nenu.service;

import com.example.nenu.pojo.User;

import java.util.List;


public interface AdminService {

   public String adminLogin(String adminName,String password);

   public List<User> findAllPerson();
}
