var openWin;

function openChildJS()
{

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

function setChildText(empNoIndex){
    //  if(openWin!=null)
    openWin.document.getElementById("empNo").value = empNoIndex;
}