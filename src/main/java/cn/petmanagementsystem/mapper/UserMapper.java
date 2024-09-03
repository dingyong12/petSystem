package cn.petmanagementsystem.mapper;

import cn.petmanagementsystem.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {

    User login(@Param("username") String username, @Param("password") String password);

    Integer register(User user);

    Integer deleteUser(Integer userId);

    List<User> getUserList(@Param("accountName") String accountName, @Param("status") Integer status, @Param("phone") String phone);
}
