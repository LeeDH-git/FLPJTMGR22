<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugin/js/backspace.js"></script>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/resources/plugin/plugin.jsp" %>

<html>
<head>
    <title>Focusleader Project Manager Login</title>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

</head>
<body class="bg-primary">
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">FocusLeader Project
                                Manager</h3></div>
                            <div class="card-body">
                                <form name="homeForm" action="${pageContext.request.contextPath}/user/login"
                                      method="post">

                                    <div class="form-group">
                                        <label class="small mb-1" for="empEmail">이메일</label>
                                        <input class="form-control py-4" id="empEmail" name="empEmail" type="email"
                                               placeholder="이메일을 입력하세요."/>
                                    </div>
                                    <div class="form-group">
                                        <label class="small mb-1" for="empPw">비밀번호</label>
                                        <input class="form-control py-4" id="empPw" name="empPw" type="password"
                                               placeholder="비밀번호를 입력하세요."/>
                                    </div>
                                    <div class="form-group">
                    					<span class="font-weight-bold text-white bg-dark"
                                              id="LoginCheck"></span>
                                    </div>
                                    <div class="row">
                                        <div class="col-8">

                                        </div>
                                        <!-- /.col -->
                                        <div class="col-8">
                                            <button id="loginBtn" type="submit" class="btn btn-primary">로그인</button>
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                        <a class="small" href="">비밀번호를 잊으셨나요?</a>
                                    </div>
                                </form>
                            </div>

                            <div class="card-footer text-center">
                                <div class="small"><a href="${pageContext.request.contextPath}/user/register">계정이 없으신가요?
                                    회원가입!</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    <div id="layoutAuthentication_footer">
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid">
                <div class="d-flex align-items-center justify-content-between small">

                    <div>
                        <a href="#">Privacy Policy</a>
                        &middot;
                        <a href="#">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

</body>
</html>
