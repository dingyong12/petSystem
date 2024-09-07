package cn.petmanagementsystem.domain.vo;

public class AdoptPetVo {

    //宠物ID
    private Integer petId;

    //领养方式
    private Integer adoptMethod;

    //用户ID
    private Integer userId;

    private String address;

    private String userAddress;

    private String pickupAddress;


    public String getPickupAddress() {
        return pickupAddress;
    }

    public void setPickupAddress(String pickupAddress) {
        this.pickupAddress = pickupAddress;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

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
