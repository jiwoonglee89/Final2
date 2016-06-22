<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<style>
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
div.tb {height:50px; text-align:center; border:0px; #000000; padding-top:15px;}
span{height:50px; text-align:center; border-left:solid 1px #000000; padding-top:15px;}
#Web_Cell{
height:130px; 
text-align:center; 
padding-top:30px;
font-weight:bold;
font-size:80px;
text-shadow:1px 1px 3px #666666;
padding:10px 10px 10px;
font-family: 'Poiret One', cursive;
}
#Web_Cell2{
position:absolute;
top:30px;
left:530px;
height:80px; 
text-align:center; 
padding-top:30px;
font-weight:bold;
font-size:80px;
text-shadow:1px 1px 3px #666666;
padding:10px 10px 10px;
font-family: 'Poiret One', cursive;
}
body{
font-family: 'Poiret One', cursive;
}

td{
width:100px;
}
.i{
font-weight:bold;
}
/* #loginPro_div{
	/* position:inherit;
	top:0px; 
	border-width:1px;
	border:1px;
	border-spacing:50px;
	border-width:100px;
} */


#login_id {
	position:absolute;
	border:0px;
	top:150px;
	left:400px;
	font-weight:bold;

}
#logout_button{
	position:absolute;
	border:0px;
	top:150px;
	left:900px;
}

#mypage_button{
	position:absolute;
	border:1px;
	top:150px;
	left:1000px;
}
#list{
position:absolute;
top : 400px;
}

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
<body align="center">
<br><br>
<br><br>
<div id="Web_Cell" >Web Cell</div>
<c:if test='${fail=="fail"}'>
<script>
	alert("아이디 혹은 패스워드가 다릅니다.");
</script>
</c:if>
<c:if test="${id == null}">
	<form method="post" action="login.do" name="loginFrom">
	<center>
	<table width="auto" cellpadding="0" cellspacing="0" align="center" border="0">
	<tr>
		<td align="center" class="i">I &nbsp &nbsp D</td>
		<td align="center"><input type="text" class="text_login" name="id" placeholder="아이디" required placeholder="ID 입력"></td>
	</tr>
	<tr>
		<td align="center" class="i">PASSWORD</td>
		<td><input type="password" class="text_login" name="password" placeholder="비밀번호" required placeholder="Password 입력"></td>
	</tr>
	</table>
	</center>
<br>
<br>
<br>
	
		<div id="idpw"><input class="button" type="submit" value="login">
		<input class="button" type="button" value="regist" onclick="javascript:window.location='join.do'">
	</div><br>
	<div id="idpws"><input width="1" class="button" type="button" value="Id·Pw Search" onclick='foundIDPASS()'></div>

	
	</form>
</c:if>

<c:if test="${id != null }">
				<table width="260" cellpadding="0" cellspacing="0" align="center" border="1">
						<tr>
						<div colspan="2" class="loginPro_div" id="login_Id">${id}님의 엑셀<br></div>
								<form method="post" action="logout.do">
									<input type="submit" value="로그아웃" class="logout_button">
								</form>
						</tr>
						</table>
						<tr>
							<td>
								<input type="button" value="게시글 이동(임시)" onClick="javascript:window.location='board.do'">
							</td>							
							<td>
								<form action="myPage.do">
									<input type="submit" value="나의 정보" class="mypage_button">
								</form>
							</td>
						</tr>
					</table>
				</td>
</c:if>
</body>
</html>