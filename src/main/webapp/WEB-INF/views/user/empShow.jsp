<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Focusleader Project Manager</title>
    <%@ include file="/resources/plugin/plugin.jsp" %>
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
                
                <div class="card-header">
			    	직원정보 수정을 원하시면 원하는 직원을 클릭해주세요
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
                            <c:forEach var="item" items="${empList}" varStatus="vs">
                                <tr onClick="openChild(${item.empNo},'${item.empNm}','${item.empEmail}',
                                '${item.empPhoneNo }','${item.empEmerNo}','${item.empJoinDate}',
                                '${item.pjtPosC}','${item.pjtLvC}');"
                                onmouseover="this.style.backgroundColor='#9FB6FF'" 
                                onmouseout="this.style.backgroundColor=''" style="cursor:pointer">
                                    <td class="checkbox"><input name="RowCheck" type="checkbox" value="${item.no}"/></td>
                                    <td onClick="setChildText(${item.empNo})"><c:out value="${item.empNo}"/></td>
                                    <td><c:out value="${item.empNm}"/></td>
                                    <td><c:out value="${item.empEmail}"/></td>
                                    <td><c:out value="${item.empPhoneNo}"/></td>
                                    <td><c:out value="${item.empEmerNo}"/></td>
                                    <td><c:out value="${item.empJoinDate }"/></td>
                                    <td><c:out value="${item.pjtPosC }"/></td>
                                    <td><c:out value="${item.pjtLvC }"/></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div>
                            <input type="button" value="선택삭제" class="btn btn-primary" onclick="empDeleteValue()">
                        </div>
                    </div>
                </div>
            </div>
        </main>


        <!-- 하단 사이드 메뉴 부분 -->
        <c:import url="/WEB-INF/views/include/bottom.jsp"/>

    </div>
</div>
<script>

	var openWin;
	
	function openChild(empNo,empNm,empEmail,empPhoneNo,empEmerNo,empJoinDate,pjtLvC,pjtPosC)
	{
		// window.name = "부모창 이름"; 
		window.name = "parentForm";
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		

			openWin = window.open("/user/empEdit",
			"childForm", "width=570, height=350");
		
		// 일정시간 지연 후 값 넣기
		setTimeout(function(){
			setChildText(empNo,empNm,empEmail,empPhoneNo,empEmerNo,empJoinDate,pjtLvC,pjtPosC);
		},350)
	}

	function setChildText(empNo,empNm,empEmail,empPhoneNo,empEmerNo,empJoinDate,pjtLvC,pjtPosC){
		  if(openWin!=null)
		  {
			openWin.document.getElementById("empNo").value = empNo;
			openWin.document.getElementById("empNm").value = empNm;
			openWin.document.getElementById("empEmail").value = empEmail;
			openWin.document.getElementById("empPhoneNo").value = empPhoneNo;
			openWin.document.getElementById("empEmerNo").value = empEmerNo;
			openWin.document.getElementById("empJoinDate").value = empJoinDate;
			openWin.document.getElementById("pjtLvC").value = pjtLvC;
			openWin.document.getElementById("pjtPosC").value = pjtPosC;
		  }
		}
</script>
</body>
</html>
