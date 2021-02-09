var empOpenWin;

function empOpenChild(empNo, empNm, empEmail, empPhoneNo, empEmerNo, empJoinDate, pjtPosC, pjtLvC) {

    // window.name = "부모창 이름";
    window.name = "empParentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	
	if(empOpenWin != null)
		empOpenWin = null;
	
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




var editColumn;
function lVPosEdit() {
    var posc = '<c:out value="${empList.pjtPosC }"/>';

}
