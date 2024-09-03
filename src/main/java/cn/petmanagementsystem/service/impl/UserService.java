package cn.petmanagementsystem.service.impl;

import cn.petmanagementsystem.domain.User;
import cn.petmanagementsystem.mapper.UserMapper;
import cn.petmanagementsystem.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService implements IUserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String username, String password) {
       return userMapper.login(username, password);
    }

    @Override
    public String register(User user) {
        try {
            userMapper.register(user);
        } catch (RuntimeException e) {
            return "用户名重复!";
        }
        return null;
    }

    @Override
    public Integer deleteUser(Integer userId) {
        return userMapper.deleteUser(userId);
    }
}
