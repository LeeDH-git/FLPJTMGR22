package org.leedh.project.controller;

import com.sun.media.jfxmedia.logging.Logger;
import lombok.extern.slf4j.Slf4j;
import org.leedh.project.service.PjtService;
import org.leedh.project.vo.PjtVO;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.util.Arrays;
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

    // 프로젝트 등록 페이지
    @RequestMapping(value = "/pjtRegister", method = RequestMethod.GET)
    public String registerGET() throws Exception {
        return "/project/pjtRegister";
    }

    // 프로젝트 등록 처리
    @RequestMapping(value = "/pjtRegister", method = RequestMethod.POST)
    public String register(PjtVO pjtVO, RedirectAttributes rttr) throws Exception {
        pjtService.register(pjtVO);
        rttr.addFlashAttribute("Message", "PJT register success");
        return "redirect:/main";
    }

    //프로젝트 조회(전체)
    @RequestMapping(value = "/pjtShow", method = RequestMethod.GET)
    public String pjt(Model model) throws Exception {

        List<PjtVO> pjtVo = pjtService.pjtShow();
        model.addAttribute("pjtList", pjtVo);
        return "/project/pjtShow";
    }
    /*// 프로젝트 관리 페이지
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(@ModelAttribute("loginDTO") LoginDTO loginDTO) throws Exception {
        return "/user/login";
    }*/

    //  model.addAttribute("PJT", pjtVO);


//    @RequestMapping(value="/delete", method=RequestMethod.POST)
//    public String delete(@RequestParam("delList") Integer[] delList) {
//
//        for (Integer no : delList) {
//            log.debug(Arrays.toString(delList));
//            pjtService.deletePjt(no);
//            pjtService.deletePjtCode(no);
//        }
//        return "redirect:/project/pjtShow";
//    }


    // 프로젝트 삭제
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(String no) throws Exception {
        pjtService.deletePjt(no);
        pjtService.deletePjtCode(no);
        return "redirect:/project/pjtShow";
    }

    // 프로젝트 선택삭제
    @RequestMapping(value = "/delete")
    public String checkDelete(HttpServletRequest request) throws Exception {

        String[] ajaxMsg = request.getParameterValues("valueArr");

        for (String s : ajaxMsg) {
            pjtService.deletePjt(s);
            pjtService.deletePjtCode(s);
        }
        return "redirect:/project/pjtShow";
    }

}
