<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
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
body
{
width: auto;
height: auto;
overflow: hidden;
}
#all {
	background-color: white;
	width: 600px;
	height: 500px;
}

#top {
	background-color: #46CCFF;
	height: 5%;
	width: 100%;
	float: right;
	border: 5px;
}

#close {
	background-color:rgba(255,0,0,0.6);
	width: 20px;
	height: auto;
	text-align: center;
	float: right;
	margin: 3px;
	padding: auto;
}



#content 
{
 background-color: black;
 text-align: center;
 color:red;	
 height: 70%;
}


#bottom {
	vertical-align: center;
	background-color: yellow;
	color: black;
	width: 100%;
	height: 8.5%;
}

#btn
{
	float: right;
	padding: 10px;
	width: 20%;
	
}

#functionList
{
	overflow-y:auto;
}

#function
{
	border-bottom: double;
	background-color: white;
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
			<%-- <c:foreach begin="1" end="10" step="1"> --%>
			<div id="function">함수EX)</div>
			<%-- </c:foreach> --%>
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