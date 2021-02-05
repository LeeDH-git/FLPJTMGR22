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
                               <tr onClick="pjtOpenChild('${pjtList.pjtC}','${pjtList.pjtClient}','${pjtList.pjtNm}','${pjtList.pjtEmpList}',
                               		'${pjtList.pjtPm}','${pjtList.pjtStartDate}','${pjtList.pjtEndDate}','${pjtList.pjtEndYn}','${pjtList.pjtStC}','${pjtList.pjtDivC}','${pjtList.pjtOrgC}');"
                               		onmouseover="this.style.backgroundColor='#9FB6FF'" onmouseout="this.style.backgroundColor=''"
                               		style="cursor:pointer">
                                    <td class="checkbox"><input name="RowCheck" type="checkbox" value="${pjtList.no}"/></td>
                                    <td><c:out value="${pjtList.pjtC}"/></td>
                                    <td><c:out value="${pjtList.pjtStC}"/></td>
                                    <td><c:out value="${pjtList.pjtDivC}"/></td>
                                    <td><c:out value="${pjtList.pjtOrgC}"/></td>
                                    <td><c:out value="${pjtList.pjtClient}"/></td>
                                    <td><c:out value="${pjtList.pjtNm }"/></td>
                                    <td><c:out value="${pjtList.pjtEmpList}"/></td>
                                    <td><c:out value="${pjtList.pjtPm}"/></td>
                                    <td><c:out value="${pjtList.pjtStartDate}"/></td>
                                    <td><c:out value="${pjtList.pjtEndDate}"/></td>
                                    <td><c:out value="${pjtList.pjtEndYn}"/></td>

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div>
                            <input type="button" value="선택삭제" class="btn btn-primary" onclick="pjtDeleteValue()">
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
	    
		var pjtOpenWin;
		
		function pjtOpenChild(pjtC,pjtClient,pjtNm,pjtEmpList,
				pjtPm,pjtStartDate,pjtEndDate,pjtEndYn,pjtStC,pjtDivC,pjtOrgC)
		{
			// window.name = "부모창 이름"; 
			window.name = "pjtParentForm";
			// window.open("open할 window", "자식창 이름", "팝업창 옵션");
			

				pjtOpenWin = window.open("/project/pjtEdit",
				"pjtChildForm", "width=570, height=350");
			
			// 일정시간 지연 후 값 넣기
			setTimeout(function(){
				pjtSetChildText(pjtC,pjtClient,pjtNm,pjtEmpList,
						pjtPm,pjtStartDate,pjtEndDate,pjtEndYn,pjtStC,pjtDivC,pjtOrgC);
			},350)
		}
		
		function pjtSetChildText(pjtC,pjtClient,pjtNm,pjtEmpList,
				pjtPm,pjtStartDate,pjtEndDate,pjtEndYn,pjtStC,pjtDivC,pjtOrgC){
			  if(pjtOpenWin!=null)
				pjtOpenWin.document.getElementById("pjtC").value = pjtC;
			  	pjtOpenWin.document.getElementById("pjtClient").value = pjtClient;
			  	pjtOpenWin.document.getElementById("pjtNm").value = pjtNm;
			  	pjtOpenWin.document.getElementById("pjtEmpList").value = pjtEmpList;
			  	pjtOpenWin.document.getElementById("pjtPm").value = pjtPm;
			  	pjtOpenWin.document.getElementById("pjtStartDate").value = pjtStartDate;
			  	pjtOpenWin.document.getElementById("pjtEndDate").value = pjtEndDate;
			  	pjtOpenWin.document.getElementById("pjtEndYn").value = pjtEndYn;
			  	pjtOpenWin.document.getElementById("pjtStC").value = pjtStC;
			  	pjtOpenWin.document.getElementById("pjtDivC").value = pjtDivC;
			  	pjtOpenWin.document.getElementById("pjtOrgC").value = pjtOrgC;
			}
	</script>
	
</body>
</html>