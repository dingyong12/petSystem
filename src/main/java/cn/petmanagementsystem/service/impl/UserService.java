package cn.petmanagementsystem.service.impl;

import cn.petmanagementsystem.domain.User;
import cn.petmanagementsystem.domain.common.Pager;
import cn.petmanagementsystem.mapper.UserMapper;
import cn.petmanagementsystem.service.IUserService;
import com.github.pagehelper.PageInfo;
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
//        PageHelper.startPage(pageNum, offset);
        List<User> userList = userMapper.getUserList(accountName, status, phone);
        PageInfo<User> pageInfo = new PageInfo<>(userList);
        return new Pager<>(pageNum, offset, userList, pageInfo.getTotal());
    }
}
