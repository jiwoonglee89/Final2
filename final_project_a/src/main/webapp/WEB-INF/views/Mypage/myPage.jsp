 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
</head>
<body>
	<form name="mypageF" action=".do" method="post" onSubmit="">
		
		<table width="600" border="1" cellspacing="0" cellpadding="3" align="center">
			<tr>
				<td colspan="2" height="39" align="center" bgcolor="">
				<font size="+1"><b>${name}님의 회원정보</b></font>
				</td>
			</tr>
			<tr>
				<td width="200">*아이디</td>
				<td width="400">
					<input type="text" name="id" maxlength="30" size="35" readonly="readonly" value="${id}">
				</td>
			</tr>
			<tr>
				<td width="200">*비밀번호</td>
				<td width="400">
					<input type="password" name="password" maxlength="20" size="25" readonly="readonly" value="${password}">
				</td>
			</tr>
			<tr>
				<td width="200">*이름</td>
				<td width="400">
					<input type="text" name="name" maxlength="50" size="15" readonly="readonly" value="${name}">
				</td>
			</tr>
			<tr>
				<td width="200">*생년월일</td>
				<td width="200">
					<input type="date" name="birth" readonly="readonly" value="${birth}">
				</td>
			</tr>
			<tr>
			<!-- 전화번호 유효성 검사 재프로그래밍할것 -->
				<td width="200">*전화번호</td>
				<td width="400">
					<input type="text" name="phone" maxlength="11" size="20" readonly="readonly" value="${phone}""> 
				</td>
			</tr>
			<tr>
				<td width="200">이메일</td>
				<td width="400">
					<input type="text" name="emailID" size="15"  maxlength="25" readonly="readonly" value="${emailID}">@
					<input type="text" name="emailAddress" size="10" >
					<select name=email  onchange="email_change(this.form)" >
							<option value="" selected="selected">이메일주소 선택</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="yahoo.com">yahoo.com</option>
							<option value="1">직접입력</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="200">*우편 번호</td>
				<td>
					<input type="text" name="zipcode" size="10" readonly="readonly" value="${zipcode}">
					<input type="text" name="address" size="50" readonly="readonly" value="${address}">.
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="">
					<input type="submit"name="confirm" value="등 록"> 
					 <input type="button" value="가입 안함" onclick="javascript:window.location=''">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>