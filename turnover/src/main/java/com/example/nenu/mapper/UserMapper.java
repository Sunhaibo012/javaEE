package com.example.nenu.mapper;

import com.example.nenu.pojo.Detail;
import com.example.nenu.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import java.util.List;
@Mapper
@Repository
public interface UserMapper {

    List<User> checkPersonByAll(@Param("user") User user);
    void deletePerson(String id);

    void addPerson(@Param("user") User user);
    User userLogin(String userId,String userPassword);
    void insertUser(@Param("user") User user);
    void insertUserId(@Param("detail") Detail detail);
    //用户名查重
    User checkUser(String userName);

    void updateUser(@Param("user") User user);
    User selectById(String id);
    boolean queryImg(@Param(value = "userName") String userName, @Param(value = "picPath") String picPath,
                 @Param(value = "locPath") String locPath) ;
    Detail selectImage(String id);
    void updatePassword(String id,String password);

    List<User> selectByName(@Param("_word") String userName);
    void deletePic(String id);
}
