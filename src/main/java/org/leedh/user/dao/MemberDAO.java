package org.leedh.user.dao;

import org.leedh.user.vo.EmpVO;

public interface MemberDAO {
	
	// 회원가입
	public void register(EmpVO vo) throws Exception;
	
	//로그인
	public EmpVO login(EmpVO vo) throws Exception;
	
	// 회원정보 수정
	public void memberUpdate(EmpVO vo)throws Exception;
	
	// 회원 탈퇴
	public void memberDelete(EmpVO vo)throws Exception;
	
	// 패스워드 체크
	public int passChk(EmpVO vo) throws Exception;
	
	// 아이디 중복체크
	public int idChk(EmpVO vo) throws Exception;
}
