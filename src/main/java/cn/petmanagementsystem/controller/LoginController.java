package cn.petmanagementsystem.controller;


import cn.petmanagementsystem.domain.User;
import cn.petmanagementsystem.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping
public class LoginController {

    @Autowired
    private IUserService userService;

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @GetMapping("/register")
    public String showRegisterPage() {
        return "register";
    }

    @GetMapping("/home")
    public String showHomePage() {
        return "home";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/login";
    }

    @GetMapping("/userManagement")
    public String userManagement() {
        return "userManagement";
    }

    @GetMapping("/petManagement")
    public String petManagement() {
        return "petManagement";
    }

    @GetMapping("/adoptionManagement")
    public String adoptionManagement() {
        return "adoptionManagement";
    }


    @PostMapping("/login/user")
    public String login(@RequestParam String username, @RequestParam String password, HttpSession session) {
        User user = userService.login(username, password);
        if (user == null) {
            return "redirect:/login?error";
        }
        session.setAttribute("user", user);
        return "redirect:/home";
    }

    @RequestMapping("/register/user")
    public String register(User user, Model model) {
        String errMsg = userService.register(user);
        if (errMsg == null) {
            return "redirect:/login";
        }
        model.addAttribute("errMsg", errMsg);
        return "register";
    }

}
