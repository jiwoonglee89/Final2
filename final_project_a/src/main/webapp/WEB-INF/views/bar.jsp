<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
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
function popupOpen()
{
	if(document.all.popup.style.visibility=="hidden")
		{
			document.all.popup.style.visibility="visible";
			return false;
		}
	else
		{
			document.all.popup.style.visibility="hidden";
			return false;
		}
	
}

$(function(){
	$("body").append("<div id='glayLayer'></div><div id='overLayer'></div>");
	
	$('#close').click(function() {
        $('#glayLayer').hide();
        $("#overLayer").hide();
        return;
      });
	
	$("#glayLayer").click(function(){
		$(this).hide()
		$("#overLayer").hide();
	});
	
	$("button.modal").click(function(){
		$("#glayLayer").show();
		$("#overLayer").show().html("<form><div id='all'><div id='top'><button id='close'>X</button></div><div id='content'>body</div><div id='bottom'>footer</div></div></form>");
		return false;
	});
	
/* 	if($.browser.msie && $.browser.version<7){
		$(window).scroll(function(){
			$("#glayLayer").css('top',$(document).scrollTop());
			$("#overLayer").css('top',($(document).scrollTop()+$(window).height()/2) +"px");
		});
	} */
	
});

</script>
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
   padding: 4px 8px;
   -webkit-border-radius: 0px;
   -moz-border-radius: 0px;
   border-radius: 0px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #ffffff 0 1px 0;
   color: #000000;
   font-size: 10px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.button:hover {
   border: 1px solid #ffffff;
   text-shadow: #ffffff 0 1px 0;
   background: #919191;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#919191));
   background: -webkit-linear-gradient(top, #ffffff, #919191);
   background: -moz-linear-gradient(top, #ffffff, #919191);
   background: -ms-linear-gradient(top, #ffffff, #919191);
   background: -o-linear-gradient(top, #ffffff, #919191);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #919191 100%);
   color: #fff;
   }
.button:active {
   text-shadow: #000000 0 1px 0;
   border: 1px solid #ffffff;
   background: #000000;
   background: -webkit-gradient(linear, left top, left bottom, from(#000000), to(#919191));
   background: -webkit-linear-gradient(top, #000000, #000000);
   background: -moz-linear-gradient(top, #000000, #000000);
   background: -ms-linear-gradient(top, #000000, #000000);
   background: -o-linear-gradient(top, #000000, #000000);
   background-image: -ms-linear-gradient(top, #000000 0%, #000000 100%);
   color: #fff;
   }
   
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #3fa338;
}

li {
    float: left;
    border-right: 1.5px solid #bbb;
}

li a, .dropbtn{
    display: inline-block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-family:'Poiret One', cursive;
}

li a:hover, .dropdown:hover .dropbtn{
    background-color: rgba( 255, 255, 255, 0.5 );
}

li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a{ 
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
    font-family:'Poiret One', cursive;
}

.dropdown-content a:hover{background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}

#more
{
    /* color: black; */
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
    border: none;
    width: 100%;
    background: white;
    font-size: medium;
}

/* 함수 더보기 외부 디자인 */ 
div#glayLayer{
	display:none;
	position:fixed;
	left:0;
	top:0;
	height:100%;
	width:100%;
	background:black;
	filter:alpha(opacity=60);
	opacity: 0.60;
}
* html div#glayLayer{
	position:absolute;
}
#overLayer{
	display:none;
	position: fixed;
	top:50%;
	left:50%;
	margin-top:-244px;
	margin-left:-325px;
}
* html #overLayer{
	position: absolute;
}
/* 함수 더보기 내부 디자인 */
#all
{
background-color: white;
width: 500px;
height: 500px;
}
#top
{
  background-color: #46CCFF;
  height: 5%;
  width:100%;
  float: right;
  border: 5px;
  
  
}
#close
{
	background-color: red;
	width: 20px;
	height: auto;
	text-align: center;
	float: right;
	margin: 3px;
}
#top.title
{
	float: middle;
	text-align: center;
	width: auto;
	height: auto;
}
#content
{

}
#bottom
{

}
#search_text
{
	position:absolute;
	top:21px;
	left:500px;
	text-align:center;
}
.button
{
	position:absolute;
	top:21px;
	left:1300px;
}
.bar_title
{
	position:absolute;
	top:22px;
	left:800px;
	font-family:'Poiret One', cursive;
}
</style>
</head>
<body>

<ul>
  <li><a class="active" href="#">저장</a></li>
  <li><a href="download.do">다운로드</a></li>
  <li class="dropdown">
    <a href="#" class="dropbtn">함수</a>
    <div class="dropdown-content">
      <a href="#">평균</a>
      <a href="#">합계</a>
      <a href="#">최대값</a>
      <a href="#">최대값</a>
  	  <button id="more" onclick="" class="modal">더보기</button>
    </div>
  </li>
 <li class="dropdown">
    <a href="#" class="dropbtn">정렬</a>
    <div class="dropdown-content">
      <a href="#">오름차순</a>
      <a href="#">내림차순</a>
    </div>
  </li>
   <li class="dropdown">
    <a href="#" class="dropbtn">추가</a>
    <div class="dropdown-content">
      <a href="#">행추가</a>
      <a href="#">열추가</a>
      <a href="#">시트추가</a>
    </div>
  </li>
  <li><a href="board.do">엑셀목록</a></li>
  <li id="search"><div id="search"><input type="text" placeholder="검색" name="search_text" id="search_text" size="20" onkeypress=
	  "javascript:if(event.keyCode==13){findString($('#search_text').val()); return false;}"></div></li>
  <div class="bar_title">${title}</div>
  
  <li><button class="button" onclick="javascript:window.location='logout.do'">Logout</button></li>
</ul>
</body>
</html>