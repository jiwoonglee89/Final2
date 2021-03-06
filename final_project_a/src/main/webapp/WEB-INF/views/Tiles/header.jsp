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

function getFile(){
	$('.filebox').submit();
}


</script>
<style type="text/css">
.filebox input[type="file"] {  /* 파일 필드 숨기기 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
  text-align: center;
}
.loadlabel{
	padding-top: 10px;
}
</style>
</head>
<body>
	<div id="formulaBar" class="jbMenu" style="padding-left: 0px;">
		<ul>
			<li><button onclick="javascript:window.location='save1.do" id="save" class="active">저장</button></li>
			<li><button onclick="javascript:window.location='download.do'">다운로드</button></li>
			<li class="dropdown">
				<button class="dropbtn">함수</button>
				<div class="dropdown-content">
					<button id="more" onclick="txt_average()">평균</button>
					<button id="more" onclick="txt_sum()">합계</button>
					<button id="more" onclick="txt_max()">최대값</button>
					<button id="more" onclick="txt_min()">최소값</button>
					<button id="more" class="modal">더보기</button>
				</div>
			</li>
	
			<li class="dropdown">
				<button class="dropbtn">시트</button>
				<div class="dropdown-content">
					<button id="more" class="add">시트추가</button>
					<button id="more" class="del">시트삭제</button>
				</div>
			</li>
			<li><button onclick="javascript:window.location='board.do'">엑셀목록</button></li>
			<li>
				<div id="search">
					<input type="text" placeholder="검색" name="search_text" size="30" id="search_text"
						onkeypress="javascript:if(event.keyCode==13){findString($('#search_text').val()); return false;}">
				</div>
			</li>
			<li><div class="bar_title">[ 제목 : ${title} ]</div></li>
			<li><div class="bar_title" id="sheet_num">[ ${sheetNum+1}번째시트 ]</div></li>
			<li><div class="bar_title"><label for="load" class="loadlabel" style="color: white;">불러오기</label>
			<form action="load.do"  class="filebox" enctype="multipart/form-data" method="post">
			<input type="file" id="load" name="file" onchange="this.form.submit(); "/>
			</form>
			</div> 
			</li>
			<li id="logout">
				<div class="logout">
					<button class="button"
						onclick="javascript:window.location='logout.do'">Logout</button>
				</div>
			</li>
		</ul>

		<div class="left" style='float: left'>
			<input type="text" id="address" readonly="readonly">
		</div>
		<div class="center" style='float: left'>수식</div>
		<div class="right" style='float: left'>
			<form id="form2" action='formula.do' method='post'>
				<input type="text" id="formula" name="formula1" readonly="readonly"/>
			</form>
		</div>

	</div>

</body>
</html>