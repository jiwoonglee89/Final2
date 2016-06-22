<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<Style>
.button {
   border: 1px solid #000000;
   background: #ffffff;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff));
   background: -webkit-linear-gradient(top, #ffffff, #ffffff);
   background: -moz-linear-gradient(top, #ffffff, #ffffff);
   background: -ms-linear-gradient(top, #ffffff, #ffffff);
   background: -o-linear-gradient(top, #ffffff, #ffffff);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #ffffff 100%);
   padding: 2.5px 5px;
   -webkit-border-radius: 0px;
   -moz-border-radius: 0px;
   border-radius: 0px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #000000 0 1px 0;
   color: #121212;
   font-size: 9px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.button:hover {
   border: 1px solid #000000;
   text-shadow: #d4d4d4 0 1px 0;
   background: #979899;
   background: -webkit-gradient(linear, left top, left bottom, from(#fcfeff), to(#979899));
   background: -webkit-linear-gradient(top, #fcfeff, #979899);
   background: -moz-linear-gradient(top, #fcfeff, #979899);
   background: -ms-linear-gradient(top, #fcfeff, #979899);
   background: -o-linear-gradient(top, #fcfeff, #979899);
   background-image: -ms-linear-gradient(top, #fcfeff 0%, #979899 100%);
   color: #ffffff; 
   }
.button:active {
   text-shadow: #ffffff 0 1px 0;
   border: 1px solid #445761;
   background: #000000;
   background: -webkit-gradient(linear, left top, left bottom, from(#030303), to(#979899));
   background: -webkit-linear-gradient(top, #030303, #000000);
   background: -moz-linear-gradient(top, #030303, #000000);
   background: -ms-linear-gradient(top, #030303, #000000);
   background: -o-linear-gradient(top, #030303, #000000);
   background-image: -ms-linear-gradient(top, #030303 0%, #000000 100%);
   color: #fff;
   }

hr {border-bottom:1px solid; border-top:0px; border-left:0px; border-right:0px; height:50px;}
#Nofile{
	position : absolute;
	top :400px;
	font-size:17px;
}
#id_font{
	position : absolute;
	top :1px;
	left : 100px;
	font-size:48px;
	font-family: 'Poiret One', cursive;
	font-weight:bold;
}
	#login_Id {
	position:absolute;
	border:0px;
	top:1px;
	left:10px;
	font-weight:bold;
	font-size:48px;
}
#logout_button{
	position:absolute;
	top:25px;
	left:1160px;
}

#mypage_button{
	position:absolute;
	top:25px;
	left:1230px;
} 

#Nofile {
	position:absolute;
	top:50%;
	left:40%;
	font-size:17px;
	font-family:'Poiret One', cursive;
	text-align: center;
	vertical-align: middle;
}
#text_box{
	position:absolute;
	top:125px;
	left:160px;
	border:1px solid;
	font-famliy:'Poiret One', cursive;
	font-size:17px;
	padding:30px;
	margin-right:30px;
	text-align: center;
}

#wrap{
	position:absolute;
	top:200px;
	left:260px;
	border:1px solid black;
	height: 400px;
	font-family: 'Poiret One', cursive;
}
#file_update{
height : auto;
}

a{

 text-decoration : none;
}
</Style>
<title>My Excel List</title>
</head>
<body>
	<c:if test="${id != null }">
	<font id="id_font">${id}님의 엑셀</font>
	<form method="post" action="logout.do">
	<table width="260" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td>
				<input type="submit" value="Logout" id="logout_button" class="button">
			</td>
			<td>
					<input type="button" value="Modify" id="mypage_button" class="button" onclick="javascript:window.location='myPage.do'">
			</td>
		</tr>
	</table>
	</form>
	<hr id="border_bottom1">
	</c:if>
	
	 
	<div id="text_box" style="border:1px solid; padding:10px; width:900px; word-spacing:250px;">Title Modify-date Delete</div>
	<c:if test="${files==null}" >
		<h2 id="Nofile">아직 아무 파일도 없으시네요?</h2>
	</c:if>

	<c:if test="${files!=null}">
		<div id="wrap">
		<c:forEach var="file" items="${files}" >
			<div id="file_update" style="padding:10px; width:900px;margin-left:50px;">
				<a href="<c:url value='excel.do?num=${file.file_number}'/>">${file.title}</a>
				${file.modify_date}
				<a href="<c:url value='file_delete.do?num=${file.file_number}'/>">삭제</a>
			</div>
		</c:forEach>
		</div>
	</c:if>
</body>
</html>