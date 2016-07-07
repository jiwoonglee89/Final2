<%@page import="java.net.URL"%>
<%@page import="org.apache.tiles.request.locale.URLApplicationResource"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<link rel="stylesheet" href='<c:url value="/resources/style.css"/>'
	type="text/css" media="print, projection, screen" />
<script>
/* 검색어 함수 */
var TRange=null;
function findString (str) {
	if (parseInt(navigator.appVersion)<4)
		return;
	var strFound;
	if (window.find) {
		strFound=self.find(str);
  		if (!strFound) {
   			strFound=self.find(str,0,1);
   		while (self.find(str,0,1)) 
   			continue;
  		}
 	}
	else if (navigator.appName.indexOf("Microsoft")!=-1) {
		if (TRange!=null) {
   			TRange.collapse(false);
   			strFound=TRange.findText(str);
   			if (strFound) 
   				TRange.select();
  		}
  		if (TRange==null || strFound==0) {
   			TRange=self.document.body.createTextRange();
   			strFound=TRange.findText(str);
   			if (strFound) 
   				TRange.select();
  		}
 	}
 	else if (navigator.appName=="Opera") {
  		alert ("Opera browsers not supported, sorry...")
  	return;
 	}
 	if (!strFound) 
 		alert ("String '"+str+"' not found!")
 	return;
}


//함수 더보기 클릭시 뜨는 DIV창
$(document).ready(function()
{
	$("button.modal").click(
		function()
		{
			$("#glayLayer").show();
			$("#overLayer").show();
		}
	);
	
});

</script>
<style>
.button1 {
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
.button1:hover {
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
.button1:active {
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

</style>
</head>
<body>
	<div id="formulaBar" class="jbMenu" style="padding-left: 0px;">
		<ul>
			<li><button onclick="submit()" class="active">저장</button></li>
			<li><button onclick="download.do">다운로드</button></li>
			<li class="dropdown">
				<button class="dropbtn">함수</button>
				<div class="dropdown-content">
					<button id="more">평균</button>
					<button id="more">합계</button>
					<button id="more">최대값</button>
					<button id="more">최대값</button>
					<button id="more" class="modal">더보기</button>
				</div>
			</li>
	
			<li class="dropdown">
				<button class="dropbtn">시트</button>
				<div class="dropdown-content">
					<button id="more">시트추가</button>
					<button id="more">시트삭제</button>
				</div>
			</li>
			<li><button onclick="javascript:window.location='board.do'">엑셀목록</button></li>
			<li><button onclick="javascript:window.location='board.do'">불러오기</button></li>
			<li>
				<div id="search">
					<input type="text" placeholder="검색" name="search_text" size="30" id="search_text"
						onkeypress="javascript:if(event.keyCode==13){findString($('#search_text').val()); return false;}">
				</div>
			</li>
			<li><div class="bar_title">[ 제목 : ${title} ]</div></li>
			<li id="logout">
				<div class="logout">
					<button class="button1"
						onclick="javascript:window.location='logout.do'">Logout</button>
				</div>
			</li>
		</ul>

		<div class="left" style='float: left'>
			<input type="text" id="address">
		</div>
		<div class="center" style='float: left'>수식</div>
		<div class="right" style='float: left'>
			<form id="form2" action='formula.do' method='post'>
				<input type="text" id="formula" name="formula1" />
			</form>
		</div>

	</div>

</body>
</html>