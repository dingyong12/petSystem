package cn.petmanagementsystem.service.impl;

import cn.petmanagementsystem.domain.User;
import cn.petmanagementsystem.domain.common.Pager;
import cn.petmanagementsystem.mapper.UserMapper;
import cn.petmanagementsystem.service.IUserService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public Pager<User> getUserList(String accountName, Integer status, String phone, Integer pageNum, Integer offset) {
        Page<Object> page = PageHelper.startPage(pageNum, offset, true);
        List<User> userList = userMapper.getUserList(accountName, status, phone);
        for (User user : userList) {
            user.setStatusStr(user.getStatus() ? "正常" : "禁用");
        }
        return new Pager<>(pageNum, offset, userList, page.getTotal());
    }
}
