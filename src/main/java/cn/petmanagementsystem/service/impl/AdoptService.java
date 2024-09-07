package cn.petmanagementsystem.service.impl;

import cn.petmanagementsystem.domain.AdoptDto;
import cn.petmanagementsystem.domain.common.Pager;
import cn.petmanagementsystem.domain.vo.AdoptListVo;
import cn.petmanagementsystem.domain.vo.AdoptPetVo;
import cn.petmanagementsystem.mapper.AdoptMapper;
import cn.petmanagementsystem.service.IAdoptService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdoptService implements IAdoptService {

    @Autowired
    private AdoptMapper adoptMapper;


    @Override
    public Pager<AdoptDto> queryAdoptList(String userName, Integer adoptMethod, String phone, String petName, Integer pageNum, Integer limit) {
        Page<Object> page = PageHelper.startPage(pageNum, limit, true);
        AdoptListVo vo = new AdoptListVo(userName, phone, adoptMethod, petName);
        List<AdoptDto> list = adoptMapper.queryAdoptList(vo);
        for (AdoptDto dto : list) {
            if (dto.getAdoptMethod() == 0) {
                dto.setAdoptMethodStr("自提");
            } else if (dto.getAdoptMethod() == 1) {
                dto.setAdoptMethodStr("物流");
            }
            Integer approveStatus = dto.getApprovalStatus();
            if (approveStatus == 0) {
                dto.setApprovalStatusStr("待审批");
            } else if (approveStatus == 1) {
                dto.setApprovalStatusStr("审批通过");
            } else if (approveStatus == 2) {
                dto.setApprovalStatusStr("审批未通过");
            }
        }

        return new Pager<>(pageNum, limit, list, page.getTotal());
    }

    @Override
    public Integer adoptPet(AdoptPetVo vo) {
        return adoptMapper.adoptPet(vo);
    }
}
