package org.leedh.user.service;

import org.leedh.user.dao.MemberDAO;
import org.leedh.user.vo.EmpVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	private final MemberDAO dao;

	@Autowired
	public MemberServiceImpl(MemberDAO dao) {
		this.dao = dao;
	}

	@Override
	public void register(EmpVO vo) throws Exception {
		
		dao.register(vo);
		
	}

	@Override
	public EmpVO login(EmpVO vo) throws Exception {
		return dao.login(vo);
	}

	//Controller에서 보내는 파라미터들을 memberUpdate(EmpVO vo)로 받고
	@Override
	public void memberUpdate(EmpVO vo) throws Exception {
		
		//받은 vo를 DAO로 보내줍니다.
		dao.memberUpdate(vo);
		
	}
	
	// 업데이트에서 처리한 내용과 같습니다.
	@Override
	public void memberDelete(EmpVO vo) throws Exception {
		dao.memberDelete(vo);
	}

	// 패스워드 체크
	@Override
	public int passChk(EmpVO vo) throws Exception {
		return dao.passChk(vo);
	}
	
	// 아이디 중복 체크
	@Override
	public int idChk(EmpVO vo) throws Exception {
		return dao.idChk(vo);
	}
	
}
