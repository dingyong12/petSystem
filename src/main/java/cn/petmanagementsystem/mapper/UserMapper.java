package cn.petmanagementsystem.mapper;

import cn.petmanagementsystem.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {

    User login(@Param("username") String username, @Param("password") String password);

    Integer register(User user);

    Integer deleteUser(Integer userId);
}
