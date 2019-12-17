package com.example.nenu.service;

import com.example.nenu.pojo.User;

import java.util.List;

public interface UserService {

    public List<User> checkPersonByAll(User user);
    public void deletePerson(String id);
    public void updatePerson(User user);
    public User selectById(String id);

    void addPerson(User user);
}
