package com.example.nenu.listener;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author yellow
 * @date 2019/12/11 11:10
 * @description 配置监听器
 */
@Configuration
public class ListenerConfig {
    // 这里会直接注入
    @Bean
    public StartupListener startupListener() {
        return new StartupListener();
    }
}
