package com.example.config;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Properties;

@Configuration
public class KaptchaConfig {

    @Bean
    public DefaultKaptcha producer () {
        Properties propertis = new Properties();
        propertis.put("kaptcha.border", "no");
        propertis.put("kaptcha.image.height", "38");
        propertis.put("kaptcha.image.width", "150");
        propertis.put("kaptcha.textproducer.font.color", "black");
        propertis.put("kaptcha.textproducer.font.size", "32");
        Config config = new Config(propertis);
        DefaultKaptcha defaultKaptcha = new DefaultKaptcha();
        defaultKaptcha.setConfig(config);

        return defaultKaptcha;
    }

}
