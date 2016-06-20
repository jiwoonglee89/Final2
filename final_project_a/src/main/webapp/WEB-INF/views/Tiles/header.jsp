<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<link rel="stylesheet" href='<c:url value="resources/style.css"/>' type="text/css" media="print, projection, screen" />
</head>
<body>
	<div id="formulaBar" class="jbMenu" style="padding-left:0px;">
		<div class="top" style='float: left'>
		<form >
			<input type="submit" value="함수">
			</form>
		<input type="button" onclick="submit1()" value="저장"/>
		</div><br/><br/>
		<div class="left" style='float: left'>
			<input type="text" id="address">
		</div>
		<div class="center" style='float: left'>수식</div>
		<div class="right" style='float: left'>
		<form id="form2" action='formula.do' method='post'>
			<input type="text" id="formula" name="formula1"/>
			</form>
		</div>
		<br/><br/>
	</div>
</body>
</html>