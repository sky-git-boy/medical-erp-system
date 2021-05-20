package com.sky;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author sky
 * @create 2021-05-19 21:30
 */
@SpringBootApplication
@MapperScan(basePackages = {"com.sky.mapper"})
@EnableDubbo
public class ErpApplication {
    public static void main(String[] args) {
        SpringApplication.run(ErpApplication.class, args);
        System.out.println("ERP系统启动成功");
    }
}
