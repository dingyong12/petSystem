package cn.petmanagementsystem.service.impl;

import cn.petmanagementsystem.domain.Pet;
import cn.petmanagementsystem.domain.common.Pager;
import cn.petmanagementsystem.domain.vo.PetVo;
import cn.petmanagementsystem.mapper.PetMapper;
import cn.petmanagementsystem.service.IPetService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PetService implements IPetService {

    @Autowired
    private PetMapper petMapper;


    @Override
    public Integer addPet(Pet pet) {
        return petMapper.addPet(pet);
    }

    @Override
    public Pager<Pet> queryPetList(PetVo petVo) {
        Page<Object> page = PageHelper.startPage(petVo.getPageNum(), petVo.getOffset(), true);
        List<Pet> pets = petMapper.queryPetList(petVo);
        pets.forEach(pet -> {
            pet.setGenderName(pet.getGender() == 0 ? "公" : "母");
            pet.setAdoptStatusName(pet.getAdoptStatus() == 0 ? "未领养" : "已领养");
        });
        Pager<Pet> result = new Pager<>();
        result.setPage(petVo.getPageNum());
        result.setTotal(page.getTotal());
        result.setRows(pets);
        result.setSize(petVo.getOffset());
        return result;
    }
}
