package org.leedh.user.service;

import org.leedh.user.vo.EmpVO;
import java.util.List;
public interface MemberService {

    void register(EmpVO vo) throws Exception;

    EmpVO login(EmpVO vo) throws Exception;

    // 비밀번호 가져오기
    String getPw(String id) throws Exception;

    void memberUpdate(EmpVO vo) throws Exception;

    void memberDelete(EmpVO vo) throws Exception;

    int passChk(EmpVO vo) throws Exception;

    int idChk(EmpVO vo) throws Exception;
    
    //직원 정보(한명) 조회
    EmpVO selectEmp() throws Exception;
    //직원 정보(전체) 조회
    List<EmpVO> empShow() throws Exception;
}
