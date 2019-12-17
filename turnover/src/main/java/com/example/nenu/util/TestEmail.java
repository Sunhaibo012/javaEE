package com.example.nenu.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TestEmail {
    public static boolean isEmailStrValid(String str) {
        String pattern = "^[a-zA-Z0-9][\\w\\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\\w\\.-]*\\.[a-zA-Z][a-zA-Z\\.]*[a-zA-Z]$";
        Pattern patter = Pattern.compile(pattern);
        Matcher matcher = patter.matcher(str);
        return matcher.matches();
    }
}
