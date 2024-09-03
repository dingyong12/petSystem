package cn.petmanagementsystem.controller;

import cn.petmanagementsystem.domain.User;
import cn.petmanagementsystem.domain.common.Pager;
import cn.petmanagementsystem.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
@Controller
public class UserController {

    @Autowired
    private IUserService userService;

    @GetMapping("/getUserList")
    public String getUserList(@RequestParam String accountName, @RequestParam(defaultValue = "-1") Integer status, @RequestParam String phone, @RequestParam Integer pageNum, @RequestParam Integer offset, HttpSession session){
        if (status == -1) {
            status = null;
        }
        Pager<User> pager = userService.getUserList(accountName, status, phone, pageNum, offset);
        session.setAttribute("pager", pager);
        return "userManagement";
    }

}
