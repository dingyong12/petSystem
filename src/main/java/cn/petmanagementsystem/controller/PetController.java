package cn.petmanagementsystem.controller;

import cn.petmanagementsystem.domain.Pet;
import cn.petmanagementsystem.domain.PetType;
import cn.petmanagementsystem.domain.common.Pager;
import cn.petmanagementsystem.domain.vo.PetVo;
import cn.petmanagementsystem.service.IPetService;
import cn.petmanagementsystem.service.IPetTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
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

    @GetMapping("/petDetail")
    public String getPetDetail() {
        return "petDetail";
    }

    @GetMapping("/getPetList")
    @ResponseBody
    public Pager<Pet> queryPetList(@RequestParam(defaultValue = "-1") Integer petTypeId,
                                   @RequestParam(required = false) String name, @RequestParam(defaultValue = "-1") Integer gender, @RequestParam(defaultValue = "-1") Integer adoptStatus,
                                   @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer limit) {
        if (petTypeId == -1) {
            petTypeId = null;
        }
        if (gender == -1) {
            gender = null;
        }
        if (adoptStatus == -1) {
            adoptStatus = null;
        }

        return petService.queryPetList(new PetVo(petTypeId, name, gender, adoptStatus, page, limit));
//        session.setAttribute("pets", petPager.getRows());
//        session.setAttribute("petPager", petPager);
//        return "petManagement";
    }

    @GetMapping("/getPetDetail")
    @ResponseBody
    public Pet getPetDetail(Integer id) {
        return petService.getPetDetail(id);
    }

    @GetMapping("/getPetTypeList")
    @ResponseBody
    public List<PetType> queryPetTypeList() {
        return petTypeService.queryPetTypeList();
    }
}
