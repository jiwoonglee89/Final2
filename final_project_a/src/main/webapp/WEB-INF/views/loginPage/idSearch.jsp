<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
<title>아이디 찾기</title>
<style>
h1{
font-style:oblique;
font-weight:bold;
font-size : 20px;  
}
</style>
<style>
h2{
font-style:oblique;
font-weight:bold;
font-size:15px;
}
</style>
</head>
<body>
<form>
<c:if test="${message==null}">
	<div id="find_id_result">
		<div style=text-align:center class="size_long"><h1 class="title_find"><아이디 찾기></h1></div>
			<div style=text-align:center class="size_long"><h2 class="title_find">아이디는 "${id}" 입니다</h2></div>
		<div ></div>		
				</div>
			</c:if>
		<c:if test="${message!=null}">
	<script>
		alert("일치하는 아이디가 없습니다");
		history.go(-1);
</script>
</c:if>
</form>
</body>
</html>