package cn.petmanagementsystem.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDateTime;

public class AdoptDto {

    private Integer id;

    private Integer petId;

    private String petName;

    private String userName;

    private String phone;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime adoptTime;

    private String address;

    private Integer approvalStatus;

    private String approvalStatusStr;

    //领养方式 0 自提 1 配送
    private Integer adoptMethod;

    private String adoptMethodStr;

    public String getApprovalStatusStr() {
        return approvalStatusStr;
    }

    public void setApprovalStatusStr(String approvalStatusStr) {
        this.approvalStatusStr = approvalStatusStr;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalStatus(Integer approvalStatus) {
        this.approvalStatus = approvalStatus;
    }


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

    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    public String getAdoptMethodStr() {
        return adoptMethodStr;
    }

    public void setAdoptMethodStr(String adoptMethodStr) {
        this.adoptMethodStr = adoptMethodStr;
    }
}
