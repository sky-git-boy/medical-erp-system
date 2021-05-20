package com.sky;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author sky
 * @create 2021-05-19 21:31
 */
@SpringBootApplication
@MapperScan(basePackages = {"com.sky.mapper"})
@EnableDubbo
public class SystemApplication {
    public static void main(String[] args) {
        SpringApplication.run(SystemApplication.class, args);
        System.out.println("主系统启动成功");
    }
}
