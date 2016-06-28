<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>力格 涝仿</title>
<style>
	html,body{overflow:hidden;}
</style>
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script>
$(function(){
	
	$("#submit_find_title").click(function(){
		
		$('#in_title').submit();
		window.close();
	});
	
});

</script>
</head> 
<body>
<form action="newdivedit.do" name="title" id="in_title">
<table>
	<tr>
		<td>
			<div class="size_long" id="divtitle">
			<input type="text" class="text_login" id="title" name="title" maxlength="12" placeholder="力格"></input>
			</div>
			<input id="submit_find_title" class="button" type="button" name="confirm_title" value="check"></input>
		</td>
	</tr>
</table>
</form> 
</body> 
</html>