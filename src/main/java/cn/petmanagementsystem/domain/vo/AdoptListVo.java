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


    // 页码
    private Integer pageNum;

    // 数量
    private Integer offset;


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
