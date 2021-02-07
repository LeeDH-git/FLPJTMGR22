<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/resources/plugin/plugin.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugin/js/backspace.js"></script>
<%@ include file="/resources/plugin/plugin.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Focusleader Project Manager 비밀번호 찾기</title>
</head>
<body class="bg-primary">
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">비밀번호 찾기</h3></div>
                            <div class="card-body">
                                <div class="small mb-3 text-muted">이메일 주소를 입력하면 임시번호를 보내드립니다.</div>
                                <form>
                                    <div class="form-group">
                                        <label class="small mb-1" for="empEmail">Email</label>
                                        <input class="form-control py-4" id="empEmail" type="email"
                                               aria-describedby="emailHelp" placeholder="이메일 주소를 입력해주세요."/>
                                    </div>
                                    <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                        <a class="btn btn-primary" id="findBtn" href="${pageContext.request.contextPath}/">비밀번호 재설정</a>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer text-center">
                                <div class="small"><a href="${pageContext.request.contextPath}/user/register">계정이 없으신가요? 회원가입!</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

</div>
</body>
</html>