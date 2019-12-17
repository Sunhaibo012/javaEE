package com.example.nenu.mapper;

import com.example.nenu.pojo.Admin;
import com.example.nenu.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

//这个注解表示这是一个mybatis的mapper类：Dao
@Mapper
@Repository
public interface AdminMapper {

    List<Admin> queryAdminList();

    String adminLogin(String adminName,String password);

    List<User> findAllPerson();


}
