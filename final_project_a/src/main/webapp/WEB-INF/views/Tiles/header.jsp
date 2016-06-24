<%@page import="java.net.URL"%>
<%@page import="org.apache.tiles.request.locale.URLApplicationResource"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<link rel="stylesheet" href='<c:url value="resources/style.css"/>' type="text/css" media="print, projection, screen" />
</head>
<body>
	<div id="formulaBar" class="jbMenu" style="padding-left:0px; background: #3fa338;">
		<!-- <div class="top" style='float: left'> -->
		<ul>
  <li><input type="button" onclick="submit1()" value="저장"/>
  <a class="active" href="#">저장</a></li>
  <li><a href="#">다운로드</a></li>
  <li><input type="button" id="insertBtn" value="불러오기"/></li>
  <li class="dropdown">
    <a href="#" class="dropbtn">함수</a>
    <div class="dropdown-content">
      <a href="#">평균</a>
      <a href="#">합계</a>
      <a href="#">최대값</a>
      <a href="#">최대값</a>
      <a href="#" onclick="popup()" >더보기...</a>
    </div>
  </li>
  <li><a href="#">검색</a></li>
 <li class="dropdown">
    <a href="#" class="dropbtn">정렬</a>
    <div class="dropdown-content">
      <a href="#">오름차순</a>
      <a href="#">내림차순</a>
    </div>
  </li>
   <li class="dropdown">
    <a href="#" class="dropbtn">추가</a>
    <div class="dropdown-content">
      <a href="#">행추가</a>
      <a href="#">열추가</a>
      <a href="#">시트추가</a>
    </div>
  </li>
  <li><a href="#">엑셀목록</a></li>
</ul>
		</div>
		<div class="jbMenu2">
		<div class="left" style='float: left'>
			<input type="text" id="address">
		</div>
		<div class="center" style='float: left'>수식</div>
		<div class="right" style='float: left'>
		<form id="form2" action='formula.do' method='post'>
			<input type="text" id="formula" name="formula1"/>
			</form>
		</div>
		</div>
</body>
</html>