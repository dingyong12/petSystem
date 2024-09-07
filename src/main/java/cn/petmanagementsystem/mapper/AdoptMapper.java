package cn.petmanagementsystem.mapper;

import cn.petmanagementsystem.domain.AdoptDto;
import cn.petmanagementsystem.domain.vo.AdoptListVo;
import cn.petmanagementsystem.domain.vo.AdoptPetVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdoptMapper {
    List<AdoptDto> queryAdoptList(AdoptListVo vo);

    Integer adoptPet(AdoptPetVo vo);

    void handleApproval(@Param("id") Integer id, @Param("action") Integer action);
}
