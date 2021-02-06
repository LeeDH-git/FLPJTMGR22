package org.leedh.project.controller;

import lombok.extern.slf4j.Slf4j;
import org.leedh.project.service.PjtService;
import org.leedh.project.vo.PjtVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/project")
@Slf4j
public class PjtController {

    private final PjtService pjtService;

    @Autowired
    public PjtController(PjtService pjtService) {
        this.pjtService = pjtService;
    }

    // 프로젝트 홈 화면
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String main(HttpServletRequest request, HttpSession session) {

        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        return "/project/main";
    }

    // 프로젝트 등록 페이지
    @RequestMapping(value = "/pjtRegister", method = RequestMethod.GET)
    public String registerGET(HttpServletRequest request, HttpSession session) throws Exception {
        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();

            return "redirect:/";
        }
        return "/project/pjtRegister";
    }

    // 프로젝트 등록 처리
    @RequestMapping(value = "/pjtRegister", method = RequestMethod.POST)
    public String register(PjtVO pjtVO, RedirectAttributes rttr, HttpSession session, HttpServletRequest request) throws Exception {
        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        pjtService.register(pjtVO);
        rttr.addFlashAttribute("Message", "PJT register success");
        return "redirect:/main";
    }

    //프로젝트 조회(전체)
    @RequestMapping(value = "/pjtShow", method = RequestMethod.GET)
    public String pjt(HttpServletRequest request, HttpSession session, Model model) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        List<PjtVO> pjtVo = pjtService.pjtShow();
        model.addAttribute("pjtList", pjtVo);
        return "/project/pjtShow";
    }

    //프로젝트 수정
    @RequestMapping(value = "/pjtEdit", method = RequestMethod.GET)
    public String pjtEditGET(HttpServletRequest request, HttpSession session) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        return "/project/pjtEdit";
    }

    //프로젝트 수정
    @RequestMapping(value = "/pjtEdit", method = RequestMethod.POST)
    public String pjtEdit(PjtVO pjtVO, Model model, HttpServletRequest request, HttpSession session) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        pjtService.pjtEdit(pjtVO);
        model.addAttribute("pjtEdit", pjtVO);
        return "/project/pjtEdit";
    }

    // 프로젝트 삭제
    @RequestMapping(value = "/pjtDelete", method = RequestMethod.GET)
    public String delete(String no, HttpSession session, HttpServletRequest request) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        pjtService.deletePjt(no);
        pjtService.deletePjtCode(no);
        return "redirect:/project/pjtShow";
    }

    // 프로젝트 선택삭제
    @RequestMapping(value = "/pjtDelete")
    public String checkDelete(HttpServletRequest request, HttpSession session) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        String[] ajaxMsg = request.getParameterValues("valueArr");

        for (String s : ajaxMsg) {
            pjtService.deletePjt(s);
            pjtService.deletePjtCode(s);
        }
        return "redirect:/project/pjtShow";
    }

    //프로젝트 조회(전체)
    @RequestMapping(value = "/pjtUnion", method = RequestMethod.GET)
    public String pjtUnion(Model model, HttpSession session, HttpServletRequest request) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        List<PjtVO> pjtVo = pjtService.memberUnion();
        model.addAttribute("memberUnion", pjtVo);
        return "/project/pjtUnion";
    }

}
