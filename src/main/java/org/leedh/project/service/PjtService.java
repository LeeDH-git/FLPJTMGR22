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
	void delete(String no);//삭제

}
