var xhr;	
function getXhr(){
	if(window.XMLHttpRequest){
		xhr=new XMLHttpRequest();
	}
	else
		xhr=new ActiveXObject("Microsoft.HTTP");
}
function callback1(){
	if(xhr.status==200){
		if(xhr.readyState==4){
			var s=xhr.responseText;
			if(s=="0")
				callBack("√该ID可以注册","white","sp0");
			else
				callBack("×该ID已经注册过了！","red","sp0");
		}
	}

}

function checkUid(){
	var uid=document.getElementById("uid").value;
	var res;
	var color;
	if((uid=="")){
		res="×用户ID不能为空！";
		color="red";
		callBack(res,color,"sp0");
	}else{
		var uid=document.getElementById("uid").value;
		getXhr();
		xhr.open("GET", "check.action?uid="+uid+"&time="+new Date().getMilliseconds());
		xhr.onreadystatechange=callback1;
		xhr.send(null);
	}
}

function checkPsd(){
	var psd=document.getElementById("psd").value;
	//var psd=document.getElementById("psd1").value;
	var res;
	var color="red";
	if(psd==""){
		res="×密码不能为空！";
	//	color="red";
		callBack(res,color,"sp2");
	//	callBack("",color,"sp3");
	}
	else{
		callBack("",color,"sp2");
	}
//	else if(psd==psd1){
//		res="√两次密码输入一致！";
//		color="green";
//		callBack(res,color,"sp3");
//		callBack("",color,"sp2");
//	}
//	else{
//
//		res="×两次密码输入不一致！";
//		color="red";
//		callBack(res,color,"sp3");
//		callBack("",color,"sp2");
//	}
}

function checkPsd1(){
	var psd=document.getElementById("psd").value;
	var psd1=document.getElementById("psd1").value;
	var res;
	var color;
	if(psd1==""){
		res="×密码不能为空！";
		color="red";
	//	callBack(res,color,"sp2");
		callBack("",color,"sp3");
	}else{
		if(psd==psd1){
			res="√两次密码输入一致！";
			color="white";
			callBack(res,color,"sp3");
		//	callBack("",color,"sp2");
		}else{
			res="×两次密码输入不一致！";
			color="red";
			callBack(res,color,"sp3");
		//	callBack("",color,"sp2");
		}
	}
}

function checkUsername(){
	var username=document.getElementById("username").value;
	var res;
	var color;
	if((username=="")){
		res="×真实姓名不能为空！";
		color="red";
		callBack(res,color,"sp1");
	}else{
		callBack("",color,"sp1");
	}
}
function checkIdcard(){
	var idcard=document.getElementById("idcard").value;
	var res;
	var color;
	if((idcard=="")){
		res="×身份证号码不能为空！";
		color="red";
		callBack(res,color,"sp4");
	}else{
		callBack("",color,"sp4");
	}
}
function checkEmail(){
	var email=document.getElementById("email").value;
	var res;
	var color;
	if((email=="")){
		res="×email不能为空！";
		color="red";
		callBack(res,color,"sp5");
	}else{
		callBack("",color,"sp5");
	}
}
function checkPost(){
	var post=document.getElementById("post").value;
	var res;
	var color;
	if((post=="")){
		res="×邮政编码不能为空！";
		color="red";
		callBack(res,color,"sp6");
	}else{
		callBack("",color,"sp6");
	}
}
function checkAddr(){
	var addr=document.getElementById("addr").value;
	var res;
	var color;
	if((addr=="")){
		res="×地址不能为空！";
		color="red";
		callBack(res,color,"sp7");
	}else{
		callBack("",color,"sp7");
	}
}


function callBack(res,color,id){
	var rs=document.getElementById(id);
	var res1="<font color=\""+color+"\">"+res+"</font>";
	rs.innerHTML=res1;
}





