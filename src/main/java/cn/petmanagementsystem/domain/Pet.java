package cn.petmanagementsystem.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDateTime;

public class Pet {
    private Integer id;

    //昵称
    private String name;

    //品种
    private Integer petTypeId;

    //性别 0 公 1 母
    private Integer gender;

    // 宠物照片
    private String picture;

    // 创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;

    //领养状态 0 未领养 1 已领养
    private Integer adoptStatus;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPetTypeId() {
        return petTypeId;
    }

    public void setPetTypeId(Integer petTypeId) {
        this.petTypeId = petTypeId;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public Integer getAdoptStatus() {
        return adoptStatus;
    }

    public void setAdoptStatus(Integer adoptStatus) {
        this.adoptStatus = adoptStatus;
    }
}
