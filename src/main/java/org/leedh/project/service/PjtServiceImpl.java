package org.leedh.project.service;


import org.leedh.project.dao.PjtDao;
import org.leedh.user.vo.EmpVO;
import org.leedh.project.vo.PjtVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service

public class PjtServiceImpl implements PjtService{
	

    private final PjtDao projectDao;
    @Autowired
    public PjtServiceImpl(PjtDao projectDao) {
        this.projectDao = projectDao;
    }

    // 프로젝트 등록 처리
    @Override
    public void register(PjtVO pjtVO) throws Exception {
    	projectDao.register(pjtVO);
    }
}
