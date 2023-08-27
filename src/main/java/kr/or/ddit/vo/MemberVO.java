package kr.or.ddit.vo;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class MemberVO {
    private int userNo;
    private String userId;
    private String userPw;
    private String userName;
    private int coin;
    private Date regDate;
    private Date updDate;
    private String enabled;

    //MemberVO : MemberAuthVO = 1 : N
    private List<MemberAuthVO> memberAuthVOList;

}
