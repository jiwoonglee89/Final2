<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>My Excel List</title>
</head>
<body>
<c:if test="${files==null}">
아직 아무 파일도 없으시네요?
</c:if>
<c:if test="${files!=null}">
<c:forEach var="file" items="${files}">
${file.id}
<a href="<c:url value='excel.do/num=${file.number}'/>">${file.title}</a>
${file.modify_date}
<a href="<c:url value='file_delete.do/num=${file.number}'/>">삭제</a>
</c:forEach>
</c:if>
</body>
</html>