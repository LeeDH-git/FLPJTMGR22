package org.leedh.user.service;

import org.leedh.user.vo.EmpVO;

public interface MemberService {

    void register(EmpVO vo) throws Exception;

    EmpVO login(EmpVO vo) throws Exception;

    // 비밀번호 가져오기
    String getPw(String id) throws Exception;

    void memberUpdate(EmpVO vo) throws Exception;

    void memberDelete(EmpVO vo) throws Exception;

    int passChk(EmpVO vo) throws Exception;

    int idChk(EmpVO vo) throws Exception;
}
