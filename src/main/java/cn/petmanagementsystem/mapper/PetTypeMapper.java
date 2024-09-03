package cn.petmanagementsystem.mapper;

import cn.petmanagementsystem.domain.PetType;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PetTypeMapper {
    List<PetType> queryPetTypeList();

    Integer addPetType(PetType petType);
}
