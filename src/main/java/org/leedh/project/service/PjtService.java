package org.leedh.project.service;

import org.leedh.project.vo.PjtVO;
import org.springframework.stereotype.Service;

@Service

public interface PjtService {
	//프로젝트 등록처리
	
	void register(PjtVO pjtVO) throws Exception;
}
