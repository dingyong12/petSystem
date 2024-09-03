package cn.petmanagementsystem.service;

import cn.petmanagementsystem.domain.PetType;

import java.util.List;

public interface IPetTypeService {

    List<PetType> queryPetTypeList();

    Integer addPetType(PetType petType);
}
