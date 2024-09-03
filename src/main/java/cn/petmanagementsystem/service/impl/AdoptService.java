package cn.petmanagementsystem.service.impl;

import cn.petmanagementsystem.domain.Adopt;
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
    public Pager<Adopt> queryAdoptList(AdoptListVo vo) {
        Page<Object> page = PageHelper.startPage(vo.getPageNum(), vo.getOffset(), true);
        List<Adopt> result = adoptMapper.queryAdoptList(vo);
        return new Pager<>(vo.getPageNum(), vo.getOffset(), result, page.getTotal());
    }

    @Override
    public Integer adoptPet(AdoptPetVo vo) {
        return adoptMapper.adoptPet(vo);
    }
}
