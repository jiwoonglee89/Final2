<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<title> <tiles:getAsString name="title" /> </title>
</head>
<body  style="overflow-y:hidden;">
<tiles:insertAttribute name="header"/>
<tiles:insertAttribute name="body" />
</body>
</html> 