package cn.petmanagementsystem.domain;

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
    private String createTime;

    //领养状态 0 未领养 1 已领养
    private Integer adoptStatus;

    private String genderName;

    private String petTypeName;

    private String adoptStatusName;

    public String getGenderName() {
        return genderName;
    }

    public void setGenderName(String genderName) {
        this.genderName = genderName;
    }

    public String getPetTypeName() {
        return petTypeName;
    }

    public void setPetTypeName(String petTypeName) {
        this.petTypeName = petTypeName;
    }

    public String getAdoptStatusName() {
        return adoptStatusName;
    }

    public void setAdoptStatusName(String adoptStatusName) {
        this.adoptStatusName = adoptStatusName;
    }

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

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public Integer getAdoptStatus() {
        return adoptStatus;
    }

    public void setAdoptStatus(Integer adoptStatus) {
        this.adoptStatus = adoptStatus;
    }
}
