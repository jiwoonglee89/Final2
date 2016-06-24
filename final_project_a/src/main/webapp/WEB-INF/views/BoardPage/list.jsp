<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="<c:url value="resources/image/*" />"></script>
<link href='https://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<Style>
/* 브라우저 기본값 초기화(Reset) */
body
{
	padding: 0px;
	margin: 0px;
}
 /* 버튼 css설정 */
.button {
   border: 1px solid #000000;
   background: #ffffff;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff));
   background: -webkit-linear-gradient(top, #ffffff, #ffffff);
   background: -moz-linear-gradient(top, #ffffff, #ffffff);
   background: -ms-linear-gradient(top, #ffffff, #ffffff);
   background: -o-linear-gradient(top, #ffffff, #ffffff);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #ffffff 100%);
   padding: 8px 16px;
   -webkit-border-radius: 0px;
   -moz-border-radius: 0px;
   border-radius: 0px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #f5f5f5 0 1px 0;
   color: #000000;
   font-size: 12px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.button:hover {
   border: 1px solid #000000;
   text-shadow: #ffffff 0 1px 0;
   background: #afb3b5;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#afb3b5));
   background: -webkit-linear-gradient(top, #ffffff, #afb3b5);
   background: -moz-linear-gradient(top, #ffffff, #afb3b5);
   background: -ms-linear-gradient(top, #ffffff, #afb3b5);
   background: -o-linear-gradient(top, #ffffff, #afb3b5);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #afb3b5 100%);
   color: #fff;
   }
.button:active {
   text-shadow: #000000 0 1px 0;
   border: 1px solid #000000;
   background: #030303;
   background: -webkit-gradient(linear, left top, left bottom, from(#000000), to(#afb3b5));
   background: -webkit-linear-gradient(top, #000000, #030303);
   background: -moz-linear-gradient(top, #000000, #030303);
   background: -ms-linear-gradient(top, #000000, #030303);
   background: -o-linear-gradient(top, #000000, #030303);
   background-image: -ms-linear-gradient(top, #000000 0%, #030303 100%);
   color: #fff;
   }
   
/* 상단 밑줄 */ 
/* #border_bottom1 {border-bottom:1px solid; border-top:10%; border-left:0px; border-right:0px; height:50px;} */
#border_bottom1
	{
	border: 1px solid;
	height:80px;
	width:1450px;
	}
/* 사용자 표시 */
#id_font{
	position : absolute;
	top :1px;
	left : 100px;
	font-size:48px;
	font-family: 'Poiret One', cursive;
	font-weight:bold;
	float: left;
}

/* Mypage 및 logout Button Group*/
#button_group
{
	top:10%;
	/* border: 1px; */
	margin-left: 80%;
	margin-right: 20%;
}

/* 로그아웃 div */
#logout
{
	position:absolute;
	top:2%;
	left:75%;
	float: left;
}

/* 정보 수정 div */
#modify
{
	position:absolute;
	top:2%;
	left:81%;
	float: right;
}

/* 하이퍼링크 */ 
a{text-decoration : none;}

/* 테이블 디자인 */
#table_bottom
{
 	position: absolute;
	width: 80%;
	text-align: center; 
	border-collapse: collapse;
	margin-left: auto;
    margin-right: auto;
    
}
th, td
{
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	padding: 10px;
}
#table_div
{
	margin-top: 2%;
	margin-left: 10%;
	margin-right: 10%;
}
#slide_bar
{
	position: absolute;
	top: 86%;
	left: 93%;
	
}

</Style>
<title>My Excel List</title>
</head>
<body>
	<!-- 파일이 없는 경우 -->
	<c:if test="${id != null }">
	<div id="id_font">${id}님의 엑셀</div>
	<div id="button_group">
	<form method="post" action="logout.do">
		<div id="logout">
			<input type="submit" value="Logout" id="logout_button" class="button">
		</div>
		<div id="modify">
			<input type="button" value="Modify" id="mypage_button" class="button" onclick="javascript:window.location='myPage.do'">
		</div>
	</form>
	</div>
	<div id="border_bottom1" align="center"></div>
	</c:if>
	<div id="table_div">
	 <table id="table_bottom">
	 	<tr>
	 		<th>Title</th>
	 		<th>Modify-date</th>
	 		<th>Delete</th>
	 	</tr>
	<c:if test="${files==null}" >
	 	<tr>
	 		<td colspan="3">아직 아무 파일도 없으시네요?</td>
	 	</tr>
	</c:if>
	<!-- 파일이 있는 경우 -->
	<c:if test="${files!=null}">
	<c:forEach var="file" items="${files}" >
		<tr>
			<td><a href="<c:url value='excel.do?num=${file.file_number}'/>">${file.title}</a></td>
			<td>${file.modify_date}</td>
			<td><a href="<c:url value='file_delete.do?num=${file.file_number}'/>">삭제</a></td>
		<tr>
	</c:forEach>					
	</c:if>		 	
	 </table>
	</div>
	<div id="slide_bar">
		<a href="newdivedit.do"><img src="resources/images/plus_mark.png" width="60" hight="60" alt="엑셀 생성" title="엑셀 생성"></a>
	</div>
</body>
</html>