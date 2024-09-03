package cn.petmanagementsystem.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDateTime;

/**
 * 领养信息表
 */
public class Adopt {

    private Integer id;

    // 宠物id
    private Integer petId;

    //领养人id
    private Integer userId;

    //领养时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime adoptTime;

    //领养方式 0 自提 1 配送
    private Integer adoptMethod;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPetId() {
        return petId;
    }

    public void setPetId(Integer petId) {
        this.petId = petId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public LocalDateTime getAdoptTime() {
        return adoptTime;
    }

    public void setAdoptTime(LocalDateTime adoptTime) {
        this.adoptTime = adoptTime;
    }

    public Integer getAdoptMethod() {
        return adoptMethod;
    }

    public void setAdoptMethod(Integer adoptMethod) {
        this.adoptMethod = adoptMethod;
    }
}
