//package org.leedh.user.interceptor;
//
//import org.leedh.user.vo.EmpVO;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//public class LoginInterceptor extends HandlerInterceptorAdapter {
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//
//        HttpSession session = request.getSession(false);
//
//        if (session == null) {
//            response.sendRedirect(request.getContextPath() + "/main");
//            return false;
//        }
//
//        EmpVO empVO = (EmpVO) session.getAttribute("user");
//
//        if (empVO == null) {
//            response.sendRedirect(request.getContextPath() + "/main");
//            return false;
//        }
//
//        return true;
//    }
//}
