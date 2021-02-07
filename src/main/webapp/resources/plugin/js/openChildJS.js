function empOpenChild(empNo, empNm, empEmail, empPhoneNo, empEmerNo, empJoinDate, pjtPosC, pjtLvC) {

    // window.name = "부모창 이름";
    window.name = "empParentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");

    empOpenWin = window.open("/user/empEdit",
        "childForm", "width=570, height=950");

    // 일정시간 지연 후 값 넣기
    setTimeout(function () {
        empSetChildText(empNo, empNm, empEmail, empPhoneNo, empEmerNo, empJoinDate, pjtPosC, pjtLvC);
    }, 350)
}

function empSetChildText(empNo, empNm, empEmail, empPhoneNo, empEmerNo, empJoinDate, pjtPosC, pjtLvC) {

    if (empOpenWin != null) {
        empOpenWin.document.getElementById("empNo").value = empNo;
        empOpenWin.document.getElementById("empNm").value = empNm;
        empOpenWin.document.getElementById("empEmail").value = empEmail;
        empOpenWin.document.getElementById("empPhoneNo").value = empPhoneNo;
        empOpenWin.document.getElementById("empEmerNo").value = empEmerNo;
        empOpenWin.document.getElementById("empJoinDate").value = empJoinDate;
        empOpenWin.document.getElementById("pjtPosC").value = pjtPosC;
        empOpenWin.document.getElementById("pjtLvC").value = pjtLvC;

    }

}


var pjtOpenWin;

function pjtOpenChild(pjtC, pjtClient, pjtNm, pjtEmpList,
                      pjtPm, pjtStartDate, pjtEndDate, pjtEndYn, pjtStC, pjtDivC, pjtOrgC) {

    // window.name = "부모창 이름";
    window.name = "pjtParentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");

    pjtOpenWin = window.open("/project/pjtEdit",
        "childForm", "width=570, height=950");

    // 일정시간 지연 후 값 넣기
    setTimeout(function () {
        pjtSetChildText(pjtC, pjtClient, pjtNm, pjtEmpList,
            pjtPm, pjtStartDate, pjtEndDate, pjtEndYn, pjtStC, pjtDivC, pjtOrgC);
    }, 350)
}

function pjtSetChildText(pjtC, pjtClient, pjtNm, pjtEmpList,
                         pjtPm, pjtStartDate, pjtEndDate, pjtEndYn, pjtStC, pjtDivC, pjtOrgC) {

    if (pjtOpenWin != null) {
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

}

var editColumn;
function lVPosEdit() {
    var posc = '<c:out value="${empList.pjtPosC }"/>';

}
