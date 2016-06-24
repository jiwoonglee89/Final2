<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MenuBar</title>
<style>
body 
{
    margin: 0;
}
ul
{
	list-style-type: none;
	margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #3fa338;
    border: 1px solid #e7e7e7;
}
li
{
	float:left;
	border-right: 1.5px solid #bbb;
	
}
li:last-child {
    border-right: none;
}
li a 
{
	color: white;
	text-align: center;
	vertical-align:middle;
	padding: 14px 16px;
	text-decoration: none;
}
#topMenu
{
	/* height: 30px; */
	display: inline-block;
}

#topMenu a{
	color:black;
	padding: 12px 16px;
    text-decoration: none;
    display: block;
}
#topMenu:hover
{
	background-color: rgba( 255, 255, 255, 0.5 ); 
}

#topMenu:hover .submenu{
	display:block;
}

.submenu .f
{
 	color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.submenu .f:hover{
background-color: #f1f1f1;
}

.submenu{
	display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

#topMenu:HOVER #submenu 
{
	display: block;
}

</style>
</head>
<body>
<nav id="MenuBar">
	<ul id="category">
	
	  <li id="topMenu" class="save">
	  	<a  href="#">저장</a>
	  </li>
	  
	  <li id="topMenu" class="download">
	  	<a href="#">다운로드</a>
	  </li>
	  
	  <li id="topMenu">
	  	<button  class="function">함수</button>
	  	<div class="submenu">
			<a href="" class="f">평균</a>
			<a href="" class="f">합계</a>
			<a href="" class="f">최대값</a>
			<a href="" class="f">최소값</a>
		</div>
	  </li>
	  
	  <li id="topMenu" class="serach">
	  	<a href="#">찾기</a>
	  </li>
	  
	  <li id="topMenu" class="arrange">
	  	<a href="#">정렬</a>
	  </li>
	  
	  <li id="topMenu" class="add">
	  	<a href="#">추가</a>
	  </li>
	  
	  <li id="topMenu" class="list">
	  	<a href="#">엑셀목록</a>
	  </li>
	  
	</ul>
</nav>
</body>
</html>