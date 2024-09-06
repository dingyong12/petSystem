package cn.petmanagementsystem.common;

public class Result<T> {

    private T data;

    private Integer code = 200;

    private String message = "操作成功";

    public Result() {
    }

    public Result(T data) {
        this.data = data;
    }

    public static <T> Result<T> success(T data) {
        return new Result<>(data);
    }

    public static <T> Result<T> success(T data, String message) {
        return new Result<>(data, 200, message);
    }

    public static <T> Result<T> success(T data, Integer code, String message) {
        return new Result<>(data, code, message);
    }

    public static <T> Result<T> fail(T data) {
        return new Result<>(data, 500, "操作失败");
    }

    public static <T> Result<T> fail(T data, String message) {
        return new Result<>(data, 500, message);
    }

    public static <T> Result<T> fail(T data, Integer code, String message) {
        return new Result<>(data, code, message);
    }

    public Result(T data, Integer code, String message) {
        this.data = data;
        this.code = code;
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
