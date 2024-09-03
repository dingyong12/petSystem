package cn.petmanagementsystem.service;

import cn.petmanagementsystem.domain.User;

public interface IUserService {

    User login(String username, String password);

    String register(User user);

    Integer deleteUser(Integer userId);
}
