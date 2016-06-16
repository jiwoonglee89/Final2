<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value="resources/join.js" />"></script>
<title>회원정보 수정</title>
</head>
<body onload="disable()">
	<form name="joinF" action="modify.do" method="post" onSubmit="return check()">
		<table width="600" border="1" cellspacing="0" cellpadding="3" align="center">
			<tr>
				<td colspan="2" height="39" align="center" bgcolor=""><font
					size="+1"><b>Web cell 정보수정</b></font><br>
				<font color="red" align="right" size="-1">[*표시는 필수 입력 사항입니다.]</font></td>
			</tr>
			<tr>
				<td width="200">*아이디</td>
				<td width="400"><input type="text" name="id" maxlength="30"
					size="35" readonly="readonly" value="${memberInfo.id}"></td>
			</tr>
			<tr>
				<td width="200">*비밀번호</td>
				<td width="400"><input type="password" name="password"
					maxlength="20" size="25"></td>
			</tr>
			<tr>
				<td width="200">*비밀번호 확인</td>
				<td width="400"><input type="password" name="password2"
					maxlength="20" size="25"></td>
			</tr>
			<tr>
				<td width="200">*이름</td>
				<td width="400"><input type="text" name="name" maxlength="50"
					size="15" onblur="id_noNumber(this.form)"
					value="${memberInfo.name}"></td>
			</tr>
			<tr>
				<td width="200">*생년월일</td>
				<td width="200"><input type="date" name="birth"
					value="${memberInfo.birth}"></td>
			</tr>
			<tr>
				<td width="200">*전화번호</td>
				<!-- 전화번호 유효성 검사 재프로그래밍할것 -->
				<td width="400"><input type="text" name="Phone"
					placeholder="-는 제외하고 입력해주세요." maxlength="11" size="20"
					onKeyPress="onlyNumber()" onBlur="onlyNumber2(this)"
					value="${memberInfo.phone}"></td>
			</tr>
			<tr>
				<td width="200">이메일</td>
				<td width="400"><input type="text" name="emailID" size="15"
					maxlength="25" value="${emailID}">@ <input type="text"
					name="emailAddress" size="10" value="${emailAddress}"> <select
					name=email onchange="email_change(this.form)">
						<option value="" selected="selected">이메일주소 선택</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="yahoo.com">yahoo.com</option>
						<option value="1">직접입력</option>
				</select></td>
			</tr>
			<tr>
				<td width="200">*우편 번호</td>
				<td><input type="text" name="zipcode" size="10" readonly
					placeholder="우편번호를 검색." value="${memberInfo.zipcode}"> <input
					type="button" value="우편번호찾기" onClick="zipCheck()"> <input
					type="text" name="address" size="50" placeholder="나머지 주소를 적어 주세요"
					value="${memberInfo.address}">.</td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="">
				<input type="submit" name="confirm" value="정보수정"> 
				<input type="button" value="수정 취소" onclick="javascript:window.location='loginForm.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>