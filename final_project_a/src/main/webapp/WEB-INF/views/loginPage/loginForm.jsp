<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<script>
function openConfirmid() {
	// 아이디를 입력했는지 검사
	 {
		// url과 사용자 입력 id를 조합합니다.
		url = "idpwSearchNew.do";

		// 새로운 윈도우를 엽니다.
		open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");

	}
}
</script>
<title>로그인</title>
</head>
<body>
<c:if test="${id == null}">
	<form method="post" action="login.do" name="loginFrom">
	<center>
	<table width="260" cellpadding="0" cellspacing="0" align="center" border="1">
	<th colspan="2">로그인</th>
	<tr>
	<td>아이디</td>
	<td><input type="text" class="text_login" name="id" placeholder="아이디" required placeholder="ID 입력"></td>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" class="text_login" name="password" placeholder="비밀번호" required placeholder="Password 입력"></td>
	</tr>
	<tr>
		<td><input type="submit" value="로그인"></td>
		<td><input type="button" value="회 원 가 입" onclick="javascript:window.location='join.do'"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="button" value="아이디/비밀번호 찾기" onclick='openConfirmid()'></td>
	</tr>
	</table>
	</center>
	</form>
</c:if>

<c:if test="${id != null }">
				<table width="260" cellpadding="0" cellspacing="0" align="center" border="1">
						<tr>
							<td rowspan="3" align="center">${id}님이<br> 방문하셨습니다
								<form method="post" action="logout.do">
									<input type="submit" value="로그아웃">
								</form>
								<form method="post" action="myPage.do">
									<input type="submit" value="나의 정보">
								</form>
							</td>
						</tr>
					</table>
				</td>
</c:if>
</body>
</html>