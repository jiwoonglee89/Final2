<%@page import="java.net.URL"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
#footer_bar{
	display: inline-block;
	float: left;
}
#left{
	float: left;
}
#sheet_bar{
	float: right;
}

</style>
<script>
	$(function() {

		$('#add').click(function() {
			$('#sheet_bar').append()
		});
	});
</script>
<style>
</style>
</head>
<body>
	<div id="footer_bar">
		<div id="left">
			<a href="#" id="add">추가</a>
		</div>
		<div id="sheet_bar">
			<div id="sheet1" class="sheet">시트1</div>
		</div>
	</div>
</body>
</html>