package project.sln.dto;


import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.bind.annotation.GetMapping;

@Getter
@Setter
@JsonInclude(JsonInclude.Include.NON_DEFAULT)
public class UserDTO {

    // DTo 최신화 시켜야함.

    private String userName;
    private String userId;
    private String password;        // 암호화 저장
    private String birthDay; // 암호화 저장 굳이 할 필요 있나 싶음.
    private String addr1;
    private String nickName;
    private String addr2;



    private String existsYn;
    private String passwordCheck;


}
