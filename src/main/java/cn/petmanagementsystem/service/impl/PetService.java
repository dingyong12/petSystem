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

    private String girlPetPic = " https://www.pethaven.com.hk/catalog/adoption/icons/adoption-icons/girl.svg";
    private String boyPetPic = "https://www.pethaven.com.hk/catalog/adoption/icons/adoption-icons/boy.svg";
    private String catPic = "https://www.pethaven.com.hk/catalog/adoption/icons/adoption-icons/cat-icon.svg";
    private String dogPic = "https://www.pethaven.com.hk/catalog/adoption/icons/adoption-icons/dog-icon.svg";


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
            pet.setGenderPic(pet.getGender() == 0 ? boyPetPic : girlPetPic);
            pet.setPetPic(pet.getPetType() == 0 ? dogPic : catPic);
        });
        Pager<Pet> result = new Pager<>();
        result.setPage(petVo.getPageNum());
        result.setCount(page.getTotal());
        result.setData(pets);
        result.setSize(petVo.getOffset());
        return result;
    }

    @Override
    public Pet getPetDetail(Integer id) {
        Pet petDetail = petMapper.getPetDetail(id);
        petDetail.setGenderName(petDetail.getGender() == 0 ? "公" : "母");
        return petDetail;
    }
}
