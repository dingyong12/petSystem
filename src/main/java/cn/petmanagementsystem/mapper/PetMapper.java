package cn.petmanagementsystem.mapper;

import cn.petmanagementsystem.domain.Pet;
import cn.petmanagementsystem.domain.vo.PetVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PetMapper {
    Integer addPet(Pet pet);

    List<Pet> queryPetList(PetVo petVo);
}
