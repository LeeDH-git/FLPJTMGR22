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
function deleteValue(){
    var url = "delete";    // Controller로 보내고자 하는 URL
    var valueArr = [];
    var list = $("input[name='RowCheck']");
    for(var i = 0; i < list.length; i++){
        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
            valueArr.push(list[i].value);
        }
    }
    if (valueArr.length === 0){
        alert("선택된 글이 없습니다.");
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
                if(jdata === 1) {
                    alert("삭제 성공");
                    location.replace("pjtShow") //pjtShow 로 페이지 새로고침
                }
                else{
                    alert("삭제 실패");
                }
            }
        });
    }
}