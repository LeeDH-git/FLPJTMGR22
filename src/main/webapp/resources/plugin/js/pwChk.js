$(function(){
    $("#findBtn").click(function(){
        $.ajax({
            url : "/user/findPw",
            type : "POST",
            data : {
                empEmail : $("#empEmail").val(),
                // email : $("#email").val()
            },
            success : function(result) {
                alert(result);
            },
        })
    });
})