package cn.petmanagementsystem.mapper;

import cn.petmanagementsystem.domain.Pet;
import cn.petmanagementsystem.domain.vo.PetVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PetMapper {
    Integer addPet(Pet pet);

    List<Pet> queryPetList(PetVo petVo);

    Pet getPetDetail(@Param("id") Integer id);

    void updateStatus(@Param("petId")Integer petId,@Param("status") int status);
}
