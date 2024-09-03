package cn.petmanagementsystem.controller;

import cn.petmanagementsystem.domain.Adopt;
import cn.petmanagementsystem.domain.common.Pager;
import cn.petmanagementsystem.domain.vo.AdoptListVo;
import cn.petmanagementsystem.domain.vo.AdoptPetVo;
import cn.petmanagementsystem.service.IAdoptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/adopt")
@RestController
public class AdoptController {

    @Autowired
    IAdoptService adoptService;


    /**
     * 查看领养记录
     *
     * @param vo
     * @return
     */
    @PostMapping("/queryAdoptList")
    public Pager<Adopt> queryAdoptList(@RequestBody AdoptListVo vo) {
        return adoptService.queryAdoptList(vo);
    }

    /**
     * 认领操作
     */
    @PostMapping("/adoptPet")
    public Integer adoptPet(@RequestBody AdoptPetVo vo) {
        return adoptService.adoptPet(vo);
    }
}
