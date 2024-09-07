package cn.petmanagementsystem.mapper;

import cn.petmanagementsystem.domain.Forum;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ForumMapper {
    List<Forum> getForumList();

    Forum getForumDetail(Integer id);

    void addForum(Forum forum);
}
