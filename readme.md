1. # 小型药品ERP系统

   #### 项目介绍

   项目稍微粗糙了点，大二做的。因为主要以学习并整合技术栈为目的做的项目，所以本项目中涉及大量技术，有的技术可以不用的但是还是有用到，哈哈哈。

   觉得还不错的话，帮忙点个` star` 鼓励一下吧，如果有问题的可以加我微信哦！！！

   #### 系统界面



   #### 介绍

   前端：后台管理系统采用 [vue-element-admin](https://panjiachen.github.io/vue-element-admin-site/zh/guide/) 后台集成方案进行二次开发。微信小程序采用 [uni-app](https://uniapp.dcloud.io/) 开发框架。

   后端：后台管理模块采用 SpringBoot + Dubbo 构建后端分布式服务，使用 Shiro 做系统安全框架，配合 RBAC 设计模式实现用户的权限管理，使用 Redis 对用户token及字典数据进行缓存；小程序模块采用 SpringBoot 构建后端服务；数据库采用 Mysql（5.7） ，使用 [Mybatis-Plus](https://mybatis.plus/) 做数据访问层，Druid 作为数据库连接池。

   使用阿里OSS作为文件存储系统（最开始用的 FastDFS，奈何不想一直开着虚拟机）。

   #### 安装教程

   1. 开发需要准备相关的 IDE 和  JDK8 开发环境 , 前端开发需要下载 Visual Code，后端开发需要下载 `Eclipse` 或` IDEA`。

   2. 首先需要一台虚拟机，可以使用阿里的也可以本机安装；在虚拟机上我们需要搭建分布式环境：Zookeeper和 Dubbo ；还有安装 Redis 等。（虚拟机中的软件安装可以见软件安装文档）

   3. 文件存储系统使用的是阿里OSS，也可以自己搭建 FastDFS 服务，在后端 `med-system` 的配置文件中进行配置。

   5. 数据库准备，创建一个名称为 `medicine-erp` 的数据库，把doc下 `medicine-erp.sql`数据库文件进行导入进去即可。

   7. 后端启动：（需要虚拟机并安装好软件）

      后台管理系统：第一步、使用 IDEA 在 `erp-medicine` 目录下找到 `med-system` 和 `med-erp` 模块。第二步、在 application-dev.yml` 中修改 ip 地址，改为自己的虚拟机 ip 地址，修改腾讯云和阿里云的相关配置。  ` 第三步、运行 SystemApplication 和 SortApplication ，启动后端服务。可以在浏览器输入 ip:7001 账号和密码都是 root，查看服务。

   8. 前端启动：

      在 Visual Code 中打开  `erp-medicine-ui` , 在控制台输入 npm run install 下载依赖，依赖下载完后，使用命令 npm run dev 运行前端项目。

   9. 务必记得：在登录后台管理系统后，到字典管理模块点击同步缓存的按钮，把字典类型及数据添加到redis缓存中！！！

   #### 技术栈

   |       技术        |          名称          |                             官网                             |
   | :---------------: | :--------------------: | :----------------------------------------------------------: |
   |    SpringBoot     |       微服务框架       |           https://spring.io/projects/spring-boot/            |
   |   Mybatis-Plus    |        ORM框架         |                   https://mp.baomidou.com/                   |
   | Mybatis-Generator |      代码生成插件      | https://zhile.io/2019/04/23/mybatis-code-helper-pro-crack.html |
   |       Shiro       |        安全框架        |                   http://shiro.apache.org/                   |
   |     Zookeeper     |     分布式协调服务     |                 http://zookeeper.apache.org/                 |
   |       Druid       |      数据库连接池      |               https://github.com/alibaba/druid               |
   |    Dubbo-Admin    |      服务治理项目      |     http://dubbo.apache.org/zh-cn/blog/dubbo-admin.html      |
   |       Dubbo       |      远程调用框架      |                http://dubbo.apache.org/zh-cn/                |
   |       Log4J       |        日志组件        |             http://logging.apache.org/log4j/1.2/             |
   |        Git        |        版本管理        |                     https://git-scm.com/                     |
   |       Maven       |      项目构建管理      |                   http://maven.apache.org/                   |
   |      Jackson      |       数据序列化       |             https://github.com/FasterXML/jackson             |
   |      Lombok       |      简化编码插件      |                  https://projectlombok.org/                  |
   |       vuejs       | 渐进式 JavaScript 框架 |                    https://cn.vuejs.org/                     |
   | vue-element-admin |      后台集成框架      | https://panjiachen.github.io/vue-element-admin-site/zh/guide/ |
   |    Element UI     |         组件库         |             https://element.eleme.cn/2.0/#/zh-CN             |
   
   PS：基于Apache License 2协议开源友好，使用、参考、转载请保留出处，严禁将项目直接打包出售。