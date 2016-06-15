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
height:170px; 
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
.button{

}
</style>
<script>
function openConfirmid() {
	// 아이디를 입력했는지 검사
	 {
		// url과 사용자 입력 id를 조합합니다.
		url = "idpwSearchNew.do";

		// 새로운 윈도우를 엽니다.
		open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");

	}
}
</script>
<title>로그인</title>
</head>
<body align="center">
<br><br>
<br><br>
<div id="Web_Cell" >Web Cell</div>
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
	<div id="idpws"><input width="1" class="button" type="button" value="Id·Pw Search" onclick='openConfirmid()'></div>

	
	</form>
</c:if>

<c:if test="${id != null }">
				<table width="260" cellpadding="0" cellspacing="0" align="center" border="1">
						<tr>
							<td rowspan="3" align="center">${id}님이<br> 방문하셨습니다
								<form method="post" action="logout.do">
									<input type="submit" value="로그아웃">
								</form>
								<form method="post" action="list.do">
									<input type="submit" value="나의 정보">
								</form>
							</td>
						</tr>
					</table>
				</td>
</c:if>
</body>
</html>