package cn.petmanagementsystem.controller;

import cn.petmanagementsystem.domain.Pet;
import cn.petmanagementsystem.domain.PetType;
import cn.petmanagementsystem.domain.common.Pager;
import cn.petmanagementsystem.domain.vo.PetVo;
import cn.petmanagementsystem.service.IPetService;
import cn.petmanagementsystem.service.IPetTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/pet")
@RestController
public class PetController {

    @Autowired
    IPetService petService;

    @Autowired
    IPetTypeService petTypeService;

    @PostMapping("/addPet")
    public Integer addPet(@RequestBody Pet pet) {
        return petService.addPet(pet);
    }

    @PostMapping("/addPetType")
    public Integer addPetType(@RequestBody PetType petType) {
        return petTypeService.addPetType(petType);
    }

    @PostMapping("/queryPetList")
    public Pager<Pet> queryPetList(@RequestBody PetVo petVo) {
        return petService.queryPetList(petVo);
    }

    @PostMapping("/queryPetTypeList")
    public List<PetType> queryPetTypeList() {
        return petTypeService.queryPetTypeList();
    }
}
