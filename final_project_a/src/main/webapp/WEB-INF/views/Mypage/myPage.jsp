 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<link href='https://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<script>
function Mdelete()
{
	
	var  screenW=screen.availWidth;
	var  screenH=screen.availHeight;
	var popW = 568;
	var popH = 325;
	var l=(screenW-popW) / 2 ;
	var t=(screenH-popH) / 2 ;
	
	url = "MemberDelete.do";
	window.open(url,"get","toolbar=no ,width="+popW+",height="+popH+",left="+l+",top="+t+",directories=+no,status=yes,scrollbars=yes,menubar=no");
}
</script>
<style>
.button {
   border: 1px solid #050505;
   background: #ffffff;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff));
   background: -webkit-linear-gradient(top, #ffffff, #ffffff);
   background: -moz-linear-gradient(top, #ffffff, #ffffff);
   background: -ms-linear-gradient(top, #ffffff, #ffffff);
   background: -o-linear-gradient(top, #ffffff, #ffffff);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #ffffff 100%);
   padding: 7px 14px;
   -webkit-border-radius: 0px;
   -moz-border-radius: 0px;
   border-radius: 0px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #ffffff 0 1px 0;
   color: #000000;
   font-size: 14px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.button:hover {
   border: 1px solid #000000;
   text-shadow: #ffffff 0 1px 0;
   background: #9c9c9c;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#9c9c9c));
   background: -webkit-linear-gradient(top, #ffffff, #9c9c9c);
   background: -moz-linear-gradient(top, #ffffff, #9c9c9c);
   background: -ms-linear-gradient(top, #ffffff, #9c9c9c);
   background: -o-linear-gradient(top, #ffffff, #9c9c9c);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #9c9c9c 100%);
   color: #fff;
   }
.button:active {
   text-shadow: #000000 0 1px 0;
   border: 1px solid #000000;
   background: #000000;
   background: -webkit-gradient(linear, left top, left bottom, from(#000000), to(#9c9c9c));
   background: -webkit-linear-gradient(top, #000000, #000000);
   background: -moz-linear-gradient(top, #000000, #000000);
   background: -ms-linear-gradient(top, #000000, #000000);
   background: -o-linear-gradient(top, #000000, #000000);
   background-image: -ms-linear-gradient(top, #000000 0%, #000000 100%);
   color: #ffffff;
   }
	
	#myPage_border
	{
	border: 1px solid;
	height:80px;
	width:1200px;
	font-family:'Poiret One', cursive;
	margin-bottom: 30px;
	}
	#myPage_maintext
	{
	position:absolute;
	top:34px;
	left:30px;
	}
	.myPage_text
	{	
	position:relative;
	top:30%;
	left: 30%;
	font-family:'Poiret One', cursive; 
	
	}
	#button1
	{
		position:static;
		float: right;
		margin-top: 20px;
		margin-right: 20px;
	}
	#buttongroup
	{
		position: relative;
		left: 44%;
		margin-top: 30px;
	}

</style>
</head>
<body>
<div id="myPage_border">
<font size="+1">
	<b id="myPage_maintext">${listM.name}님의 회원정보수정</b>
</font>  
	<input id="button1" class="button" type="button" value="Member Leave" onclick="Mdelete()">
</div>	
		
<form name="mypageF" action="modifyForm.do" method="post">
		<table class="myPage_text" style="border-style:dotted; border-color:gray;" height="400" width="600" cellspacing="1" cellpadding="2">
			<tr>
				<td width="200" align="center">*Id</td>
				<td width="400">
					<div align="center">${id}</div>
				</td>
			</tr>
			<tr>
				<td width="200" align="center">*Password</td>
				<td width="400">
					<div align="center">${listM.password}</div>
				</td>
			</tr>
			<tr>
				<td width="200" align="center">*Name</td>
				<td width="400">
					<div align="center">${listM.name}</div>
				</td>
			</tr>
			<tr>
				<td width="200" align="center">*Birth</td>
				<td width="200">
					<div align="center">${listM.birth}</div>
				</td>
			</tr>
			<tr>
			<!-- 전화번호 유효성 검사 재프로그래밍할것 -->
				<td width="200" align="center">*Phone</td>
				<td width="400">
					<div align="center">${listM.phone}</div>
				</td>
			</tr>
			<tr>
				<td width="200" align="center">Email</td>
				<td width="400">
					<div align="center">${listM.email}</div>
				</td>
				
			</tr>
			<tr>
				<td width="200" align="center">*Zipcode</td>
				<td>
					<div align="center">${listM.zipcode} ${listM.address}</div>
				</td>
			</tr>
		</table>
		<div id="buttongroup">
			<input class="button" type="submit"name="confirm" value="Modify Information"> 
			<input class="button" type="button" value="Return" onclick="javascript:window.location='board.do'">
		</div>
	</form>
</body>
</html>