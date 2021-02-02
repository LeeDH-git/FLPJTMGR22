package org.leedh.project.dao;

import org.leedh.project.vo.PjtVO;
public interface PjtDao {

	//프로젝트 등록
	void register(PjtVO pjtVO) throws Exception;
}
