package org.leedh.user.dao;

import org.leedh.user.vo.EmpVO;
import java.util.List;
public interface MemberDAO {

    // 회원가입
    void register(EmpVO vo) throws Exception;

    //로그인
    EmpVO login(EmpVO vo) throws Exception;

    // 비밀번호 가져오기
    String getPw(String id) throws Exception;
    
    // 회원정보 수정
    void memberUpdate(EmpVO vo) throws Exception;

    // 회원 탈퇴
    void memberDelete(EmpVO vo) throws Exception;

    // 패스워드 체크
    int passChk(EmpVO vo) throws Exception;

    // 아이디 중복체크
    int idChk(EmpVO vo) throws Exception;
    
    //직원 정보(한명) 조회
    EmpVO selectEmp() throws Exception;
    
    //직원 정보(전체) 조회
    List<EmpVO> empShow() throws Exception;


}
