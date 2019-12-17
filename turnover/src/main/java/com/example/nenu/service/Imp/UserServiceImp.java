package com.example.nenu.service.Imp;

import com.example.nenu.mapper.UserMapper;
import com.example.nenu.pojo.Detail;
import com.example.nenu.pojo.User;
import com.example.nenu.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImp implements UserService {

    @Autowired
    UserMapper userMapper;



    @Override
    public List<User> checkPersonByAll(User user){
        List<User> list= userMapper.checkPersonByAll(user);
        return list;
    }

    @Override
    public void deletePerson(String id){
        userMapper.deletePerson(id);
    }

    @Override
    public void updatePerson(User user){
        userMapper.updateUser(user);
    }

    @Override
    public User selectById(String id){
        User user = userMapper.selectById(id);
        return user;
    }

    @Override
    public void addPerson(User user){
        userMapper.addPerson(user);
    }


}
