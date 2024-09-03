package cn.petmanagementsystem.domain.vo;

public class PetVo {
    // 宠物种类id
    private Integer petTypeId;

    // 宠物昵称
    private String name;

    //性别
    private Integer gender;

    // 领养状态
    private Integer adoptStatus;

    // 页码
    private Integer pageNum;

    // 数量
    private Integer offset;

    public Integer getPetTypeId() {
        return petTypeId;
    }

    public void setPetTypeId(Integer petTypeId) {
        this.petTypeId = petTypeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAdoptStatus() {
        return adoptStatus;
    }

    public void setAdoptStatus(Integer adoptStatus) {
        this.adoptStatus = adoptStatus;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }
}
