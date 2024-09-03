package cn.petmanagementsystem.domain.vo;

public class AdoptPetVo {

    //宠物名
    private Integer petId;

    //领养方式
    private Integer adoptMethod;

    //联系电话
    private Integer userId;


    public Integer getAdoptMethod() {
        return adoptMethod;
    }

    public void setAdoptMethod(Integer adoptMethod) {
        this.adoptMethod = adoptMethod;
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
}
