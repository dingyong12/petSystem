package cn.petmanagementsystem.mapper;

import cn.petmanagementsystem.domain.Adopt;
import cn.petmanagementsystem.domain.vo.AdoptListVo;
import cn.petmanagementsystem.domain.vo.AdoptPetVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdoptMapper {
    List<Adopt> queryAdoptList(AdoptListVo vo);

    Integer adoptPet(AdoptPetVo vo);
}
