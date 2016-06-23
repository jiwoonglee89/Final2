<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<style>
/* 버튼 css 시작*/
.button {
   font-family: 'Poiret One', cursive;
   border: 1px solid #111014;
   background: #ffffff;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff));
   background: -webkit-linear-gradient(top, #ffffff, #ffffff);
   background: -moz-linear-gradient(top, #ffffff, #ffffff);
   background: -ms-linear-gradient(top, #ffffff, #ffffff);
   background: -o-linear-gradient(top, #ffffff, #ffffff);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #ffffff 100%);
   padding: 6.5px 13px;
   -webkit-border-radius: 0px;
   -moz-border-radius: 0px;
   border-radius: 0px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #373b3d 0 1px 0;
   color: #000000;
   font-size: 13px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.button:hover {
  font-family: 'Poiret One', cursive;
   border: 1px solid #ffffff;
   text-shadow: #1e4158 0 1px 0;
   background: #808080;
   background: -webkit-gradient(linear, left top, left bottom, from(#f5f5f5), to(#808080));
   background: -webkit-linear-gradient(top, #f5f5f5, #808080);
   background: -moz-linear-gradient(top, #f5f5f5, #808080);
   background: -ms-linear-gradient(top, #f5f5f5, #808080);
   background: -o-linear-gradient(top, #f5f5f5, #808080);
   background-image: -ms-linear-gradient(top, #f5f5f5 0%, #808080 100%);
   color: #fff;
   }
.button:active {
  font-family: 'Poiret One', cursive;
   text-shadow: #051017 0 1px 0;
   border: 1px solid #ebf1f5;
   background: #000000;
   background: -webkit-gradient(linear, left top, left bottom, from(#000000), to(#808080));
   background: -webkit-linear-gradient(top, #000000, #000000);
   background: -moz-linear-gradient(top, #000000, #000000);
   background: -ms-linear-gradient(top, #000000, #000000);
   background: -o-linear-gradient(top, #000000, #000000);
   background-image: -ms-linear-gradient(top, #000000 0%, #000000 100%);
   color: #ffffff;
   }
/* 버튼 css 종료*/   
 
 
div.tb {height:50px; text-align:center; border:0px; #000000; padding-top:15px;}

/* span{height:50px; text-align:center; border-left:solid 1px #000000; padding-top:15px;} */

/* 제목부분 div설정 */
#Div_Top
{
height:130px; 
text-align:center; 
padding-top:30px;
font-weight:bold;
font-size:80px;
text-shadow:1px 1px 3px #666666;
padding:10px 10px 10px;
font-family: 'Poiret One', cursive;
margin-top: 10%;
}

#Div_middle
{
	margin-top: 2%;
	margin-bottom: 3%;
	margin-left:40%;
	margin-right:auto;
	height:auto;
	width:auto;
}
#Div_Bottom{}

#Div_Bottom_1
{
	margin: 1%; 
}
#Div_Bottom_2
{

}

body{
font-family: 'Poiret One', cursive;
vertical-align: middle;
text-align: center;
margin: 0px;
padding: 0px;
}

table
{
	cellpadding:0; 
	cellspacing:0; 
	text-align: center; 
	border: solid;
	
}

td{width:100px;text-align: center;}
#table_td_label{font-weight:bold;}
.table_td_label_ID{letter-spacing: 15px;}

</style>

<script>
function foundIDPASS() 
{
	var  screenW=screen.availWidth;
	var  screenH=screen.availHeight;
	var popW = 500;
	var popH = 200;
	var l=(screenW-popW) / 2 ;
	var t=(screenH-popH) / 2 ;	
	
	url = "idpwSearchNew.do";

	// 새로운 윈도우를 엽니다.
	window.open(url,"get","toolbar=no ,width="+popW+",height="+popH+",left="+l+",top="+t+",directories=+no,status=yes,scrollbars=yes,menubar=no");
}
</script>

<title>로그인</title>
</head>

<body>

<div id="Div_Top" >Web Cell</div>

<!-- 없는 아이디/비밀번호 입력시 팝업창 -->
<c:if test='${fail=="fail"}'>
	<script>
		alert("아이디 혹은 패스워드가 다릅니다.");
	</script>
</c:if>

<!-- 로그인이 되지 않은 경우 -->
<form method="post" action="login.do" name="loginFrom">
<div id="Div_middle">
	<table>
		<tr>
			<td id="table_td_label" class="table_td_label_ID">ID</td>
			<td><input type="text" class="text_login" name="id" placeholder="아이디" required placeholder="ID 입력"></td>
		</tr>
		<tr>
			<td id="table_td_label">PASSWORD</td>
			<td><input type="password" class="text_login" name="password" placeholder="비밀번호" required placeholder="Password 입력"></td>
		</tr>
	</table>
</div>


	<div id="Div_Bottom">
		<div id="Div_Bottom_1">
			<input class="button" type="submit" value="login">
			<input class="button" type="button" value="Join" onclick="javascript:window.location='join.do'">
		</div>
		<div id="Div_Bottom_2">
			<input width="1" class="button" type="button" value="Id·Pw Search" onclick='foundIDPASS()'>
		</div>
	</div>
</form>
</body>
</html>