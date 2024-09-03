package cn.petmanagementsystem.service;

import cn.petmanagementsystem.domain.Pet;
import cn.petmanagementsystem.domain.common.Pager;
import cn.petmanagementsystem.domain.vo.PetVo;

public interface IPetService {
    Integer addPet(Pet pet);

    Pager<Pet> queryPetList(PetVo petVo);
}
