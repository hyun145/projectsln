package project.sln.service.impl;


import lombok.RequiredArgsConstructor;
import project.sln.dto.GdsDTO;
import project.sln.persistance.IUserMapper;
import project.sln.persistance.mapper.IGdsMapper;
import project.sln.service.IGdsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;



import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Slf4j
@Service
public class GdsService implements IGdsService {
    private final IGdsMapper GdsMapper;

    @Override
    public List<GdsDTO> getGdsList() throws Exception {

        log.info(this.getClass().getName() + ".getGdsList Start!");

        return GdsMapper.getGdsList();

    }
    @Override
    public int insertGdsInfo(GdsDTO pDTO) throws Exception {
        log.info(this.getClass().getName() + ".InsertGdsInfo start!");

        int res= 0;
        int success = GdsMapper.insertGdsInfo(pDTO);


        // 여기 수정해야함.
        if(success > 0) {
            res =1;
        } else {
            res =0;
        }
        log.info(this.getClass().getName() + ".insertGdsInfo Start!");

        return res;
    }

    @Override
    public void updateGdsInfo(GdsDTO pDTO) throws Exception {
        log.info(this.getClass().getName() + ".UpdateGdsInfo start!");

        GdsMapper.updateGdsInfo(pDTO);

    }
}