package com.example.nenu.util;

import javax.annotation.PostConstruct;
import java.net.InetAddress;
import java.net.UnknownHostException;

public class IpConfig {
    private String getLocalIp(){

        try {

            return InetAddress.getLocalHost().getHostAddress();

        } catch (UnknownHostException e) {

            return "unknown-ip";

        }

    }

    @PostConstruct
    public String postConstruct(){

        String localIp = getLocalIp();

        System.out.println("localIp for Log4j2: " + localIp);

        System.setProperty("local-ip", localIp );

        return localIp;

    }

}
