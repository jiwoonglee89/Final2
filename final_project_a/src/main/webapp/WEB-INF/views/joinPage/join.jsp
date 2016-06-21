 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script src="<c:url value="resources/join.js" />"></script>
<title>Web Cell Join Page</title>
<link href='https://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<style>
.Web {
height:170px;
padding-top:30px;
font-weight:bold;
font-size:80px;
text-shadow:1px 1px 3px #666666;
padding:10px 10px 10px;
font-family: 'Poiret One', cursive;
}
.font_i{
font-size:17px;
text-shadow:1px 1px 3px #666666;
font-family: 'Poiret One', cursive;
}
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
   
   #input_table{
   position:absolute;
 left: 425px;
 top:250px;
   }
   #btn_table{
   position:absolute;
   top:520px;
   left:635px;
   }
   #div_text{
   position:absolute;
   top:200px;
   left:635px;
   }
   
</style>
<meta charset="UTF-8">
<script src="<c:url value="resources/join.js" />"></script>
<title>Web Cell Join Page</title>
<br><br>
</head>
<body onload="disable()">
	  <form name="joinF" action="join.do" method="post" onSubmit="return check()">
		<table width="600" border="0" cellspacing="0" cellpadding="3" align="center">
			<tr>
				<td colspan="2" height="39" align="center" bgcolor="">
				<font size="+1"><b class="Web">Web Cell Regist</b></font></td>
			</tr>
			</table>
		<br>
<br>
		<div id="div_text"><font color="red" size="-1">[*표시는 필수 입력 사항입니다.]</font></div>

<br>
			<table border="0" hight="50" id="input_table">
				<tr>
				<td width="200" align="center" class="font_i">*Id</td>
				<td width="400">
					<input type="text" name="id" maxlength="20" size="25" style="ime-mode:inactive" onblur="id_nohan(this.form)" border="1px">
					<input type="button" class="button" name="confirm_id" value="ID Check" OnClick="openConfirmid()">
					<input type="hidden" name="confirm_ok"  value="no">
				</td>
			</tr>
			<tr>
				<td width="200" align="center" class="font_i">*Password</td>
				<td width="400">
					<input type="password" name="password1" maxlength="20" size="25">
				</td>
			</tr>
			<tr>
				<td width="200" align="center" class="font_i">*Confirm Password</td>
				<td width="400">
					<input type="password" name="password" maxlength="20" size="25">
				</td>
			</tr>
			<tr>
				<td width="200" align="center" class="font_i">*Name</td>
				<td width="400">
					<input type="text" name="name" maxlength="20" size="25" onblur="id_noNumber(this.form)">
				</td>
			</tr>
			<tr>
				<td width="200" align="center" class="font_i">*Date of Birth</td>
				<td width="200">
					
					<select name="birthY">
					<jsp:useBean id="YEAR" class="java.util.Date" />
					<fmt:formatDate value="${YEAR}" pattern="yyyy" var="current_year"/>
						<c:forEach var="year" begin="1900" end="${current_year}" step="1">
							<option value="${year}">${year}</option>
						</c:forEach>
					</select>
					<select name="birthM">
						<c:forEach var="month" begin="1" end="12" step="1">
							<option value="${month}">${month}</option>
						</c:forEach>
					</select>
					<select name="birthD">
						<c:forEach var="day" begin="1" end="31" step="1">
							<option value="${day}">${day}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
			<!-- 전화번호 유효성 검사 재프로그래밍할것 -->
				<td width="200" align="center" class="font_i">*Cell Phone</td>
				<td width="400">
					<input type="text" name="phone" placeholder="-는 제외하고 입력해주세요." maxlength="11" size="20" onKeyPress="onlyNumber()" onBlur="onlyNumber2(this)"> 
				</td>
			</tr>
			<tr>
				<td width="200" align="center" class="font_i">Email</td>
				<td width="400">
					<input type="text" name="emailID" size="15"  maxlength="25">@
					<input type="text" name="emailAddress" size="10" >
					<select name=email  onchange="email_change(this.form)" >
							<option value="" selected="selected">이메일주소 선택</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="yahoo.com">yahoo.com</option>
							<option value="1">직접입력</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="200" align="center" class="font_i">*Zip code</td>
				<td>
					<input type="text" name="zipcode" size="10" readonly placeholder="우편번호를 검색.">
					<input type="button" class="button" value="ZipCheck" onClick="zipCheck()">
					<input type="text" name="address" size="50" placeholder="나머지 주소를 적어 주세요">.
				</td>
			</tr>
			<table id="btn_table">
			<tr>
				<td colspan="2" align="center" bgcolor="">
					<input type="submit"name="confirm" class="button" value="Enrollment"> 
					<input type="reset"name="reset" class="button" value="Rekey">
					 <input type="button" class="button" value="Do not join" onclick="javascript:window.location='loginForm.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>