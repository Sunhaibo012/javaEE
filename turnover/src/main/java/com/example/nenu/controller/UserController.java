package com.example.nenu.controller;

import com.example.nenu.listener.StartupListener;
import com.example.nenu.mapper.UserMapper;
import com.example.nenu.pojo.Detail;
import com.example.nenu.pojo.User;
import com.example.nenu.service.UserService;
import com.example.nenu.util.IpConfig;
import com.example.nenu.util.MD5Util;
import com.example.nenu.util.RandomId;
import com.example.nenu.util.TestEmail;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(StartupListener.class);
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserService userService;

    private Integer p =0;
    //登录
    //22222222222222222222222
    @RequestMapping("/doUserLogin")
    public String doLogin(Model model, HttpServletRequest request, @RequestParam("userId") String userId, @RequestParam("userPassword")String userPassword, @RequestParam("code") String code) throws UnknownHostException {
        MD5Util pwd = new MD5Util();
        String user_password = pwd.getData(userPassword);
        //验证码
        String sessionCode = request.getSession().getAttribute("picCode").toString();
        User user = userMapper.userLogin(userId,user_password);

        if(user!=null&&sessionCode.equalsIgnoreCase(code)){
            IpConfig ipConfig = new IpConfig();
            logger.info("本次登陆的ip地址是" + InetAddress.getLocalHost().getHostAddress());
            Detail detail = userMapper.selectImage(userId);
            model.addAttribute("detail",detail);
            model.addAttribute("user",user);
            p=0;
            return "userMain";
        }else {
            p++;
            logger.info("密码错误次数:"+p);
            return "login";
        }
    }
    //注册
    //333333333333333
    @RequestMapping("/userRegister")
    public String register(){
        return "userRegister";
    }
    @RequestMapping("/doUserRegister")
    public String doRegister(HttpServletRequest request,Model model,Detail detail, User user, @RequestParam("userName") String userName, @RequestParam("userPassword")String userPassword,
                             @RequestParam("repeatPassword")String repeatPassword,
                             @RequestParam("userEmail")String userEmail, @RequestParam("resultCode") String resultCode) {
        MD5Util pwd = new MD5Util();
        String user_password = pwd.getData(userPassword);
        String repeat_password = pwd.getData(repeatPassword);
        TestEmail testEmail = new TestEmail();
        boolean flg = testEmail.isEmailStrValid(userEmail);
        //验证码
        String sessionCode = request.getSession().getAttribute("result").toString();
        if(sessionCode.equals(resultCode)&&user_password.equals(repeat_password)&&flg){
            RandomId id = new RandomId();
            String userId = id.getStringRandom(6);
            String picPath = "static/uploads/moren.jpg";
            detail.setUser_id(userId);
            detail.setPicPath(picPath);
            user.setUser_id(userId);
            user.setUser_name(userName);
            user.setUser_email(userEmail);
            user.setUser_password(user_password);
            System.out.println(user);
            userMapper.insertUser(user);
            userMapper.insertUserId(detail);
            model.addAttribute("userId",userId);
            return "login";
        }
        else {
            return "userRegister";
        }
    }
    //更新信息
    @RequestMapping("/userUpdate")
    public String update(User user,Model model){
        userMapper.updateUser(user);
        User user1 = userService.selectById(user.getUser_id());

        Detail detail = userMapper.selectImage(user.getUser_id());
        model.addAttribute("detail",detail);
        model.addAttribute("user",user1);
        return "userMain";
    }

    //修改密码
    @RequestMapping("/updatePassword")
    public String updatePassword(@RequestParam("userId") String user_id,
                                 @RequestParam("oldPassword")String oldPassword,
                                 @RequestParam("newPassword")String newPassword){
        MD5Util pwd = new MD5Util();
        System.out.println("------------------"+user_id+oldPassword+newPassword);
        String old_password = pwd.getData(oldPassword);
        String new_password = pwd.getData(newPassword);
        User user = userMapper.userLogin(user_id,old_password);
        System.out.println("-------------------"+user);
        if(user!=null){
            userMapper.updatePassword(user_id,new_password);
            return "login";
        }
        return "userMain";
    }

    // 修改头像
    @RequestMapping(value = "/queryImg", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> queryImg(HttpServletRequest request, HttpSession session, @RequestParam("user_id") String user_id,
                                        @RequestParam(value = "file", required = false) MultipartFile file) {
        String path = request.getServletContext().getRealPath("/") + "static\\uploads\\";
        File uploads = new File(path);
        // 如果文件夹不存在则创建
        if (!uploads.exists() && !uploads.isDirectory()) {
            uploads.mkdirs();
        }
        String locPath = "";
        String fileName = file.getOriginalFilename();
        File newfile = new File(path, fileName);
        try {
            file.transferTo(newfile);
            locPath = path + fileName;
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // 将文件上传的路径给user对象
        String picPath = "static/uploads/" + fileName;
        System.out.println(user_id);
        boolean flag = userMapper.queryImg(user_id, picPath, locPath);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        if (flag) {
            resultMap.put("result", "true");
        } else {
            resultMap.put("result", "false");
        }
        return resultMap;
    }
}
