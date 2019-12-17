package com.example.nenu.service.Imp;

import com.example.nenu.mapper.AdminMapper;
import com.example.nenu.pojo.User;
import com.example.nenu.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImp implements AdminService {
    @Autowired
    AdminMapper adminMapper;

    @Override
    public String adminLogin(String adminName,String password){
        String name = adminMapper.adminLogin(adminName,password);
        return name;
    }

    @Override
    public List<User> findAllPerson(){
        List<User> list= adminMapper.findAllPerson();
        return list;
    }
}
