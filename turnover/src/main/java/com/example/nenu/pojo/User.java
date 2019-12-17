package com.example.nenu.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private String user_id;
    private String user_password;
    private String user_name;
    private String sex;
    private String user_tel;
    private String user_email;
    private Date user_birthday;
    private String user_signature;
}
