package project.sln.service.impl;


import project.sln.dto.GdsDTO;
import project.sln.service.IGdsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;



import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class GdsService implements IGdsService {

    @Override
    public List<GdsDTO> gdsTest() throws Exception {

        log.info(this.getClass().getName() + ".gdsTest Start!");

        List<GdsDTO> pList = new ArrayList<>();
        return pList;
    }

}