 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<script>
function Mdelete()
{
	url = "MemberDelete.do";
	window.open(url,"get","toolbar=no ,width=500 ,height=300,directories=no,status=yes,scrollbars=yes,menubar=no");
}
</script>
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