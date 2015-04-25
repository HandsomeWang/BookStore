var xhr;	
var tsumprice;
var tallprice;
var tsum;
var tprice;
var tsumprice_node;
var tallprice_node;
var ctr;
function getXhr(){
	if(window.XMLHttpRequest){
		xhr=new XMLHttpRequest();
	}
	else
		xhr=new ActiveXObject("Microsoft.HTTP");
}

function callback(){
	if(xhr.status==200){
		if(xhr.readyState==4){
			var s=xhr.responseText;
			if(s=="1"){
				var sumprice=ctr.lastChild.previousSibling.innerHTML;//小计
		//		alert(sumprice);
				var allprice_node=document.getElementById("allprice");//总计节点
			//	alert(allprice_node);
				var allprice=allprice_node.innerHTML;//总计
			//	alert(allprice);
				allprice_node.innerHTML=allprice-sumprice;//更新总计
				ctr.parentNode.removeChild(ctr);
			}
			else{
				alert("删除失败！");
			}
			
		}
	}
}

window.onload=function(){
	
	var dels=document.getElementsByName("del");
	
	for(var i=0;i<dels.length;i++){
		dels[i].onclick=del_book;
	}
	
};

function del_book(){
	if(confirm("确定删除这件商品吗？")){
	
	var tr=this.parentNode.parentNode;
	ctr=tr;
	var bid=tr.firstChild.innerHTML;
	getXhr();
	xhr.open("GET","deletebook.action?bid="+bid+"&time="+new Date().getMilliseconds());
	xhr.onreadystatechange=callback;
	xhr.send(null);
	
	return false;
	}
}







