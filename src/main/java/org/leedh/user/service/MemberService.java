package org.leedh.user.service;

import com.sun.org.apache.xml.internal.utils.StringToIntTable;
import org.leedh.user.vo.EmpVO;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
public interface MemberService {

    void register(EmpVO vo) throws Exception;

    EmpVO login(EmpVO vo) throws Exception;

    // 비밀번호 가져오기
    String getPw(String id) throws Exception;

    void empEdit(EmpVO vo) throws Exception;

    void memberDelete(EmpVO vo) throws Exception;

    void find_pw(HttpServletResponse response,EmpVO vo) throws Exception;

    int idChk(EmpVO vo) throws Exception;
    
    //직원 정보(한명) 조회
    EmpVO selectEmp() throws Exception;
    //직원 정보(전체) 조회
    List<EmpVO> empShow() throws Exception;

    //직원 정보 삭제
    void deleteEmp(String no);
    void deleteEmpAdmin(String no);
}
