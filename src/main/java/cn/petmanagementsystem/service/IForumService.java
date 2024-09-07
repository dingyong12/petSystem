package cn.petmanagementsystem.service;

import cn.petmanagementsystem.domain.Forum;
import cn.petmanagementsystem.domain.common.Pager;

public interface IForumService {
    Pager<Forum> getForumList(Integer pageNum,Integer limit);

    Forum getForumDetail(Integer id);

    void addForum(Forum forum);
}
