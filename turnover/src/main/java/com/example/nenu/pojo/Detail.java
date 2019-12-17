package com.example.nenu.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Detail {
    private String user_id;//用户id
    private String picPath;// 头像项目路径
    private String locPath;// 头像本地路径
}
