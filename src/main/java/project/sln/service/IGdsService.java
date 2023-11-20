package project.sln.service;

import project.sln.dto.GdsDTO;

import java.util.List;

public interface IGdsService {
    List<GdsDTO> getGdsList() throws Exception;
    int insertGdsInfo(GdsDTO pDTO) throws Exception;
    void updateGdsInfo(GdsDTO pDTO) throws Exception;


}



