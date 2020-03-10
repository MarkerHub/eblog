package com.example.config;

import com.example.im.handler.MsgHandlerFactory;
import com.example.im.server.ImServerStarter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;

@Slf4j
@Configuration
public class ImServerConfig {

    @Value("${im.server.port}")
    private int imPort;

    @Bean
    ImServerStarter imServerStarter() {
        try {
            // 启动tio服务
            ImServerStarter serverStarter = new ImServerStarter(imPort);
            serverStarter.start();

            // 初始化消息处理器类别
            MsgHandlerFactory.init();

            return serverStarter;
        } catch (IOException e) {
            log.error("tio server 启动失败", e);
        }

        return null;
    }
}
