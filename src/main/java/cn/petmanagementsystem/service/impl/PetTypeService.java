package cn.petmanagementsystem.service.impl;

import cn.petmanagementsystem.domain.PetType;
import cn.petmanagementsystem.mapper.PetTypeMapper;
import cn.petmanagementsystem.service.IPetTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PetTypeService implements IPetTypeService {

    @Autowired
    PetTypeMapper petTypeMapper;

    @Override
    public List<PetType> queryPetTypeList() {
        return petTypeMapper.queryPetTypeList();
    }

    @Override
    public Integer addPetType(PetType petType) {
        return petTypeMapper.addPetType(petType);
    }
}
