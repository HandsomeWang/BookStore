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
				var num1 = new Number(tsum*tprice);
				tsumprice_node.innerHTML=num1.toFixed(2);//更新小计
				var num2 = new Number(tallprice-tsumprice+num1);
				tallprice_node.innerHTML=num2.toFixed(2);//更新总计
				
			}
			else{
				
				location.href="mycart.action";
				alert("更改失败！");
			}
		}
	}

}

function callback1(){
	if(xhr.status==200){
		if(xhr.readyState==4){
			var s=xhr.responseText;
			if(s=="1"){
				var sumprice=ctr.lastChild.previousSibling.innerHTML;//小计
				var allprice_node=document.getElementById("allprice");//总计节点
				var allprice=allprice_node.innerHTML;//总计
				allprice_node.innerHTML=(allprice-sumprice).toFixed(2);//更新总计
			//	alert(ctr.parentNode.childNodes.length);
				if(ctr.parentNode.childNodes.length==2)
					location.href="mycart.action";
				else
				ctr.parentNode.removeChild(ctr);
//				if(ctr.parentNode.hasChildNodes()){
//					location.href="mycart.action";
//				}
			}
			else{
				alert("删除失败！");
			}
			
		}
	}
}

window.onload=function(){
	var sum=document.getElementsByName("sum");
	
	for(var i=0;i<sum.length;i++){
		sum[i].onblur=checksum;
	}
	
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
	xhr.open("GET","deleteitem.action?bid="+bid+"&time="+new Date().getMilliseconds());
	xhr.onreadystatechange=callback1;
	xhr.send(null);
	
	return false;
	}
	else{
		location.href="mycart.action";
		return false;}
}


function checksum(){
	
	var sum_node=this;//数量节点
	var sum=sum_node.value;//数量
	var reg=/^[0-9]*$/;
	if(!reg.test(sum)){
		location.href="mycart.action";
	}
	
	else if(sum==0){
		if(confirm("输入数量为“0”，确定要删除吗？")){
			var tr=this.parentNode.parentNode;
			ctr=tr;
			var bid=tr.firstChild.innerHTML;
			getXhr();
			xhr.open("GET","deleteitem.action?bid="+bid+"&time="+new Date().getMilliseconds());
			xhr.onreadystatechange=callback1;
			xhr.send(null);
		}
		else
			location.href="mycart.action";
	}
	else if(sum<0)
		location.href="mycart.action";
	else{
		var tr=this.parentNode.parentNode;
		ctr=tr;
		var bid_node=tr.firstChild;
		var bid=bid_node.innerHTML;
		var price_node=this.parentNode.previousSibling;//单价节点
		var price=price_node.innerHTML;//单价
		tprice=price;
		tsum=sum;
		var sumprice_node=price_node.nextSibling.nextSibling;//小计节点
		tsumprice_node=sumprice_node;
		var sumprice=sumprice_node.innerHTML;//小计
		tsumprice=sumprice;
		var allprice_node=document.getElementById("allprice");//总计节点
		tallprice_node=allprice_node;
		var allprice=allprice_node.innerHTML;//总计
		tallprice=allprice;
		getXhr();
		xhr.open("GET", "changesum.action?sum="+sum+"&bid="+bid);
//		xhr.open("GET","deleteBook.action?bid="+bid+"&time="+new Date().getMilliseconds());
		xhr.onreadystatechange=callback;
		xhr.send(null);
	}
}






