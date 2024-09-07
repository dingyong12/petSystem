package cn.petmanagementsystem.controller;

import cn.petmanagementsystem.common.Result;
import cn.petmanagementsystem.domain.AdoptDto;
import cn.petmanagementsystem.domain.ApprovalRequest;
import cn.petmanagementsystem.domain.common.Pager;
import cn.petmanagementsystem.domain.vo.AdoptPetVo;
import cn.petmanagementsystem.service.IAdoptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class AdoptController {

    @Autowired
    IAdoptService adoptService;


    /**
     * 查看领养记录
     *
     * @param
     * @return
     */
    @GetMapping("/getAdoptionList")
    public Pager<AdoptDto> queryAdoptList(@RequestParam(required = false) String userName,
                                          @RequestParam(defaultValue = "-1") Integer adoptMethod,
                                          @RequestParam(required = false) String phone,
                                          @RequestParam(required = false) String petName,
                                          @RequestParam Integer page,
                                          @RequestParam Integer limit) {
        if (adoptMethod == -1) {
            adoptMethod = null;
        }
        return adoptService.queryAdoptList(userName, adoptMethod, phone, petName, page, limit);
    }

    /**
     * 认领操作
     */
    @PostMapping("/adoptPet")
    public Result adoptPet(@RequestBody AdoptPetVo vo) {
        if (vo.getPickupAddress() != null && !vo.getPickupAddress().isEmpty()) {
            vo.setAddress(vo.getPickupAddress());
        }
        if (vo.getUserAddress() != null && !vo.getUserAddress().isEmpty()) {
            vo.setAddress(vo.getUserAddress());
        }
        adoptService.adoptPet(vo);
        return Result.success("领养提交成功,等待审批");
    }

    @PostMapping("/handleApproval")
    public Result handleApproval(@RequestBody ApprovalRequest request) {
        Integer id = request.getId();
        Integer petId = request.getPetId();
        Integer action = request.getAction();
        adoptService.handleApproval(id, petId,action);
        return Result.success("审批成功");
    }
}
