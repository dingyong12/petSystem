package cn.petmanagementsystem.domain.common;

import java.util.List;

public class Pager<T> {
    private int page;//分页起始页
    private int size;//每页记录数
    private List<T> data;//返回的记录集合
    private long count;//总记录条数
    private Integer code = 0;

    public int getPage() {
        return page;
    }

    public Pager() {
    }

    public Pager(int page, int size, List<T> data, long count) {
        this.page = page;
        this.size = size;
        this.data = data;
        this.count = count;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }
}