package project.sln.persistance.mapper;

import org.apache.ibatis.annotations.Mapper;
import project.sln.dto.GdsDTO;

import java.util.List;

@Mapper
public interface IGdsMapper {
    List<GdsDTO> getGdsList() throws Exception;
    int insertGdsInfo(GdsDTO pDTO) throws Exception;

    void updateGdsInfo(GdsDTO pDTO) throws Exception;
}