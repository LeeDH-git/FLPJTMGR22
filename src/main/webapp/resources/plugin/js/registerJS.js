$(document).ready(function () {

    $("#submit").on("click", function () {
        if ($("#empEmail").val() === "") {
            alert("이메일을 입력해주세요.");
            $("#empEmail").focus();
            return false;
        }
        if ($("#empPw").val() === "") {
            alert("비밀번호를 입력해주세요.");
            $("#empPw").focus();
            return false;
        }
        if ($("#empNm").val() === "") {
            alert("성명을 입력해주세요.");
            $("#empNm").focus();
            return false;
        }
        var idChkVal = $("#idChk").val();
        if (idChkVal === "N") {
            alert("중복확인 버튼을 눌러주세요.");
        } else if (idChkVal === "Y") {
            $("#regForm").submit();
        }
    });
})

function fn_idChk() {
    $.ajax({
        url: "/user/idChk",
        type: "post",
        dataType: "json",
        data: {"empEmail": $("#empEmail").val()},
        success: function (data) {
            if (data === 1) {
                alert("중복된 이메일 입니다.");
            } else if ($("#empEmail").val() === '') {
                alert("이메일을 입력해주세요.");
            } else if (data === 0) {
                $("#idChk").attr("value", "Y");
                alert("사용가능한 이메일 입니다.");
            }
        }
    })
}