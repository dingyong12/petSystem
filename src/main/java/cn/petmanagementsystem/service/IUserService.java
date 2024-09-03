package cn.petmanagementsystem.service;

import cn.petmanagementsystem.domain.User;
import cn.petmanagementsystem.domain.common.Pager;

public interface IUserService {

    User login(String username, String password);

    String register(User user);

    Integer deleteUser(Integer userId);

    Pager<User> getUserList(String accountName, Integer status, String phone, Integer page, Integer offset);
}
