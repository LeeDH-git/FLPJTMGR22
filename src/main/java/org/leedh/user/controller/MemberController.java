package org.leedh.user.controller;

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

import javax.servlet.http.HttpSession;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    private final MemberService service;
    BCryptPasswordEncoder pwdEncoder;

    @Autowired
    public MemberController(MemberService service, BCryptPasswordEncoder pwdEncoder) {
        this.service = service;
        this.pwdEncoder = pwdEncoder;
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
                return "/member/register";
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
        return "redirect:/";
    }

    // 로그인 post
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(EmpVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
        logger.info("post login");

        session.getAttribute("member");
        EmpVO login = service.login(vo);
        boolean pwdMatch = pwdEncoder.matches(vo.getEmpPw(), login.getEmpPw());

        if (login != null && pwdMatch == true) {
            session.setAttribute("member", login);
        } else {
            session.setAttribute("member", null);
            rttr.addFlashAttribute("msg", false);
        }


        return "redirect:/";
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
        return "member/memberUpdateView";
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
        return "member/memberDeleteView";
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

}