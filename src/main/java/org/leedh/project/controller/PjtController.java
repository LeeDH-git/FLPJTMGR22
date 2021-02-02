package org.leedh.project.controller;

import org.leedh.project.service.PjtService; 
import org.leedh.project.vo.PjtVO;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/project")

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
        rttr.addFlashAttribute("Message","PJT register success");
       return "redirect:/project/pjtRegister";
    }

    /*// 프로젝트 관리 페이지
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(@ModelAttribute("loginDTO") LoginDTO loginDTO) throws Exception {
        return "/user/login";
    }*/

      //  model.addAttribute("PJT", pjtVO);
}
