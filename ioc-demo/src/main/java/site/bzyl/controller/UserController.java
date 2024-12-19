package site.bzyl.controller;

import site.bzyl.framework.context.ApplicationContext;
import site.bzyl.framework.context.supoort.ClassPathXmlApplicationContext;
import site.bzyl.service.UserService;

public class UserController {
    public static void main(String[] args) throws Exception {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService userService = applicationContext.getBean("userService", UserService.class);
        userService.add();
    }
}
