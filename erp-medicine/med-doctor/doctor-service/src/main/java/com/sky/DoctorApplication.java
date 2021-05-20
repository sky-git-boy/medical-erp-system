package com.sky;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author sky
 * @create 2021-05-19 21:28
 */
@SpringBootApplication
@MapperScan(basePackages = {"com.sky.mapper"})
@EnableDubbo
public class DoctorApplication {
    public static void main(String[] args) {
        SpringApplication.run(DoctorApplication.class, args);
        System.out.println("医护系统启动成功");
    }
}
