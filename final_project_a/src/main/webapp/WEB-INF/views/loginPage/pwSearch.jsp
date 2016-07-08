<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
<title>비밀번호 찾기</title>
</head>
<body>
<form>
<c:if test="${message==null}">
	<div id="find_id_result">
		<div class="size_long"><h1 class="title_find"><비밀번호 찾기></h1></div>
		<div class="size_long"><h1 class="title_find">비밀번호는 "${ password }" 입니다</h1></div>
	</div>
</c:if>
<c:if test="${message!=null}">
	<script>
		alert("${message}");
		history.go(-1);
	</script>
</c:if>
</form>
</body>
</html>