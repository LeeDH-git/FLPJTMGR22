package org.leedh.project.service;

import org.leedh.project.vo.PjtVO;
import org.springframework.stereotype.Service;

import java.util.List;
@Service

public interface PjtService {
	//프로젝트 등록처리
	
	void register(PjtVO pjtVO) throws Exception;
	
	//프로젝트 조회(전체)
	List<PjtVO> pjtShow() throws Exception;

	//프로젝트 삭제
	void deletePjtCode(String no);
	void deletePjt(String no);
	
	//프로젝트 수정
	void pjtEdit(PjtVO pjtVO) throws Exception;

	List<PjtVO>	memberUnion() throws Exception;

}
