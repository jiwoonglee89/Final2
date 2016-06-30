<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Jquery..</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
 $(document).ready(function()
		{
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
		}); 
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
	background-color: #46CCFF;
	height: 5%;
	width: 100%;
	float: right;
	border: 5px;
	position:fixed;
	top: 0px;
	
}

#close {
	background-color:rgba(255,0,0,0.6);
	width: 20px;
	text-align: center;
	float: right;
 	margin-right: 20px;
}

#content 
{
 margin-top:21px;
 background-color:white;
 text-align: center;
 color:red;	
}


#bottom {
	display:block;
	vertical-align: center;
	background-color: yellow;
	color: black;
	width: 100%;
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
}

#function
{
	border-bottom: double;
	background-color: white;
	text-align: center;
	vertical-align: middle;
	display:block;
}

</style>

</head>
<body>
	<div id='all'>
		<div id='top'>
			<button id='close' class="close">X</button>
		</div>
		<div id='content'>
			<div id="functionList" >
			<c:forEach begin="1" end="151" step="1">
				<div id="function">예제안에 내용은 많아요 ^^<br></div>
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