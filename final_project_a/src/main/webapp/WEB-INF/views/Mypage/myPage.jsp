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
	url = "MemberDelete.do";
	window.open(url,"get","toolbar=no ,width=500 ,height=300,directories=no,status=yes,scrollbars=yes,menubar=no");
}
</script>
<style>
.button {
   border: 1px solid #000000;
   background: #ffffff;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff));
   background: -webkit-linear-gradient(top, #ffffff, #ffffff);
   background: -moz-linear-gradient(top, #ffffff, #ffffff);
   background: -ms-linear-gradient(top, #ffffff, #ffffff);
   background: -o-linear-gradient(top, #ffffff, #ffffff);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #ffffff 100%);
   padding: 2.5px 5px;
   -webkit-border-radius: 0px;
   -moz-border-radius: 0px;
   border-radius: 0px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #000000 0 1px 0;
   color: #121212;
   font-size: 9px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.button:hover {
   border: 1px solid #000000;
   text-shadow: #d4d4d4 0 1px 0;
   background: #979899;
   background: -webkit-gradient(linear, left top, left bottom, from(#fcfeff), to(#979899));
   background: -webkit-linear-gradient(top, #fcfeff, #979899);
   background: -moz-linear-gradient(top, #fcfeff, #979899);
   background: -ms-linear-gradient(top, #fcfeff, #979899);
   background: -o-linear-gradient(top, #fcfeff, #979899);
   background-image: -ms-linear-gradient(top, #fcfeff 0%, #979899 100%);
   color: #ffffff;
   }
.button:active {
   text-shadow: #ffffff 0 1px 0;
   border: 1px solid #445761;
   background: #000000;
   background: -webkit-gradient(linear, left top, left bottom, from(#030303), to(#979899));
   background: -webkit-linear-gradient(top, #030303, #000000);
   background: -moz-linear-gradient(top, #030303, #000000);
   background: -ms-linear-gradient(top, #030303, #000000);
   background: -o-linear-gradient(top, #030303, #000000);
   background-image: -ms-linear-gradient(top, #030303 0%, #000000 100%);
   color: #fff;
   }
</style>
</head>
<body>
	<form name="mypageF" action="modifyForm.do" method="post">
		
		<table width="600" border="1" cellspacing="0" cellpadding="3" align="center">
			<tr>
				<td colspan="2" height="39" align="center" bgcolor="">
				<font size="+1"><b>${listM.name}님의 회원정보</b></font>
				</td>
			</tr>
			<tr>
				<td width="200">*아이디</td>
				<td width="400">
					<div>${id}</div>
				</td>
			</tr>
			<tr>
				<td width="200">*비밀번호</td>
				<td width="400">
					<div>${listM.password}</div>
				</td>
			</tr>
			<tr>
				<td width="200">*이름</td>
				<td width="400">
					<div>${listM.name}</div>
				</td>
			</tr>
			<tr>
				<td width="200">*생년월일</td>
				<td width="200">
					<div>${listM.birth}</div>
				</td>
			</tr>
			<tr>
			<!-- 전화번호 유효성 검사 재프로그래밍할것 -->
				<td width="200">*전화번호</td>
				<td width="400">
					<div>${listM.phone}</div>
				</td>
			</tr>
			<tr>
				<td width="200">이메일</td>
				<td width="400">
					<div>${listM.email}</div>
				</td>
				
			</tr>
			<tr>
				<td width="200">*우편 번호</td>
				<td>
					<div>${listM.zipcode} ${listM.address}</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="">
					<input type="button" value="회원 탈퇴" onclick="Mdelete()">
					<input type="submit"name="confirm" value="정보 수정하기"> 
					<input type="button" value="돌아가기" onclick="javascript:window.location='board.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>