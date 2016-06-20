<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>삭제 실패</title>
</head>
<body>
<c:if test="${success>0 }">
<c:redirect url="/board.do"/>
</c:if>
<c:if test="${success<=0 }">
삭제에 실패하였습니다.<br>
<a href="javascript:history.go(-1)">뒤로 가기</a>
</c:if>
</body>
</html>