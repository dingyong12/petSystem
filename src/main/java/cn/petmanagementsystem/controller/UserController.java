package cn.petmanagementsystem.controller;

import cn.petmanagementsystem.domain.User;
import cn.petmanagementsystem.domain.common.Pager;
import cn.petmanagementsystem.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

    @Autowired
    private IUserService userService;

    @GetMapping("/getUserList")
    public Pager<User> getUserList(@RequestParam(required = false) String accountName,
                                   @RequestParam(defaultValue = "-1") Integer status,
                                   @RequestParam(required = false) String phone,
                                   @RequestParam Integer page,
                                   @RequestParam Integer limit) {
        if (status == -1) {
            status = null;
        }
        return userService.getUserList(accountName, status, phone, page, limit);
    }

}
