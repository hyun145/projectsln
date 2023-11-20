
package project.sln.persistance;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.Mapping;
import project.sln.dto.UserDTO;


@Mapper
public interface IUserMapper {



    // 회원 가입 하는 기능
    int insertUserInfo(UserDTO pDTO) throws Exception;

    // 아이디 중복체크 기능
    UserDTO getUserIdExists(UserDTO pDTO) throws Exception;


    UserDTO getNickNameCheck(UserDTO pDTO) throws Exception;

    // 이메일 중복체크 기능

    //로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기 !
    UserDTO getLogin(UserDTO pDTO) throws  Exception;

    UserDTO getUserId(UserDTO pDTO) throws Exception;




    int updatePassword(UserDTO pDTO) throws Exception;











}

