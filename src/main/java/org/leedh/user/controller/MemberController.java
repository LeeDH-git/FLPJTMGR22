package org.leedh.user.controller;

import org.leedh.user.dao.MemberDAO;
import org.leedh.user.service.MemberService;
import org.leedh.user.vo.EmpVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.springframework.ui.Model;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class MemberController {
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    private final MemberService service;
    private final MemberDAO dao;
    BCryptPasswordEncoder pwdEncoder;

    @Autowired
    public MemberController(MemberService service, MemberDAO dao, BCryptPasswordEncoder pwdEncoder) {
        this.service = service;
        this.pwdEncoder = pwdEncoder;
        this.dao = dao;
    }


    // 회원가입 get
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void getRegister() throws Exception {
        logger.info("get register");
    }

    // 회원가입 post
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String postRegister(EmpVO vo) throws Exception {
        logger.info("post register");
        int result = service.idChk(vo);
        try {
            if (result == 1) {
                return "redirect:/user/register";
            } else if (result == 0) {
                String inputPass = vo.getEmpPw();
                String pwd = pwdEncoder.encode(inputPass);
                vo.setEmpPw(pwd);
                service.register(vo);
            }
            // 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기
            // 존재하지 않는다면 -> register
        } catch (Exception e) {
            throw new RuntimeException();
        }
        return "redirect:/main";
    }

    // 로그인 post
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(EmpVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {

        session.getAttribute("user");

        String id = vo.getEmpEmail();
        String pw = dao.getPw(id);
        logger.info("암호화 비밀번호 :" + pw);

        String rawPw = vo.getEmpPw();
        logger.info("입력된 비밀번호: " + rawPw);

        if (pwdEncoder.matches(rawPw, pw)) {
            logger.info("비밀번호 일치");
            service.login(vo);
            String message = vo.getEmpNm();
            session.setAttribute("user", message);
        } else {
            logger.info("비밀번호 불일치");
            return "redirect:/";
        }

        return "redirect:/main";

    }

    // 로그아웃 post
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) throws Exception {

        session.invalidate();

        return "redirect:/";
    }

    // 회원정보 수정 get
    @RequestMapping(value = "/memberUpdateView", method = RequestMethod.GET)
    public String registerUpdateView() throws Exception {
        return "user/nouse/memberUpdateView";
    }

    // 회원정보 수정  post
    @RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
    public String registerUpdate(EmpVO vo, HttpSession session) throws Exception {

/*		MemberVO login = service.login(vo);

		boolean pwdMatch = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());
		if(pwdMatch) {
			service.memberUpdate(vo);
			session.invalidate();
		}else {
			return "member/memberUpdateView";
		}*/
        service.memberUpdate(vo);
        session.invalidate();
        return "redirect:/";
    }

    // 회원 탈퇴 get
    @RequestMapping(value = "/memberDeleteView", method = RequestMethod.GET)
    public String memberDeleteView() throws Exception {
        return "user/nouse/memberDeleteView";
    }

    // 회원 탈퇴 post
    @RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
    public String memberDelete(EmpVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {

        service.memberDelete(vo);
        session.invalidate();

        return "redirect:/";
    }

    // 패스워드 체크
    @ResponseBody
    @RequestMapping(value = "/passChk", method = RequestMethod.POST)
    public boolean passChk(EmpVO vo) throws Exception {

        EmpVO login = service.login(vo);
        boolean pwdChk = pwdEncoder.matches(vo.getEmpPw(), login.getEmpPw());
        return pwdChk;
    }

    // 아이디 중복 체크
    @ResponseBody
    @RequestMapping(value = "/idChk", method = RequestMethod.POST)
    public int idChk(EmpVO vo) throws Exception {
        int result = service.idChk(vo);
        return result;
    }

    //사원 한명 정보불러오기

    @RequestMapping(value = "/empInfo", method = RequestMethod.GET)
    public void empInfo() throws Exception{

        logger.info("get empInfo");
        // 매개변수 EmpVO empVo,Model model
        //empVo = service.selectEmp();
        //model.addAttribute("emp",empVo);

        //return "/user/empInfo";
    }


    //사원 전체 정보 불러오기
    @RequestMapping(value = "/empShow", method = RequestMethod.GET)
    public String empShow(Model model) throws Exception{


        List<EmpVO> empVo = service.empShow();
        model.addAttribute("empList",empVo);

        return "/user/empShow";
    }

    // 사원 정보 삭제
    @RequestMapping(value = "/empdelete", method = RequestMethod.GET)
    public String delete(String no) throws Exception {
        service.deleteEmp(no);
        service.deleteEmpAdmin(no);
        return "redirect:/user/empShow";
    }

    // 사원 정보 선택삭제
    @RequestMapping(value = "/empdelete")
    public String checkDelete(HttpServletRequest request) throws Exception {

        String[] ajaxMsg = request.getParameterValues("valueArr");

        for (String s : ajaxMsg) {
            service.deleteEmp(s);
            service.deleteEmpAdmin(s);
        }
        return "redirect:/user/empShow";
    }

}
