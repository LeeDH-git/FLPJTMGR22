<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 <link href="${pageContext.request.contextPath}/resources/dist/css/styles.css" rel="stylesheet" /> 
<!-- <%--<link href="css/styles.css" rel="stylesheet" /> --%> -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body>
<form action = "${pageContext.request.contextPath}/user/empShow" method="get">
<div class="row">
	<table class="table table-hover table-striped">
		<thead>
		<tr>
		  	<td>사번</td>
			<td>이름</td>
			<td>이메일</td>
			<td>핸드폰 번호</td>
			<td>비상 연락처</td>
			<td>입사일</td>
			<td>기술 등급</td>
			<td>직위</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${empList}" varStatus="vs">
		<tr>
		<td><c:out value="${item.empNo}"/></td>
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
</div>	
</form>	
</body>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/dist/js/scripts.js"></script>
	
</html>