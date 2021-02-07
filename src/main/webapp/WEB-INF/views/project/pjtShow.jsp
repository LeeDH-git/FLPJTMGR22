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
                    프로젝트 정보
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <td><b><input id="allCheck" type="checkbox" name="allCheck"/></b></td>
                                <td><b>프로젝트 코드</b></td>
                                <td><b>상태분류</b></td>
                                <td><b>프로젝트 분류</b></td>
                                <td><b>기관코드</b>
                                <td><b>고객명</b></td>
                                <td><b>프로젝트 명</b></td>
                                <td><b>투입인원</b></td>
                                <td><b>관리자명</b></td>
                                <td><b>시작일</b></td>
                                <td><b>종료일</b></td>
                                <td><b>종료여부</b></td>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="pjtList" items="${pjtList}" varStatus="vs">
                                <tr onclick="pjtOpenChild('${pjtList.pjtC}',
                                        '${pjtList.pjtClient}',
                                        '${pjtList.pjtStC}',
                                        '${pjtList.pjtDivC}',
                                        '${pjtList.pjtOrgC}',
                                        '${pjtList.pjtClient}',
                                        '${pjtList.pjtNm}',
                                        '${pjtList.pjtEmpList}',
                                        '${pjtList.pjtPm}',
                                        '${pjtList.pjtStartDate}',
                                        '${pjtList.pjtEndDate}',
                                        '${pjtList.pjtEndYn}');"
                                    onmouseover="this.style.backgroundColor='#9FB6FF'"
                                    onmouseout="this.style.backgroundColor=''"
                                    style="cursor:pointer">
                                    <td class="checkbox" onclick="event.cancelBubble=true;">
                                        <input name="RowCheck" type="checkbox" value="${pjtList.no}"/>
                                    </td>
                                    <td><c:out value="${pjtList.pjtC}"/></td>
                                    <c:choose>
                                        <c:when test="${pjtList.pjtStC  == 'B00'}">
                                            <td>시작예정</td>
                                        </c:when>
                                        <c:when test="${pjtList.pjtStC  == 'B01'}">
                                            <td>기획</td>
                                        </c:when>
                                        <c:when test="${pjtList.pjtStC  == 'B02'}">
                                            <td>개발</td>
                                        </c:when>
                                        <c:when test="${pjtList.pjtStC  == 'B03'}">
                                            <td>테스트</td>
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${pjtList.pjtDivC  == 'A01'}">
                                            <td>ECM</td>
                                        </c:when>
                                        <c:when test="${pjtList.pjtDivC  == 'A02'}">
                                            <td>OCR</td>
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${pjtList.pjtOrgC  == '001'}">
                                            <td>한국은행</td>
                                        </c:when>
                                        <c:when test="${pjtList.pjtOrgC  == '002'}">
                                            <td>산업은행</td>
                                        </c:when>
                                        <c:when test="${pjtList.pjtOrgC  == '003'}">
                                            <td>기업은행</td>
                                        </c:when>
                                        <c:when test="${pjtList.pjtOrgC  == '004'}">
                                            <td>KB국민은행</td>
                                        </c:when>
                                        <c:when test="${pjtList.pjtOrgC  == '005'}">
                                            <td>수협은행</td>
                                        </c:when>
                                    </c:choose>
                                    <td><c:out value="${pjtList.pjtClient}"/></td>
                                    <td><c:out value="${pjtList.pjtNm }"/></td>
                                    <td><c:out value="${pjtList.pjtEmpList }"/></td>
                                    <td><c:out value="${pjtList.pjtPm }"/></td>
                                    <td><c:out value="${pjtList.pjtStartDate }"/></td>
                                    <td><c:out value="${pjtList.pjtEndDate }"/></td>
                                    <c:choose>
                                        <c:when test="${pjtList.pjtEndYn  == '0'}">
                                            <td>종료</td>
                                        </c:when>
                                        <c:when test="${pjtList.pjtEndYn  == '1'}">
                                            <td>진행중</td>
                                        </c:when>
                                    </c:choose>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div>
                            <p>프로젝트 정보 수정 시 테이블을 클릭해주세요</p>
                            <input type="button" value="삭제" class="btn btn-primary" onclick="pjtDeleteValue()">
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