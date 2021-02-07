<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<%@ include file="/resources/plugin/plugin.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Focusleader Project Manager</title>
</head>
<body class="sb-nav-fixed">

<!-- 상단 메뉴 부분 -->
<c:import url="/WEB-INF/views/include/top.jsp"/>

<div id="layoutSidenav">

    <!-- 사이드 메뉴 부분 -->
    <c:import url="/WEB-INF/views/include/side.jsp"/>

    <div id="layoutSidenav_content">

        <main>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table mr-1"></i>
                    직원정보
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <td><b><input id="allCheck" type="checkbox" name="allCheck"/></b></td>
                                <td><b>사번</b></td>
                                <td><b>이름</b></td>
                                <td><b>이메일</b></td>
                                <td><b>핸드폰 번호</b></td>
                                <td><b>비상 연락처</b></td>
                                <td><b>입사일</b></td>
                                <td><b>기술 등급</b></td>
                                <td><b>직위</b></td>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="empList" items="${empList}" varStatus="vs">
                                <tr onclick="empOpenChild('${empList.empNm}',
                                        '${empList.empEmail}',
                                        '${empList.empPhoneNo}',
                                        '${empList.empEmerNo}',
                                        '${empList.empJoinDate}',
                                        '${empList.pjtPosC}',
                                        '${empList.pjtLvC}');"
                                    onmouseover="this.style.backgroundColor='#9FB6FF'"
                                    onmouseout="this.style.backgroundColor=''"
                                    style="cursor:pointer">

                                    <td class="checkbox" onclick="event.cancelBubble=true;">
                                        <input class="" name="RowCheck" type="checkbox" value="${empList.no}"/>
                                    </td>
                                    <td><c:out value="${empList.empNo}"/></td>
                                    <td><c:out value="${empList.empNm}"/></td>
                                    <td><c:out value="${empList.empEmail}"/></td>
                                    <td><c:out value="${empList.empPhoneNo}"/></td>
                                    <td><c:out value="${empList.empEmerNo}"/></td>
                                    <td><c:out value="${empList.empJoinDate }"/></td>
                                    <td><c:out value="${empList.pjtPosC }"/></td>
                                    <td><c:out value="${empList.pjtLvC }"/></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div>
                            <p>직원 정보 수정 시 테이블을 클릭해주세요</p>
                            <input type="button" value="삭제" class="btn btn-primary" onclick="empDeleteValue()">
                        </div>
                    </div>
                </div>
            </div>
        </main>


        <!-- 하단 사이드 메뉴 부분 -->
        <c:import url="/WEB-INF/views/include/bottom.jsp"/>

    </div>
</div>

</body>
</html>
