package cn.petmanagementsystem.domain.vo;

public class PetVo {
    // 宠物种类id
    private Integer typeId;

    // 宠物昵称
    private String name;

    //性别
    private Integer gender;

    // 领养状态
    private Integer adoptStatus;

    private Integer petType;

    // 页码
    private Integer pageNum;

    // 数量
    private Integer offset;

    public PetVo() {
    }

    public PetVo(Integer typeId, String name, Integer gender,Integer petType, Integer adoptStatus, Integer pageNum, Integer offset) {
        this.typeId = typeId;
        this.name = name;
        this.gender = gender;
        this.adoptStatus = adoptStatus;
        this.petType = petType;
        this.pageNum = pageNum;
        this.offset = offset;
    }

    public Integer getPetType() {
        return petType;
    }

    public void setPetType(Integer petType) {
        this.petType = petType;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
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
