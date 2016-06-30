<%@page import="java.net.URL"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
#footer_bar{
	display: inline-block;
	float: left;
}
#left{
	float: left;
}
#sheet_bar {
	display: inline-block;
	float: right;
}
#sheet_bar div{
	float: left;
}

</style>
<script>
$(function() {

	$('#btn').click(function(){
		var list = $('#sheet_bar div').text();
		
		var listleng = $('#sheet_bar').find('div').length;
		alert(list);
		alert(listleng);
	});
	$('#add').click(function() {
		
		tag = "<div id='sheet' class='sheet'>시트4.</div>";
		$('#sheet_bar').append(tag);
	});
});
</script>
<style>
</style>
</head> 
<body>
	<div id="footer_bar" style="border: 1px solid;">
		<div id="left">
			<input type="button" id="add" value="추가"/>
		</div>
		<div id="sheet_bar">
			<div id="sheet1" class="sheet">시트1.</div>
			<div id="sheet1" class="sheet">시트2.</div>
			<div id="sheet1" class="sheet">시트3.</div>
		</div>
	</div>
</body>
</html>