<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update</title>
</head>
<body>
	<form id="updateBoard" method="post">
		<div class="size_long"><h1 class="title_find">글 수 정</h1></div>
			<div class="size_long" id="divid"></div>
				<input type="text" id="id" name="id" value="${update.id}">
					<br>
				<input type="text" id="subject" name="subject" value="${update.subject}">
			<br>
		<div id="content_area">
	<textarea id="content" name="content" rows="20" cols="auto" value="${update.content}"></textarea>
</div>
	<input type="submit" value="글수정">
		</form>
</body>
</html>