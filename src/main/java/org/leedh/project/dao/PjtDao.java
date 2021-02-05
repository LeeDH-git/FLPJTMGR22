package org.leedh.project.dao;

import org.leedh.project.vo.PjtVO;
import java.util.List;
public interface PjtDao {

	//프로젝트 등록
	void register(PjtVO pjtVO) throws Exception;
	
	//프로젝트 조회(전체)
	List<PjtVO> pjtShow() throws Exception;

	//프로젝트 삭제
	void deletePjtCode(String no);
	void deletePjt(String no);

	List<PjtVO>	memberunion() throws Exception;
}
