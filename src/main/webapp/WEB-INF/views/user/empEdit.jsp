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
    <title>Focusleader Project Manager 직원정보</title>

</head>
<body class="bg-primary">
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header">
                                <h3 class="text-center font-weight-light my-2">직원정보</h3>
                            </div>

                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/user/empEdit" method="post">
                                    <div class=form-group">
                                        <label class="small mb-1" for="empNo">사원 번호 </label> <input
                                            class="form-control py-4" id="empNo" name="empNo" type="text" readonly/>
                                    </div>
                                    <!--    <div class="col-md-6"> -->
                                    <div class="form-group">
                                        <label class="small mb-1" for="empNm">이름</label> <input
                                            class="form-control py-4" id="empNm" name="empNm" type="text"/>
                                    </div>
                                    <div class="form-group">
                                        <lable class="small mb-1" for="empEmail">아이디
                                            (이메일)
                                        </lable>
                                        <input class="form-control py-4" id=empEmail name="empEmail" type="email"
                                               aria-describedby="emailHelp" readonly/>

                                    </div>

                                    <div class="form-group">
                                        <label class="small mb-1" for="empPhoneNo">휴대전화 번호</label>
                                        <input class="form-control py-4" id="empPhoneNo" name="empPhoneNo" type="text"/>
                                    </div>

                                    <div class="form-group">
                                        <label class="small mb-1" for="empEmerNo">비상연락처</label>
                                        <input class="form-control py-4"
                                               id="empEmerNo" name="empEmerNo" type="tel"/>
                                    </div>

                                    <div class="form-group">

                                        <label class="small mb-1" for="empJoinDate">입사일</label>
                                        <input class="form-control py" type='date' id='empJoinDate' name="empJoninDate"
                                               readonly/>
                                    </div>

                                    <div class="form-group">
                                        <label class="small mb-1" for="pjtPosC">직위</label>

                                        <select class="form-control py" id="pjtPosC" name="pjtPosC"
                                                style="width : 130px; text-align-last: center">
                                            <option value="A001">사원</option>
                                            <option value="A002">주임</option>
                                            <option value="A003">대리</option>
                                            <option value="A004">과장</option>
                                            <option value="A005">차장</option>
                                            <option value="A006">부장</option>
                                            <option value="A007">이사</option>
                                            <option value="A008">상무</option>
                                            <option value="A009">전무</option>
                                            <option value="A010">대표이사</option>
                                        </select>

                                    </div>
                                    <div class="form-group">
                                        <label class="small mb-1" for="pjtLvC">기술등급</label>
                                        <select class="form-control py" id="pjtLvC" name="pjtLvC"
                                                style="width: 130px; text-align-last: center">
                                            <option value="A01">초급</option>
                                            <option value="A02">중하</option>
                                            <option value="A12">중</option>
                                            <option value="A22">중상</option>
                                            <option value="A03">고급</option>
                                            <option value="A04">특급</option>
                                        </select>
                                    </div>
                                    <div style="text-align: center;">
                                        <button type="submit" class="btn btn-primary" onclick="window.close()">수정
                                        </button>
                                    </div>
                                </form>
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