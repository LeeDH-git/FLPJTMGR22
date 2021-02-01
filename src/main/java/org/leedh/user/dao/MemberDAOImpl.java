package org.leedh.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.leedh.user.vo.EmpVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAOImpl implements MemberDAO {

    private static final String NAMESPACE = "UserMapper";
    private final SqlSession sql;

    @Autowired
    public MemberDAOImpl(SqlSession sql) {
        this.sql = sql;
    }

    // 회원가입
    @Override
    public void register(EmpVO vo) throws Exception {
        sql.insert(NAMESPACE + ".register", vo);
    }

    @Override
    public EmpVO login(EmpVO vo) throws Exception {

        return sql.selectOne(NAMESPACE + ".login", vo);
    }

    //서비스에서 보낸 파라미터들을 memberUpdate(EmpVO vo)에 담습니다.
    @Override
    public void memberUpdate(EmpVO vo) throws Exception {
        // vo에 담긴 파라미터들은 memberMapper.xml에 memberMapper라는 namespace에
        // 아이디가 memberUpdate인 쿼리에 파라미터들을 넣어줍니다.
        sql.update(NAMESPACE + ".memberUpdate", vo);
    }

    // 업데이트와 마찬가지로 흐름은 같습니다.
    @Override
    public void memberDelete(EmpVO vo) throws Exception {
        // EmpVO에 담긴 값들을 보내줍니다.
        // 그럼 xml에서 memberMapper.memberDelete에 보시면
        //  #{userId}, #{userPass}에 파라미터값이 매칭이 되겠지요.
        sql.delete(NAMESPACE + ".memberDelete", vo);

    }

    // 패스워드 체크
    @Override
    public int passChk(EmpVO vo) throws Exception {
        return sql.selectOne(NAMESPACE + ".passChk", vo);
    }

    // 아이디 중복 체크
    @Override
    public int idChk(EmpVO vo) throws Exception {
        return sql.selectOne(NAMESPACE + ".idChk", vo);
    }

    @Override
    public String getPw(String id) throws Exception {
        return sql.selectOne(NAMESPACE + ".getPw" , id);
    }
}









