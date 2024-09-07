package cn.petmanagementsystem.service;

import cn.petmanagementsystem.domain.AdoptDto;
import cn.petmanagementsystem.domain.common.Pager;
import cn.petmanagementsystem.domain.vo.AdoptPetVo;

public interface IAdoptService {
    Pager<AdoptDto> queryAdoptList(String userName, Integer adoptMethod, String phone, String petName, Integer page, Integer limit);

    void adoptPet(AdoptPetVo vo);

    void handleApproval(Integer id,Integer petId, Integer action);
}
