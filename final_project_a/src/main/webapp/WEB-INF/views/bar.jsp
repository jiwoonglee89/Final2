<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="<c:url value="resources/contsrch.js" />"></script>
<script>
function popup()
{
	var  screenW=screen.availWidth;
	var  screenH=screen.availHeight;
	var popW = 600;
	var popH = 600;
	var l=(screenW-popW) / 2 ;
	var t=(screenH-popH) / 2 ;
	
	url = "join.do";
	window.open(url,"get","toolbar=no ,width="+popW+",height="+popH+",left="+l+",top="+t+",directories=+no,status=yes,scrollbars=yes,menubar=no");
	
}

</script>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #3fa338;
}

li {
    float: left;
    border-right: 1.5px solid #bbb;
}

li a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
    background-color: rgba( 255, 255, 255, 0.5 );
}

li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a { 
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}

#search
{
	float: right;
	vertical-align: middle;
	padding-top:10px;
	padding-right:10px;
	
}

</style>
</head>
<body>

<ul>
  <li><a class="active" href="#">저장</a></li>
  <li><a href="#">다운로드</a></li>
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
  <li id="search"><div><input type="text" name="search_text" id="search_text" size="20"></div></li>
</ul>

</body>
</html>