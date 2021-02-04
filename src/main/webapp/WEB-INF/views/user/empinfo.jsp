<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Focusleader Project Manager 직원정보</title>
    <%@ include file="/resources/plugin/plugin.jsp" %>
    <!-- <%--<link href="css/styles.css" rel="stylesheet" /> --%> -->
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
            crossorigin="anonymous"></script>
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
                                <h3 class="text-center font-weight-light my-4">직원정보</h3>
                            </div>
                            <div class="card-body">
                                <form>
                                    <div class=form-group">
                                        <label class="small mb-1" for="empNo">사원 번호 </label> <input
                                            class="form-control py-4" id="empNo" name="empNo" type="text" value = "${empNo}"/>
                                    </div>
                                    <!--    <div class="col-md-6"> -->
                                    <div class="form-group">
                                        <label class="small mb-1" for="empNm">이름</label> <input
                                            class="form-control py-4" id="empNm" name="empNm" type="text" disabled/>
                                    </div>
                                    <div class="form-group">
                                        <lable class="small mb-1" for="empEmail">아이디
                                            (이메일)</lable>
                                        <input class="form-control py-4" id=empEmail name="empEmail"
                                        " type="email" disabled aria-describedby="emailHelp"/>

                                    </div>

                                    <div class="form-group">
                                        <label class="small mb-1" for="empPhoneNo">휴대전화 번호</label>
                                        <input class="form-control py-4" id="empPhoneNo" name="empPhoneNo"type="text" disabled/>
                                    </div>

                                    <div class="form-group">
                                        <label class="small mb-1" for="empEmerNo">비상연락처</label>
                                        <input class="form-control py-4"
                                               id="empEmerNo" name = "empEmerNo" type="tel" disabled/>
                                    </div>

                                    <div class="form-group">

                                        <label class="small mb-1" for="empJoinDate">입사일</label>
                                        <input class= "form-control py" type='date' id='empJoinDate' name="empJoninDate" disabled/>
                                        <!-- <input class="form-control py-4" id="inputJoinDate" type="text" placeholder="입사일 입력" /> -->



                                    </div>

                                    <div class = "form-group">
                                        <label class="small mb-1" for="pjtPosC">직위</label>

                                        <select class= "form-control py" id ="pjtPosC" name="pjtPosC"
                                                style="width : 130px; text-align-last: center" disabled>
                                            <option value="A001">사원</option> <option value = "A002">주임</option> <option value="A003">대리</option>
                                            <option value="A004">과장</option> <option value = "A005">차장</option> <option value="A006">부장</option>
                                            <option value="A007">이사</option> <option value = "A008">상무</option> <option value="A009">전무</option>
                                            <option value="A010">대표이사</option>
                                        </select>

                                    </div>
                                    <!-- <input class="form-control py-4" id="inputPosition" type="text"
                                       placeholder="직위 입력" />-->

                                    <!--  <div class="form-group">-->
                                    <div class = "form-group">
                                        <label class="small mb-1" for="pjtLvC">기술등급</label>
                                        <select class="form-control py" id="pjtLvC" name="pjtLvC"
                                                style="width: 130px; text-align-last: center" disabled>
                                            <option value="A01">초급</option> <option value="A02">중하</option> <option value="A12">중</option>
                                            <option value="A22">중상</option> <option value="A03">고급</option> <option value="A04">특급</option>
                                        </select>
                                    </div>
                                </form>
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
                <div
                        class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2020</div>
                    <div>
                        <a href="#">Privacy Policy</a> &middot; <a href="#">Terms
                        &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<!--  <script src="${pageContext.request.contextPath}/resources/dist/js/scripts.js"></script>-->
<!--  <script>
    document.getElementById('inputJoinDate').value = new Date().toISOString().substring(0, 10);;
    document.getElementById('inputJoinDate').min = new Date().toISOString().substring(0, 10);;
</script>
<script>
    document.getElementById("pjtLvC").value = "${emp.pjtPosC}";
    document.getElementById("pjtPosC").value = "${emp.pjtLvC}";
</script>
-->
</body>
</html>