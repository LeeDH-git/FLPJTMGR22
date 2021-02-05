$(function(){
    var chkObj = document.getElementsByName("RowCheck");
    var rowCnt = chkObj.length;

    $("input[name='allCheck']").click(function(){
        var chk_listArr = $("input[name='RowCheck']");
        for (var i=0; i<chk_listArr.length; i++){
            chk_listArr[i].checked = this.checked;
        }
    });
    $("input[name='RowCheck']").click(function(){
        if($("input[name='RowCheck']:checked").length === rowCnt){
            $("input[name='allCheck']")[0].checked = true;
        }
        else{
            $("input[name='allCheck']")[0].checked = false;
        }
    });
});

function pjtDeleteValue(){
    var url = "pjtDelete";    // Controller로 보내고자 하는 URL
    var valueArr = [];
    var list = $("input[name='RowCheck']");
    for(var i = 0; i < list.length; i++){
        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
            valueArr.push(list[i].value);
        }
    }
    if (valueArr.length === 0){
        alert("선택된 프로젝트가 없습니다.");
    }
    else{
        var chk = confirm("정말 삭제하시겠습니까?");
        $.ajax({
            url : url,     // 전송 URL
            type : 'POST', // POST 방식
            traditional : true,
            data : {
                valueArr : valueArr  // 보내고자 하는 data 변수 설정
            },
            success: function(jdata){
                    alert("삭제 성공");
                    location.replace("pjtShow") //pjtShow 로 페이지 새로고침
            }
        });
    }
}


function empDeleteValue(){
    var url = "empDelete";    // Controller로 보내고자 하는 URL
    var valueArr = [];
    var list = $("input[name='RowCheck']");
    for(var i = 0; i < list.length; i++){
        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
            valueArr.push(list[i].value);
        }
    }
    if (valueArr.length === 0){
        alert("선택된 직원이 없습니다.");
    }
    else{
        var chk = confirm("정말 삭제하시겠습니까?");
        $.ajax({
            url : url,     // 전송 URL
            type : 'POST', // POST 방식
            traditional : true,
            data : {
                valueArr : valueArr  // 보내고자 하는 data 변수 설정
            },
            success: function(jdata){
                alert("삭제 성공");
                location.replace("empShow") //pjtShow 로 페이지 새로고침
            }
        });
    }
}

function openEmp() {

    var openWin;

    function openChild() {

        // window.name = "부모창 이름";
        window.name = "parentForm";
        // window.open("open할 window", "자식창 이름", "팝업창 옵션");

        //	if(openWin == null)
        //	{
        openWin = window.open("/user/empInfo",
            "childForm", "width=570, height=950");
        //	}


        window.resizeTo()
   }

    function setChildText(empNoIndex) {
        //  if(openWin!=null)
        openWin.document.getElementById("empNo").value = empNoIndex;
    }
}