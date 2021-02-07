package org.leedh.user.controller;

import lombok.extern.slf4j.Slf4j;
import org.leedh.user.dao.MemberDAO;
import org.leedh.user.service.MemberService;
import org.leedh.user.vo.EmpVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.springframework.ui.Model;

import java.text.DateFormat;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
@Slf4j
public class MemberController {

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
    public String getRegister(HttpServletRequest request, HttpSession session) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        log.info("get register");
        return "/user/register";

    }

    // 회원가입 post
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String postRegister(EmpVO vo, HttpSession session, HttpServletRequest request) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        log.info("post register");
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
            // 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기
            // 존재하지 않는다면 -> register
        } catch (Exception e) {
            log.debug(e.getMessage());
        }

        return "/project/main";
    }


    // 로그인 post
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(EmpVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {

        session.getAttribute("user");

        String id = vo.getEmpEmail();
        String pw = dao.getPw(id);
        log.info("암호화 비밀번호 :" + pw);

        String rawPw = vo.getEmpPw();
        log.info("입력된 비밀번호: " + rawPw);

        if (pwdEncoder.matches(rawPw, pw)) {
            log.info("비밀번호 일치");
            service.login(vo);
            session.setAttribute("email", id);
            session.setAttribute("name", vo.getEmpNm());
        } else {
            log.info("비밀번호 불일치");
            return "redirect:/";
        }

        return "/project/main";

    }

    // 로그아웃 post
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) throws Exception {
        session.invalidate();
        return "redirect:/";
    }

    // 회원정보 수정 get
    @RequestMapping(value = "/empEdit", method = RequestMethod.GET)
    public String registerUpdateView(HttpServletRequest request, HttpSession session) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        return "user/empEdit";
    }

    // 회원정보 수정  post
    @RequestMapping(value = "/empEdit", method = RequestMethod.POST)
    public String registerUpdate(EmpVO vo, Model model, HttpServletRequest request, HttpSession session) throws
            Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        service.empEdit(vo);
        model.addAttribute("empEdit", vo);
        return "/user/empEdit";
    }

    // 패스워드 체크
    @ResponseBody
    @RequestMapping(value = "/passChk", method = RequestMethod.POST)
    public boolean passChk(EmpVO vo, HttpSession session, HttpServletRequest request) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();

        }

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

    //사원 전체 정보 불러오기
    @RequestMapping(value = "/empShow", method = RequestMethod.GET)
    public String empShow(Model model) throws Exception {

        List<EmpVO> empVo = service.empShow();

        model.addAttribute("empList", empVo);

        return "/user/empShow";
    }

    // 사원 정보 삭제
    @RequestMapping(value = "/empDelete", method = RequestMethod.GET)
    public String delete(String no) throws Exception {

        service.deleteEmpAdmin(no);
        service.deleteEmp(no);
        return "redirect:/user/empShow";
    }

    // 사원 정보 선택삭제
    @RequestMapping(value = "/empDelete")
    public String checkDelete(HttpServletRequest request) throws Exception {

        String[] ajaxMsg = request.getParameterValues("valueArr");

        for (String s : ajaxMsg) {

            service.deleteEmpAdmin(s);
            service.deleteEmp(s);
        }
        return "redirect:/user/empShow";
    }

}
