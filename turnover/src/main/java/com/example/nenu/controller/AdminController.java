package com.example.nenu.controller;


import com.example.nenu.mapper.AdminMapper;
import com.example.nenu.mapper.UserMapper;
import com.example.nenu.pojo.User;
import com.example.nenu.service.AdminService;
import com.example.nenu.service.UserService;
import com.example.nenu.util.MD5Util;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.naming.Name;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class AdminController {

    //(
    // http://localhost:8080/loginPage
    // 用户名：admin
    // 密码：123123
    // )
    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;
    @Autowired
    private UserMapper userMapper;

    //1111111111111111111111111111111111
    @RequestMapping("/loginPage")
    public String login(){
        return "login";
    }
    //22222222222222222222222
    @RequestMapping("/doAdminLogin")
    public String doLogin(HttpServletRequest request,@RequestParam("adminName") String adminName, @RequestParam("password")String password,Model model,@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum){
        MD5Util pwd = new MD5Util();
        String admin_password = pwd.getData(password);
        String name = adminService.adminLogin(adminName,admin_password);
        if(name!=null){
            PageHelper.startPage(pageNum,5);
            List<User> userList = adminService.findAllPerson();
            PageInfo<User> pageInfo = new PageInfo<User>(userList);
            model.addAttribute("pageInfo",pageInfo);
            return "adminMain";
        }
        return "login";
    }

    //用户管理页面
    @RequestMapping("/findAllUser")
    public String findAllPerson(Model model,@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum){
        PageHelper.startPage(pageNum,5);
        List<User> userList = adminService.findAllPerson();
        PageInfo<User> pageInfo = new PageInfo<User>(userList);
        model.addAttribute("pageInfo",pageInfo);
        return "adminMain";
    }

    //去修改页面
    @RequestMapping("/toUpdate/{id}")
    public String toUpdate( @PathVariable("id") String id, Model model){
        User p = userService.selectById(id);
        System.out.println(p);
        model.addAttribute("p", p);
        return "update";
    }
    //修改操作
    @RequestMapping("/update")
    public String update(User user){
        userService.updatePerson(user);
        return "redirect:/findAllUser";
    }

    //删除
    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable("id") String id){
        userService.deletePerson(id);
        userMapper.deletePic(id);
        return "redirect:/findAllUser";
    }

    @RequestMapping("/byName")
    public String byName( Model model, User user,@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum){
        PageHelper.startPage(pageNum,5);
        List<User> list = userMapper.selectByName(user.getUser_name());
        PageInfo<User> pageInfo = new PageInfo<User>(list);
        model.addAttribute("pageInfo",pageInfo);
        return "adminMain";
    }
}