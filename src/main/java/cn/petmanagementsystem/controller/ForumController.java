package cn.petmanagementsystem.controller;

import cn.petmanagementsystem.common.Result;
import cn.petmanagementsystem.domain.Forum;
import cn.petmanagementsystem.domain.common.Pager;
import cn.petmanagementsystem.service.IForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class ForumController {

    @Autowired
    private IForumService forumService;


    @PostMapping("/addForumInfo")
    public Result addForum(@RequestBody Forum forum) {
        forumService.addForum(forum);
        return Result.success("添加成功");
    }

    @GetMapping("/getForumList")
    public Pager<Forum> getForumList(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer limit) {
        return forumService.getForumList(page,limit);
    }

    @GetMapping("/getForumDetail")
    public Forum getForumDetail(@RequestParam Integer id) {
        return forumService.getForumDetail(id);
    }

}
