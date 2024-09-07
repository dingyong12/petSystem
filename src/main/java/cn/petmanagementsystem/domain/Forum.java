package cn.petmanagementsystem.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDateTime;

// 文章模块
public class Forum {

    //文章ID
    private Integer id;

    private Integer userId;

    private String userName;

    //文章标题
    private String title;

    //文章内容
    private String content;

    //文章图片
    private String forumPic;

    //创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createdTime;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getForumPic() {
        return forumPic;
    }

    public void setForumPic(String forumPic) {
        this.forumPic = forumPic;
    }

    public LocalDateTime getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(LocalDateTime createdTime) {
        this.createdTime = createdTime;
    }
}
