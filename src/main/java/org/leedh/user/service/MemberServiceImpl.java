package org.leedh.user.service;

import org.apache.commons.mail.HtmlEmail;
import org.leedh.user.dao.MemberDAO;
import org.leedh.user.vo.EmpAdminVO;
import org.leedh.user.vo.EmpVO;
import org.leedh.util.SendEmail;
import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Service
@Transactional(rollbackFor = {Exception.class})
public class MemberServiceImpl implements MemberService {

    private final MemberDAO dao;
    SendEmail sendEmail = new SendEmail();

    @Autowired
    public MemberServiceImpl(MemberDAO dao) {
        this.dao = dao;
    }

    // 회원가입
    @Override
    public void register(EmpVO vo) throws Exception {

        String pjtlV = vo.getPjtLvC();
        String posC = vo.getPjtPosC();

        switch (pjtlV) {
            case "초급":
                vo.setPjtLvC("A01");
                break;
            case "중급":
                vo.setPjtLvC("A02");
                break;
            case "고급":
                vo.setPjtLvC("A03");
                break;
            case "특급":
                vo.setPjtLvC("A04");
                break;
        }

        switch (posC) {
            case "사원":
                vo.setPjtPosC("A001");
                break;
            case "대리":
                vo.setPjtPosC("A002");
                break;
            case "주임":
                vo.setPjtPosC("A003");
                break;
            case "과장":
                vo.setPjtPosC("A004");
                break;
            case "차장":
                vo.setPjtPosC("A005");
                break;
            case "부장":
                vo.setPjtPosC("A006");
                break;
            case "이사":
                vo.setPjtPosC("A007");
                break;
            case "상무":
                vo.setPjtPosC("A008");
                break;
            case "전무":
                vo.setPjtPosC("A009");
                break;
            case "대표이사":
                vo.setPjtPosC("A010");
                break;
        }

        dao.register(vo);
    }

    // 로그인
    @Override
    public EmpVO login(EmpVO vo) throws Exception {
        return dao.login(vo);
    }

    // Controller에서 보내는 파라미터들을 memberUpdate(EmpVO vo)로 받고
    @Override
    public void empEdit(EmpVO vo) throws Exception {
        //받은 vo를 DAO로 보내줍니다.
        dao.empEdit(vo);
    }

    // 업데이트에서 처리한 내용과 같습니다.
    @Override
    public void memberDelete(EmpVO vo) throws Exception {
        dao.memberDelete(vo);
    }

    public void find_pw(HttpServletResponse response,EmpVO vo) throws Exception {

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String getId = vo.getEmpEmail();

        // 아이디가 없으면
        int idChk = dao.idChk(vo);
        if (idChk == 0) {
            out.print("아이디가 없습니다.");
            out.close();
        }
        // 가입에 사용한 이메일이 아니면
        else if (!vo.getEmpEmail().equals(getId)) {
            out.print("잘못된 이메일 입니다.");
            out.close();
        } else {
            // 임시 비밀번호 생성
            String pw = "";
            for (int i = 0; i < 12; i++) {
                pw += (char) ((Math.random() * 26) + 97);
            }
            vo.setEmpPw(pw);

            // 비밀번호 변경
            dao.update_pw(vo);
            // 비밀번호 변경 메일 발송
            sendEmail.send_mail(vo,"find_pw");

            out.print("이메일로 임시 비밀번호를 발송하였습니다.");
            out.close();
        }
    }

    // 아이디 중복 체크
    @Override
    public int idChk(EmpVO vo) throws Exception {
        return dao.idChk(vo);
    }

    @Override
    public String getPw(String id) throws Exception {
        return dao.getPw(id);
    }

    @Override
    public EmpVO selectEmp() throws Exception {
        return dao.selectEmp();
    }

    // 전체 직원 조회
    @Override
    public List<EmpVO> empShow() throws Exception {



        return dao.empShow();
    }

    @Override
    public void deleteEmp(String no) {
        dao.deleteEmp(no);
    }

    @Override
    public void deleteEmpAdmin(String no) {
        dao.deleteEmpAdmin(no);
    }
}
