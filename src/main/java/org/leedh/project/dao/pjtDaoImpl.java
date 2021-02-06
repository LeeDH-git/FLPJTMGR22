package org.leedh.project.dao;


import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.leedh.project.vo.PjtVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Slf4j
public class pjtDaoImpl implements PjtDao {

    private static final String NAMESPACE = "org.leedh.mapper.PjtMapper";

    private final SqlSession sqlSession;

    @Autowired
    public pjtDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    // 프로젝트 등록 처리

    @Override
    public void register(PjtVO pjtVO) throws Exception {
        sqlSession.insert(NAMESPACE + ".pjtRegister", pjtVO);
        log.debug("pjtRegister error : " + pjtVO);
    }

    //프로젝트 조회(전체)
    @Override
    public List<PjtVO> pjtShow() throws Exception {
        return sqlSession.selectList(NAMESPACE + ".pjtShow");
    }

    @Override
    public void deletePjtCode(String no) {
        sqlSession.delete(NAMESPACE + ".deletePjtCode", no);
    }

    @Override
    public void deletePjt(String no) {
        sqlSession.delete(NAMESPACE + ".deletePjt", no);
    }


    //프로젝트 수정
    @Override
    public void pjtEdit(PjtVO pjtVO) throws Exception {
        sqlSession.update(NAMESPACE + ".pjtEdit", pjtVO);
    }

    @Override
    public List<PjtVO> memberUnion() throws Exception {
        return sqlSession.selectList(NAMESPACE + ".memberUnion");
    }

}

