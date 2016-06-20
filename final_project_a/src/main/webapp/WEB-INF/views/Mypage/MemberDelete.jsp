<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 페이지</title>
<style>
#title
{
	text-align: center;
}
.button {
   border: 2px solid #000000;
   background: #ffffff;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff));
   background: -webkit-linear-gradient(top, #ffffff, #ffffff);
   background: -moz-linear-gradient(top, #ffffff, #ffffff);
   background: -ms-linear-gradient(top, #ffffff, #ffffff);
   background: -o-linear-gradient(top, #ffffff, #ffffff);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #ffffff 100%);
   padding: 5.5px 11px;
   -webkit-border-radius: 0px;
   -moz-border-radius: 0px;
   border-radius: 0px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #ffffff 0 1px 0;
   color: #000000;
   font-size: 12px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   width:150px;
   
   }
.button:hover {
   border: 2px solid #000000;
   text-shadow: #ffffff 0 1px 0;
   background: #8f8f8f;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#8f8f8f));
   background: -webkit-linear-gradient(top, #ffffff, #8f8f8f);
   background: -moz-linear-gradient(top, #ffffff, #8f8f8f);
   background: -ms-linear-gradient(top, #ffffff, #8f8f8f);
   background: -o-linear-gradient(top, #ffffff, #8f8f8f);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #8f8f8f 100%);
   color: #fff;
   }
.button:active {
   text-shadow: #ffffff 0 1px 0;
   border: 2px solid #0a3c59;
   background: #000000;
   background: -webkit-gradient(linear, left top, left bottom, from(#000000), to(#8f8f8f));
   background: -webkit-linear-gradient(top, #000000, #000000);
   background: -moz-linear-gradient(top, #000000, #000000);
   background: -ms-linear-gradient(top, #000000, #000000);
   background: -o-linear-gradient(top, #000000, #000000);
   background-image: -ms-linear-gradient(top, #000000 0%, #000000 100%);
   color: #fff;
   }

</style>
</head>
<body>
<form>
<table border="1" width="400">
<th id="title" colspan="2">회원 탈퇴 화면</th>
<tr>
	<td>비밀번호</td>
	<td><input type="text" size="40" maxlength="40"></td>
</tr>
</table>
<table border="1" width="400">
<tr>
	<div colspan="2">
		<td colspan="2">
		<center><input type="submit" value="탈퇴하기" class="button"></center>
	</td>
	</div>
</tr> 
</table>
</form>
</body>
</html>