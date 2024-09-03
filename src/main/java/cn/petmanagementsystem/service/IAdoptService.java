package cn.petmanagementsystem.service;

import cn.petmanagementsystem.domain.Adopt;
import cn.petmanagementsystem.domain.common.Pager;
import cn.petmanagementsystem.domain.vo.AdoptListVo;
import cn.petmanagementsystem.domain.vo.AdoptPetVo;

public interface IAdoptService {
    Pager<Adopt> queryAdoptList(AdoptListVo vo);

    Integer adoptPet(AdoptPetVo vo);
}
