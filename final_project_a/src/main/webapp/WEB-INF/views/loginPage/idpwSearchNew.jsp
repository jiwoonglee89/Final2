<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value="resources/join.js" />"></script>
<script src="<c:url value="resources/zipcheck.js" />"></script>
<title>아이디 비밀번호 찾기</title>
<link href='https://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<style>
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
#find
{
	min-height:320px;
}
.title_find 
{
	margin:0 auto; margin: 11px; font-size: 28px; color: #4C4C4C;
}
#find_id_result 
{
	min-height: 600px; margin: 0 auto; margin-top: 250px;
}
#Search_id
{
	font-family:'Poiret One', cursive;
}
#Search_pw
{
	font-family:'Poiret One', cursive;
}
</style>

<script>

$(function(){
   //open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
   $("#submit_find_id").click(function(){
      if($("#name").val()=="") {
         alert("이름을 입력해 주세요.");
         $("#name").focus();
   } else {
   	
      if($("#phone").val()=="") {
         alert("핸드폰 번호를 입력해 주세요.");
         $("#phone").focus();
      }
   } else{
         $("#idSearch").submit();
      }
   });


   $("#submit_find_password").click(function(){
      if($("#id").val()=="") {
         alert("아이디를 입력해 주세요.");
         $("#id").focus();
   } else{
      if($("#phone").val()=="") {
         alert("핸드폰 번호를 입력해 주세요.");
         $("#phone").focus();
         }
   } else {
      if($("#birth").val()=="") {
         alert("생년원일을 입력해 주세요.");
         $("#birth").focus();
      }
   } else {
         $("#pwSearch").submit();
      }
   });

});

function resizeWind(win)
{
	//30 과 40은 넉넉하게 하려는 임의의 값임
	var wid = win.document.body.offsetWidth + 30;
	var hei = win.document.body.offsetHeight + 40;        
	win.resizeTo(wid,hei);
}

</script>
</head>
<body onload="resizeWind(this)">

<c:if test="${message!=null}">
   <c:if test="${message=='errorPhone'}">
      <script>alert("일치하는 핸드폰 번호가 없습니다"); $("#phone").focus();</script>
   </c:if>
   <c:if test="${message=='incorrect'}">
      <script>alert("일치하는 정보가 없습니다"); $("#id").focus();</script>
   </c:if>
</c:if>
<div id="find" >

	<form  name="idSearch" id="idSearch" action="idSearch.do">
	<table width="300" border="1" cellspacing="0" cellpadding="3" align="center">
	<tr>
		<td id="Search_id" colspan="2" height="39" align="center" bgcolor="">
		<font size="+1"><b>ID</b></font><br><font color="black" align="center" size="-1"></font>
		</td>
	</tr>
	<tr>
				<td colspan="2" height="39" align="center" bgcolor="" width="300" width="300">
					<div id="find_id"></div>
					<div class="size_long" id="divname"><input type="text" class="text_login" id="name" name="name" maxlength="12" placeholder="이름"></div>
					<div class="size_long" id="divphone"><input type="text" class="text_login" id="phone" name="phone" maxlength="12" placeholder="핸드폰번호(01012345678)"></div>
					<input id="submit_find_id" class="button" type="submit" name="confirm_id" value="check">
				</td>
			</tr>
		</table>
	</form>
	<form action="pwSearch.do" name="pwSearch" id="pwSearch">
		<table width="300" border="1" cellspacing="0" cellpadding="3" align="center">
		<tr>
			<td id="Search_pw" colspan="2" height="39" align="center" bgcolor="">
			<font size="+1"><b>PASSWORD</b></font><br><font color="black" align="right" size="-1"></font>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="39" align="center" bgcolor="" width="300">
				<div id="find_password"></div>
				<div class="size_long" id="divid"><input type="text" class="text_login" id="id" name="id" maxlength="12" placeholder="아이디"></div>
				<div class="size_long" id="divphone"><input type="text" class="text_login" id="phone" name="phone" maxlength="12" placeholder="핸드폰 번호(01012345678)"></div>
				<div class="size_long" id="divbirth"><input type="text" class="text_login" id="birth" name="birth" maxlength="12" placeholder="생년월일"></div>
				<input id="submit_find_password" class="button" type="submit" name="confirm_password" value="check">
			
			</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>