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
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header">
                                <h3 class="text-center font-weight-light my-4">프로젝트 수정</h3>
                            </div>
                            <div class="card-body">
                               	<form action="${pageContext.request.contextPath}/project/pjtEdit" method="post">
                                    <div class=form-group">
                                        <label class="small mb-1" for="pjtC">프로젝트 코드</label> <input
                                            class="form-control py-4" id="pjtC" name="pjtC" type="text" readonly
                                            />
                                    </div>
                                    <div class="form-group">
                                        <label class="small mb-1" for="pjtClient">고객명</label> <input
                                            class="form-control py-4" id="pjtClient" name="pjtClient" type="text"
                                            />
                                    </div>
                                    
                                    
                                     <div class=form-group">
                                        <label class="small mb-1" for="pjtNm">프로젝트 명</label> <input
                                            class="form-control py-4" id="pjtNm" name="pjtNm" type="text"
                                            />
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="small mb-1" for="pjtEmpList">프로젝트 투입인원</label>
                                        <input class="form-control py-4" id="pjtEmpList" name="pjtEmpList" type="text"
                                               />
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="small mb-1" for="pjtPm">PM</label> <input
                                            class="form-control py-4" id="pjtPm" name="pjtPm" type="text"
                                            />
                                    </div>
                                    
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="small mb-1" for="pjtStartDate">프로젝트 시작일</label>
                                                <input class="form-control py" type='date' id='pjtStartDate' name='pjtStartDate'
                                                       name="pjtStartDate">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <lable class="small mb-1" for="pjtEndDate">프로젝트 종료일</lable>
                                                <input class="form-control py" type='date' id='pjtEndDate' name='pjtEndDate'
                                                       name="pjtEndDate">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="small mb-1" for="pjtEndYn">프로젝트 종료여부</label>
                                        <select class="form-control py" id="pjtEndYn" name="pjtEndYn">
                                            <option value="none">=== 선택 ===</option>
                                            <option value="0">Y</option>
                                            <option value="1">N</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="small mb-1" for="pjtStC">프로젝트 상태분류</label>
                                        <select class="form-control py" id="pjtStC" name="pjtStC"
                                                style="width:130px;text-align-last:center">
                                            <option value="none">=== 선택 ===</option>
                                            <option value="B00">시작예정</option>
                                            <option value="B01">기획</option>
                                            <option value="B02">개발</option>
                                            <option value="B03">테스트</option>
                                        </select>
                                    </div>
                                    <!--    <div class="col-md-6"> -->






                                    <!--  <div class="form-group">
                                        <label class="small mb-1" for="pjtOrgC">기관명</label>
                                        <select class="form-control py" id="pjtOrgC" name="pjtOrgC"
                                                style="width:130px;text-align-last:center">
                                            <option value="none">=== 선택 ===</option>
                                            <option value="001">한국은행</option>
                                            <option value="002">산업은행</option>
                                            <option value="003">기업은행</option>
                                            <option value="004">KB국민은행</option>
                                            <option value="005">수협은행</option>
                                        </select>
                                    </div>-->
                                    <!--     <div class="form-group">
                                           <lable class="small mb-1" for="pjtOrgDiv">기관종류</lable>
                                           <input class="form-control py-4" id=pjtOrgDiv
                                           " type="text"
                                           placeholder="기관 종류 입력" />
                                       </div> -->

                                 <!--     <div class="form-group">
                                        <label class="small mb-1" for="pjtDivC">프로젝트 업무분류</label>
                                        <select class="form-control py" id="pjtDivC" name="pjtDivC"
                                                style="width:130px;text-align-last:center">
                                            <option value="none">=== 선택 ===</option>
                                            <option value="A01">ECM</option>
                                            <option value="A02">OCR</option>
                                        </select>
                                    </div> -->



                                    <!-- <input class="form-control py-4" id="inputSkillLevel" type="text" placeholder="ê¸°ì ë±ê¸ ìë ¥"/> -->
                                    <!--  </div> -->
                                    <div style="text-align: center;">
                                        <button type="submit" class="btn btn-primary" id="pjtEdit">수정</button>
                                    </div>

                                </form>
                            </div>
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
  <!--  document.getElementById('pjtStC').value = "${pjtEdit.pjtStC}";
    document.getElementById('pjtStartDate').value = "${pjtEdit.pjtStartDate}";    
    document.getElementById('pjtEndDate').value = "${pjtEdit.pjtEndDate}";-->    
</script>


</body>
</html>