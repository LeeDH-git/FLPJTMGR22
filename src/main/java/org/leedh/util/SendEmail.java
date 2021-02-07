package org.leedh.util;

import org.apache.commons.mail.HtmlEmail;
import org.leedh.user.vo.EmpVO;

public class SendEmail {

    // 이메일 발송
    public void send_mail(EmpVO empVO, String div) throws Exception {

        // Mail Server 설정
        String charSet = "utf-8";
        String hostSMTP = "smtp.gmail.com";
        String hostSMTPid = "이메일 입력";
        String hostSMTPpwd = "비밀번호 입력";

        // 보내는 사람 EMail, 제목, 내용
        String fromEmail = "이메일 입력";
        String fromName = "Spring Homepage";
        String subject = "";
        String msg = "";

        if (div.equals("find_pw")) {
            subject = "Spring Homepage 임시 비밀번호 입니다.";
            msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
            msg += "<h3 style='color: blue;'>";
            msg += empVO.getEmpEmail() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
            msg += "<p>임시 비밀번호 : ";
            msg += empVO.getEmpPw() + "</p></div>";
        }
        // 받는 사람 E-Mail 주소
        String mail = empVO.getEmpEmail();

        try {
            HtmlEmail email = new HtmlEmail();
            email.setDebug(true);
            email.setCharset(charSet);
            email.setSSL(true);
            email.setHostName(hostSMTP);
            email.setSmtpPort(465);

            email.setAuthentication(hostSMTPid, hostSMTPpwd);
            email.setTLS(true);
            email.addTo(mail.trim(), charSet);
            email.setFrom(fromEmail, fromName, charSet);
            email.setSubject(subject);
            email.setHtmlMsg(msg);
            email.send();
        } catch (Exception e) {
            System.out.println("메일발송 실패 : " + e);
        }
    }
}
