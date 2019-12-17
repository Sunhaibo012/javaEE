package com.example.nenu.util;

import com.example.nenu.mapper.UserMapper;
import com.example.nenu.pojo.User;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/CheckUserServlet")
public class CheckUserServlet extends HttpServlet {
    @Autowired
    private UserMapper userMapper;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取参数
        String userName = request.getParameter("userName");
        //sql查询
        User checkResult = userMapper.checkUser(userName);
        //json传值
        Map<String,Object> map = new HashMap<>();
        if(checkResult!=null){
            map.put("userExist",true);
        } else {
            map.put("userExist",false);
        }
        ObjectMapper objMapper = new ObjectMapper();
        objMapper.writeValue(response.getWriter(),map);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
