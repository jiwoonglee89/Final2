<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>My Excel List</title>
</head>
<body>
<c:forEach var="files" items="${files}">
<a href="<c:url value='excel.do/num=${files.number}'/>">${files.title}</a>
${files.modify_date}
<a href="<c:url value='file_delete.do/num=${files.number}'/>">삭제</a>
</c:forEach>
</body>
</html>