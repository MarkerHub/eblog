package com.example.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RabbitConfig {

    public final static String es_queue = "es_queue";
    public final static String es_exchage = "es_exchage";
    public final static String es_bind_key = "es_exchage";

    @Bean
    public Queue exQueue() {
        return new Queue(es_queue);
    }

    @Bean
    DirectExchange exchange() {
        return new DirectExchange(es_exchage);
    }

    @Bean
    Binding binding(Queue exQueue, DirectExchange exchange) {
        return BindingBuilder.bind(exQueue).to(exchange).with(es_bind_key);
    }

}
