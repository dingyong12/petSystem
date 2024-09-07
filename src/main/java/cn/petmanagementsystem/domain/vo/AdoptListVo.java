package cn.petmanagementsystem.domain.vo;

/**
 * 领养记录请求参数
 */
public class AdoptListVo {

    // 领养人联系方式
    private String phone;

    // 领养方式
    private Integer adoptMethod;

    private String petName;

    private String userName;


    // 页码
    private Integer pageNum;

    // 数量
    private Integer offset;

    public AdoptListVo() {
    }

    public AdoptListVo(String userName, String phone, Integer adoptMethod, String petName) {
        this.userName = userName;
        this.phone = phone;
        this.adoptMethod = adoptMethod;
        this.petName = petName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getAdoptMethod() {
        return adoptMethod;
    }

    public void setAdoptMethod(Integer adoptMethod) {
        this.adoptMethod = adoptMethod;
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
