package site.bzyl.service;

import site.bzyl.dao.UserDao;
import site.bzyl.dao.UserDaoImpl;

public class UserServiceImpl implements UserService {
    private UserDao userDao;

    public UserServiceImpl() {
        System.out.println("userServiceImpl创建...");
    }

    @Override
    public void add() {
        System.out.println("UserServiceImpl.add()...");
        userDao.add();
    }

    public void setUserDao(UserDaoImpl userDao) {
        this.userDao = userDao;
    }
}
