<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 페이지</title>
<style>
table
{
	border: none;
	border-spacing: 20px;
}
th
{
	text-align: center;
	vertical-align: middle;
}
password
{
	left: 0px;
}
.button {
	font-family: 'Poiret One', cursive;
	border: 1px solid #111014;
	background: #ffffff;
	background: -webkit-gradient(linear, left top, left bottom, from(#ffffff),
		to(#ffffff));
	background: -webkit-linear-gradient(top, #ffffff, #ffffff);
	background: -moz-linear-gradient(top, #ffffff, #ffffff);
	background: -ms-linear-gradient(top, #ffffff, #ffffff);
	background: -o-linear-gradient(top, #ffffff, #ffffff);
	background-image: -ms-linear-gradient(top, #ffffff 0%, #ffffff 100%);
	padding: 6.5px 13px;
	-webkit-border-radius: 0px;
	-moz-border-radius: 0px;
	border-radius: 0px;
	-webkit-box-shadow: rgba(255, 255, 255, 0.4) 0 1px 0, inset
		rgba(255, 255, 255, 0.4) 0 1px 0;
	-moz-box-shadow: rgba(255, 255, 255, 0.4) 0 1px 0, inset
		rgba(255, 255, 255, 0.4) 0 1px 0;
	box-shadow: rgba(255, 255, 255, 0.4) 0 1px 0, inset
		rgba(255, 255, 255, 0.4) 0 1px 0;
	text-shadow: #373b3d 0 1px 0;
	color: #000000;
	font-size: 13px;
	font-family: helvetica, serif;
	text-decoration: none;
	vertical-align: middle;
}

.button:hover {
	font-family: 'Poiret One', cursive;
	border: 1px solid #ffffff;
	text-shadow: #1e4158 0 1px 0;
	background: #808080;
	background: -webkit-gradient(linear, left top, left bottom, from(#f5f5f5),
		to(#808080));
	background: -webkit-linear-gradient(top, #f5f5f5, #808080);
	background: -moz-linear-gradient(top, #f5f5f5, #808080);
	background: -ms-linear-gradient(top, #f5f5f5, #808080);
	background: -o-linear-gradient(top, #f5f5f5, #808080);
	background-image: -ms-linear-gradient(top, #f5f5f5 0%, #808080 100%);
	color: #fff;
}

.button:active {
	font-family: 'Poiret One', cursive;
	text-shadow: #051017 0 1px 0;
	border: 1px solid #ebf1f5;
	background: #000000;
	background: -webkit-gradient(linear, left top, left bottom, from(#000000),
		to(#808080));
	background: -webkit-linear-gradient(top, #000000, #000000);
	background: -moz-linear-gradient(top, #000000, #000000);
	background: -ms-linear-gradient(top, #000000, #000000);
	background: -o-linear-gradient(top, #000000, #000000);
	background-image: -ms-linear-gradient(top, #000000 0%, #000000 100%);
	color: #ffffff;
}

#member_Delete {
	position: absolute;
	top: 89px;
	left: 84px;
	text-align: center;
	border: 1px solid;
	height: 30px;
	width: 400px;
	font-family: 'Poiret One', cursive;
}

#button {
	position: absolute;
	top: 180px;
	left: 240px;
}

#password {
	position: absolute;
	top: 130px;
	left: 15%;
}
</style>
<script src="<c:url value="resources/delete.js" />"></script>
</head>
<body onload="resizeWind(this)">
	<form name="deleteForm" action="MemberDelete.do" method="post">
		<table id="member_Delete" style="border-style: dotted;" width="400" id="password">
			<tr>
				<th colspan="2">회원 탈퇴 화면</th>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" size="20" maxlength="40"></td> 
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" onclick="passCheck()" value="탈퇴하기" class="button">
				</td>
			</tr>
		</table>
	</form>
	<c:if test="${check=='n'}">
		<script>
	alert("비밀번호를 확인해주세요")
</script>
	</c:if>
	<c:if test="${check=='y'}">
	<script>
		window.opener.location.href="loginForm.do";
		self.close();
	</script>
	</c:if>
</body>
</html>