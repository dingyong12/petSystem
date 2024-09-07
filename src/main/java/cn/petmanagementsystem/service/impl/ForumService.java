package cn.petmanagementsystem.service.impl;

import cn.petmanagementsystem.domain.Forum;
import cn.petmanagementsystem.domain.common.Pager;
import cn.petmanagementsystem.mapper.ForumMapper;
import cn.petmanagementsystem.service.IForumService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ForumService implements IForumService {

    @Autowired
    private ForumMapper forumMapper;

    @Override
    public Pager<Forum> getForumList(Integer pageNum, Integer limit) {
        Page<Object> page = PageHelper.startPage(pageNum, limit);
        List<Forum> forumList = forumMapper.getForumList();
        return new Pager<>(pageNum, limit, forumList, page.getTotal());
    }

    @Override
    public Forum getForumDetail(Integer id) {
        return forumMapper.getForumDetail(id);
    }

    @Override
    public void addForum(Forum forum) {
        forumMapper.addForum(forum);
    }
}
