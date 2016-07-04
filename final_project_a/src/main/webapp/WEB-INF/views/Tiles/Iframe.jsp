<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Jquery</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="<c:url value="resources/formula.js" />"></script>
<script>
document.write("<script type='text/javascript' src='resources/formula.js'><"+"/script>");
 $(document).ready(function()
		{
	 	//닫기 버튼 및 취소 버튼 클릭시 화면 닫기
			$("button.close").click
			(
				function()
				{
					$("#overLayer", parent.document).css("display","none");
					$("#glayLayer", parent.document).css("display","none");
				}
			);
			$("button.cancel").click
			(
				function()
				{
					$("#overLayer", parent.document).css("display","none");
					$("#glayLayer", parent.document).css("display","none");
				}
			);
			$('#function').click(function(){
				$('#function').attr('class','selected');
			});
			
		}); 
 function out()
 {
	 document.write(n);
 }
</script>
<style>
html
{
	display: block;
}
body
{
overflow: hidden;
}
#all 
{
	display: block;
}

#top {
	display:block;
	background-color: #2B2D35;
	height: 5%;
	width: 97.5%;
	float: right;
	border: 5px;
	position:fixed;
	top: 0px;
	
}

#close {
	text-align: centers;
	float: right;
 	margin-right: 20px;
}

#content 
{
 margin-top:21px;
 background-color:#F8F9F8;
 text-align: center;
 color:black;	
 padding: 15px;
}


#bottom {
	display:block;
	vertical-align: center;
	background-color: #E1E1E1;
	color: black;
	width: 97.5%;
	position:fixed; 
	bottom:0px;
}

#btn
{
	float: right;
	padding: 10px;
	width: 20%;	
}

#functionList
{
	overflow-y:scroll;
	display:block;
	height: 380px;
	border-color: black;
	border:1px;
	border: solid;
}

#function
{
	border-bottom: double;
	background-color: white;
	text-align: center;
	vertical-align: middle;
	display:block;
}
#function:ACTIVE 
{
	background-color: #a0a0a0;
}

</style>

</head>
<!-- oncontextmenu : 드래그 금지 -->
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false" >
	<div id='all'>
		<div id='top'>
			<button id='close' class="close">X</button>
		</div>
		<div id='content'>
			<div id="functionList" >
			<c:forEach begin="1" end="151" step="1">
				<div id="function">[함수 이름 :/ 함수 종류 : ]<br></div>
			</c:forEach>
			</div>
		</div>
		<div id='bottom'>
		<div id="btn">
			<button id="confirm">확인</button>
			<button id="cancel" class="cancel">취소</button>
		</div>
		</div>
	</div>
</body>
</html>