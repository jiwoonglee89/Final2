<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<Style>
	body{
	font-size:17px;
	text-shadow:1px 1px 3px #666666;
	font-family: 'Poiret One', cursive;
}
</Style>
<title>My Excel List</title>
</head>
<body>
<c:if test="${files==null}">
아직 아무 파일도 없으시네요?
</c:if>
<c:if test="${files!=null}">
<c:forEach var="file" items="${files}">
${file.id}
<a href="<c:url value='excel.do?num=${file.file_number}'/>">${file.title}</a>
${file.modify_date}
<a href="<c:url value='file_delete.do?num=${file.file_number}'/>">삭제</a>
</c:forEach>
</c:if>
</body>
</html>