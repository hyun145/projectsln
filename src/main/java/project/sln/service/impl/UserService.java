
package project.sln.service.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import project.sln.dto.UserDTO;
import project.sln.persistance.IUserMapper;
import project.sln.service.IUserService;
import project.sln.util.CmmUtil;

import javax.swing.text.html.Option;
import java.util.Optional;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserService implements IUserService {

    private final IUserMapper userMapper;


/**
     * iD 중복체크하기.
     * @param pDTO
     * @return
     * @throws Exception
     */

    @Override
    public UserDTO getUserIdExists(UserDTO pDTO) throws Exception {
        log.info(this.getClass().getName() + "getUserIdExists Start! ");

        UserDTO rDTO = userMapper.getUserIdExists(pDTO);

        // 아이디 중복체크 기능을 위한 코드를 짜야하는데 아직 모르곘음.
        String existsYn = CmmUtil.nvl(rDTO.getExistsYn());
        log.info("existsYn" + existsYn);
        log.info(this.getClass().getName() + ".getUserIdExists End!");

        return rDTO;

    }







    public int insertUserInfo(UserDTO pDTO) throws Exception {
        log.info(this.getClass().getName() + "insertUserInfo Start!");


        // 회원가입 성공 : 1, 아이디 중복으로 인한 가입취소 : 2, 닉네임 중복으로 인한 가입 취소 : 3, 기타 에러 발생 : 0
        int res= 0;
        int success = userMapper.insertUserInfo(pDTO);


        // 여기 수정해야함.
        if(success > 0) {
            res =1;
        } else {
            res =0;
        }
        log.info(this.getClass().getName() + ".insertUserInfo Start!");

        return res;

    }

    public UserDTO getNickNameCheck(UserDTO pDTO) throws Exception {
        // 여기에서도 닉네임 중복체크 기능 써야하는데 모르겠음.

        log.info(this.getClass().getName() + "getNickNameCheck Start! ");

        UserDTO rDTO = userMapper.getNickNameCheck(pDTO); //


        log.info(this.getClass().getName() + ".getNickNameCheck End!");

        return rDTO;

    }

    @Override
    public UserDTO getLogin(UserDTO pDTO) throws Exception {
       log.info(this.getClass().getName() + ".getLogin Start!");


       // 로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기 위한 Mapper 호출 !
        // 함수 실행 결과가 NULL 발생하면, UserDTO 메모리에 올리기.
       UserDTO rDTO = Optional.ofNullable(userMapper.getLogin(pDTO)).orElseGet(UserDTO::new);


       // 처리속도 측면에서 변수의 길이를 가져오는 것이 가장 빠름.

        log.info(this.getClass().getName() + ".getLogin End!");


        return rDTO;
    }


    @Override
    public UserDTO searchUserIdOrPasswordProc(UserDTO pDTO) throws Exception {

        log.info(this.getClass().getName() + ".searchUserIdOrPasswordProc Start!");

        UserDTO rDTO = userMapper.getUserId(pDTO);
        // 받은 유저이름이랑, 생년월일 DB에 넘겨줘야지. 그리고 rDTO에 저장해서 다시 컨트롤러에 넘겨줌 !

        log.info(this.getClass().getName() + ".searchUserIdOrPasswordProc End!");

        return rDTO;



    }

    @Override
    public int newPasswordProc(UserDTO pDTO) throws Exception {
        log.info(this.getClass().getName() +".newPasswordProc Start!");

        int success = userMapper.updatePassword(pDTO);


        log.info(this.getClass().getName() + "newPasswordProc End!");

        return success;
    }


}


