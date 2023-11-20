
package project.sln.service;

import project.sln.dto.UserDTO;

public interface IUserService {

    UserDTO getUserIdExists(UserDTO pDTO) throws Exception;


    int insertUserInfo(UserDTO pDTO) throws Exception;

    UserDTO getNickNameCheck(UserDTO pDTO) throws Exception;

    UserDTO getLogin(UserDTO pDTO) throws Exception;

    UserDTO searchUserIdOrPasswordProc(UserDTO pDTO) throws Exception;

    int newPasswordProc(UserDTO pDTO) throws Exception;

}

