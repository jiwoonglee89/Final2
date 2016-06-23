<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value="resources/join.js" />"></script>
<title>회원정보 수정</title>
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
   
	#notice
	{
	color: red;
	text-align: right;
	}
	#title
	{
	position:absolute;
	top:19%;
	left:40%;
	color: red;
	text-align: center;
	}
	#modify_border
	{
	border:1px solid;
	height:80px;
	width:1400px;
	font-family:'Poiret One', cursive;
	}
	#modify_maintext
	{
	position:absolute;
	top:34px;
	left:30px;
	}
	#modify_text
	{
	position:absolute;
	top:30%;
	left:26%;
	}
</style>
</head>
<body onload="disable(${birthY},${birthM},${birthD})">
	<form name="joinF" action="modify.do" method="post" onSubmit="return check()">
			
			<table id="modify_border">
			<tr>
				<td colspan="2" height="39" align="center" bgcolor=""><font
					size="+1"><b id="modify_maintext">Web cell 정보수정</b></font><br>
				</td>
			</tr>
			</table>
			
			
			<div id="title"><sub>[*표시는 필수 입력 사항입니다.]</sub></div>
			<table id="modify_text" style="border-style:dotted; border-color:gray;" height="400" width="600"  cellspacing="0" cellpadding="3" align="center">
			<tr>
				<td width="200" align="center">*Id</td>
				<td width="400">
					<input type="text" name="id" maxlength="30"size="35" readonly="readonly" value="${memberInfo.id}">
				</td>
			</tr>
			<tr>
				<td width="200" align="center">*Password</td>
				<td width="400"><input type="password" name="password"
					maxlength="20" size="25"></td>
			</tr>
			<tr>
				<td width="200" align="center">*Password Check</td>
				<td width="400"><input type="password" name="password2"
					maxlength="20" size="25"></td>
			</tr>
			<tr>
				<td width="200" align="center">*Name</td>
				<td width="400"><input type="text" name="name" maxlength="50"
					size="15" onblur="id_noNumber(this.form)"
					value="${memberInfo.name}"></td>
			</tr>
			<tr>
				<td width="200" align="center">*Birth</td>
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
				<td width="200" align="center">*Phone</td>
				<!-- 전화번호 유효성 검사 재프로그래밍할것 -->
				<td width="400"><input type="text" name="Phone"
					placeholder="-는 제외하고 입력해주세요." maxlength="11" size="20"
					onKeyPress="onlyNumber()" onBlur="onlyNumber2(this)"
					value="${memberInfo.phone}"></td>
			</tr>
			<tr>
				<td width="200" align="center">Email</td>
				<td width="400">
				<input type="text" name="emailID" size="15" maxlength="25" value="${emailID}">@ 
				<input type="text" name="emailAddress" size="10" value="${emailAddress}"> 
				<select name="email" onchange="email_change(this.form)">
						<option value="" selected="selected">이메일주소 선택</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="yahoo.com">yahoo.com</option>
						<option value="1">직접입력</option>
				</select><br>
				<div id="notice"><sub>※이메일 주소를 다시 선택해 주세요.</sub></div>
				</td>
			</tr>
			<tr>
				<td width="200" align="center">*Zipcode</td>
				<td><input type="text" name="zipcode" size="10" readonly
					placeholder="우편번호를 검색." value="${memberInfo.zipcode}">
					<input class="button" type="button" value="우편번호찾기" onClick="zipCheck()">
					<input type="text" name="address" size="50" placeholder="나머지 주소를 적어 주세요"
					value="${memberInfo.address}">.</td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="">
				<input class="button" type="submit" name="confirm" value="정보수정"> 
				<input class="button" type="button" value="수정 취소" onclick="javascript:window.location='board.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>