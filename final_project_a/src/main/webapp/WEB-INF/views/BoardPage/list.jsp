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


 #list{
position:absolute;
top : 400px;
}  

#Nofile {
	position:absolute;
	top:150px;
	left:600px;
	font-size:17px;
	font-family:'Poiret One', cursive;
}
#text_box{
	position:absolute;
	top:125px;
	left:260px;
	border:1px solid;
	font-famliy:'Poiret One', cursive;
	font-size:17px;
	padding:30px;
	margin-right:30px;
	border:5px;
	font-family: 'Poiret One', cursive;
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
				<table width="260" cellpadding="0" cellspacing="0" align="center">
						<tr>
						
								<form method="post" action="logout.do">
									<input type="submit" value="Logout" id="logout_button" class="button">
								</form>
							<td>
								<form action="myPage.do">
									<input type="submit" value="Modify" id="mypage_button" class="button">
								</form>
							</td>
						</tr>
						</table>
						<hr id="border_bottom1">
						<table id="list">
						<!-- <tr>
							<td>
								<input type="button" value="게시글 이동(임시)" onClick="javascript:window.location='list.do'">
							</td>							
						
						</tr> -->
					</table>
				</td>
				</c:if>
<table>
<center>
<div id="text_box" style="border:1px solid; padding:10px; width:900px; word-spacing:250px;">Title Modify-date Delete</div>
</center>
<c:if test="${files==null}" >
<h2 id="Nofile"><br><br><br><br><br><br><br><br><br><br><br><br>아직 아무 파일도 없으시네요?</h2>
</c:if>

<c:if test="${files!=null}">
<div id="wrap">
<c:forEach var="file" items="${files}" >

<div id="file_update" style="padding:10px; width:900px;">
<%-- ${file.id} --%>

<a href="<c:url value='excel.do?num=${file.file_number}'/>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${file.title}</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${file.modify_date}
<a href="<c:url value='file_delete.do?num=${file.file_number}'/>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭제</a>
</div>

</c:forEach>
</div>
</c:if>

</body>
</html>