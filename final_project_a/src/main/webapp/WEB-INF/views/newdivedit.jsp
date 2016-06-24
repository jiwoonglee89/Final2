<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"%>

<%@ page isELIgnored="false" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery.battatech.excelexport.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<style type="text/css">
#content
{
	border: 100%,auto;
	border-color: red;
	border: solid;
}

/* 메뉴바 디자인 */
#topMenu {
	height: 30px; /* 메인 메뉴의 높이 */
	width: auto; /* 메인 메뉴의 넓이 */
	box-sizing: border-box; 
	/* 스크롤이 움직여도 메뉴는 고정 */
	position: fixed;  
  	top: 0px;
  	left: 0px;
}

#topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
	list-style-type: none; /* 메인 메뉴 안의 ul 내부의 목록 표시를 없애줌 */
	margin: 0px; /* 메인 메뉴 안의 ul의 margin을 없앰 */
	padding: 0px; /* 메인 메뉴 안의 ul의 padding을 없앰 */
}

#topMenu ul li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
	color: white; /* 글씨 색을 흰색으로 설정 */
	background-color: #3fa338; /* 배경 색을 RGB(2D2D2D)로 설정 */
	float: left; /* 왼쪽으로 나열되도록 설정 */
	line-height: 30px; /* 텍스트 한 줄의 높이를 30px로 설정 */
	vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
	text-align: center; /* 텍스트를 가운데로 정렬 */
	position: relative; /* 해당 li 태그 내부의 top/left 포지션 초기화 */
}

.menuLink, .submenuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
	text-decoration: none; /* a 태그의 꾸밈 효과 제거 */
	display: block; /* a 태그의 클릭 범위를 넓힘 */
	width: 150px; /* 기본 넓이를 150px로 설정 */
	font-size: 12px; /* 폰트 사이즈를 12px로 설정 */
	font-weight: bold; /* 폰트를 굵게 설정 */
	font-family: "Trebuchet MS", Dotum; /* 기본 폰트를 영어/한글 순서대로 설정 */
}

.menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
	color: white;
}

.topMenuLi:hover .menuLink { /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
	color: #ffff00; /* 글씨 색 빨간색 */
	 background-color: rgba( 255, 255, 255, 0.1 ); /* 배경색을 밝은 회색으로 설정 */
	
	
}

.submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */
	color: #2d2d2d; /* 글씨 색을 RGB(2D2D2D)로 설정 */
	background-color: white; /* 배경색을 흰색으로 설정 */
	border: solid 1px black; /* 테두리를 설정 */
	margin-top: -1px; /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설덩 */
}

.longLink { /* 좀 더 긴 메뉴 스타일 설정 */
	width: 190px; /* 넓이는 190px로 설정 */
}

.submenu { /* 하위 메뉴 스타일 설정 */
	position: absolute; /* html의 flow에 영향을 미치지 않게 absolute 설정 */
	height: 0px; /* 초기 높이는 0px로 설정 */
	overflow: hidden; /* 실 내용이 높이보다 커지면 해당 내용 감춤 */
	transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */
	-webkit-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 크롬/사파라ㅣ) */
	-moz-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */
	-o-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */
}

.topMenuLi:hover .submenu { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
	height: 93px; /* 높이를 93px로 설정 */
}

.submenuLink:hover { /* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정 */
	color: red; /* 글씨색을 빨간색으로 설정 */
	background-color: #dddddd; /* 배경을 RGB(DDDDDD)로 설정 */
}





/* 테이블 디자인 */
#address {
	text-transform: uppercase;
}

.divcoll {
	overflow: hidden;
	height: 20px;
	width: 90px;
	/* position:absolute;   */
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.textselect {
	overflow: hidden;
	border-style: solid;
	border-width: 1px;
	word-wrap: break-word;
}

.tdselect {
	border-color: #0100FF;
	/* overflow-x:auto; */
}

table, td, th {
	border-style: solid;
	border-width: 1px;
	border-color: #BCE55C;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
}

tr, td {
	width: 90px;
	height: 22px;
}
</style>
<script>

 
   function submit1(){
	
 		var th = [ "", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
					"L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W",
					"X", "Y", "Z" ];
	
	for (var j = 1; j < 100; j++) {
			for (var i = 1; i < th.length; i++) {
			var kkkiii= $('#'+th[i]+j).text();
				$('#in'+th[i]+j).val(kkkiii);
			}
				
	}
	   
		$('#formtable').submit(); 
	   
   }

function key_event() {
		//엔터
		if (event.keyCode == 13) {
			event.preventDefault();
			var numtdid = $('.tdselect').attr('id').substring(3, 6);
			var sum = Number(numtdid) + 1;
			var stringid = $('.tdselect').attr('id').substring(0, 3) + sum;
			$('.tdselect').attr('class', 'celltd');
			$('.textselect').attr('class', 'divcoll').attr('contentEditable',
					'false');
			$('#' + stringid).attr('class', 'tdselect');
			$('.tdselect > .divcoll').attr('class', 'textselect').attr(
					'contentEditable', 'true').focus();
			$('#address').val(stringid.substring(2, 6));
		}
		//오른쪽 방향키
		 if(event.keyCode == 39){
			 
		
			 var colltdid = $('.tdselect').attr('id').substring(2, 3);
			var rowtdid = $('.tdselect').attr('id').substring(3,6);	
			 var th = [ "", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
							"L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W",
							"X", "Y", "Z" ];
			var or_row_tdid= th.indexOf(colltdid)+1;
		 	var re_row_tdid = th[or_row_tdid];
			var id = 'td'+re_row_tdid+rowtdid;
	
			 $('.tdselect').attr('class','celltd'); 
			 $('.textselect').attr('class','divcoll').attr('contentEditable','false'); 
		 	$('#'+id).attr('class','tdselect');
			$('.tdselect > .divcoll').attr('class', 'textselect').attr(
					'contentEditable', 'true').focus();
			$('#address').val(id.substring(2, 6)); 
		} 
		//왼쪽방향키
		if(event.keyCode==37){
			
			 var colltdid = $('.tdselect').attr('id').substring(2, 3);
				var rowtdid = $('.tdselect').attr('id').substring(3,6);	
				 var th = [ "", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
								"L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W",
								"X", "Y", "Z" ];
				var or_row_tdid= th.indexOf(colltdid)-1;
			 	var re_row_tdid = th[or_row_tdid];
				var id = 'td'+re_row_tdid+rowtdid;
		
				 $('.tdselect').attr('class','celltd'); 
				 $('.textselect').attr('class','divcoll').attr('contentEditable','false'); 
			 	$('#'+id).attr('class','tdselect');
				$('.tdselect > .divcoll').attr('class', 'textselect').attr(
						'contentEditable', 'true').focus();
				$('#address').val(id.substring(2, 6)); 
		}
		//위쪽 방향키
		if(event.keyCode==38){
			var numtdid = $('.tdselect').attr('id').substring(3, 6);
			var sum = Number(numtdid) - 1;
			var stringid = $('.tdselect').attr('id').substring(0, 3) + sum;
			$('.tdselect').attr('class', 'celltd');
			$('.textselect').attr('class', 'divcoll').attr('contentEditable',
					'false');
			$('#' + stringid).attr('class', 'tdselect');
			$('.tdselect > .divcoll').attr('class', 'textselect').attr(
					'contentEditable', 'true').focus();
			$('#address').val(stringid.substring(2, 6));
		}
		//아래쪽 방향키
		if(event.keyCode==40){
			var numtdid = $('.tdselect').attr('id').substring(3, 6);
			var sum = Number(numtdid) + 1;
			var stringid = $('.tdselect').attr('id').substring(0, 3) + sum;
			$('.tdselect').attr('class', 'celltd');
			$('.textselect').attr('class', 'divcoll').attr('contentEditable',
					'false');
			$('#' + stringid).attr('class', 'tdselect');
			$('.tdselect > .divcoll').attr('class', 'textselect').attr(
					'contentEditable', 'true').focus();
			$('#address').val(stringid.substring(2, 6));
			}
	};

	function CreateForm(){
		
		var th = [ "", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
					"L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W",
					"X", "Y", "Z" ];
		
		var tag = '<form id="formtable"  action="save.do" method="post">'
		
		for (var j = 1; j < 100; j++) {
				for (var i = 1; i < th.length; i++) {
				tag += '<input type="hidden" id=in'+th[i]+j+' name='+th[i]+j+' />'
			}
			}
		tag+='</form>'
	
		var divForm1 = document.getElementById("divForm");
		divForm1.innerHTML = tag;

		}
	
		
	function CreateTable() {
		/* 		table 태그 생성 */
		var tag = '<table  cellpadding="0" cellspacing="0" class="view" id="viewtable" readonly="true">'
		/* 		맨 위에줄 ABCD...제목 */
		var th = [ "", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
				"L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W",
				"X", "Y", "Z" ];

		tag += '<thead id="thead">'
		/* 	제목의 수만큼 열을 th태그를 만들고 값을 넣어줌 id를 통해 구별한다. id는 문자열th로 시작해서 th인데스를 합친다*/
		for (var a = 0; a < th.length; a++) {
			tag += '<th id=th'+th[a]+'>' + th[a] + '</th>'
		}
		/*  행을 만들어준다. 아이디는 그냥 행의 번호로 설정한다.  */
		for (var j = 1; j < 100; j++) {

			tag += '<tr id='+j+' class="divrow">'
			/* 셀을 만들어준다. 아이디는 문자열 cell로 시작해서 th인덱스와 행번호와 합친다. */
			for (var i = 0; i < th.length; i++) {
				tag += '<td   class="celltd" id=td'+th[i]+j+'><div   contentEditable="false" id='
						+ th[i]
						+ j
						+ ' onkeyDown="key_event()" class="divcoll" ></div></td>'
			}
			tag += '</tr>'
		}

		tag += '</table>';

		var divTable = document.getElementById("createTable");
		divTable.innerHTML = tag;

	}

	$(document).ready(function() {
		CreateTable();
		CreateForm();
		
/* 		for (var z = 1; z < 100; z++) {
			$('#' + z).val(z);
		}
		 */
		
	
	});

	$(function() {

		$('td', this).click(function() {
			/* 	$('td:not(this)').attr('class', 'celltd');
				$(this).attr("class", "tdselect");
			 */
			$('.tdselect').attr('class', 'celltd');
			$(this).attr('class', 'tdselect');
			var tdid = $(this).attr('id');
			$('#address').val(tdid.substring(2, 5));
		});

		$('.tdselect').keydown(function(e) {
			var tdid = $('.tdselect').attr('id');

		});
		//마우스 더블 클릭시 td select와 div textselect div를 편집할수있게 만들어준다. 
		$('td', this).dblclick(function() {
			$('div').attr('contentEditable', 'false');

			var tableTdId = $(this).attr('id').substring(2, 5);
			/* 		$(this).attr('class','tdselected'); */
			/*  	$('#'+tableTdId).attr('contentEditable','true').focus();  */
			$('.textselect').attr('class', 'divcoll');
			$('#' + tableTdId).attr('class', 'textselect').focus();
			$('.textselect').attr('contentEditable', 'true');

		});

		$('textselect').keydown(function(e) {
			if (e.keyCode == 13) {
				alert('ddd');
			}
		});

		$('#address').keydown(function(e) {
			if (e.keyCode == 13) {
				$('.tdselect').attr('class', 'celltd');
				var address = $('#address').val().toUpperCase();
				$('#address').val().toUpperCase();
				$('#td' + address).attr('class', 'tdselect');
				$('.tdselect > div').attr('contentEditable', 'true').focus();
			}
		});

	});
</script>
</head>
<body>
<div id="content">
<nav id="topMenu">
		<ul>
			<li class="topMenuLi">
				<a class="menuLink" href="">저장</a>
			</li>
			<li>|</li>
			<li class="topMenuLi">
				<a class="menuLink">다운로드</a>
			</li>
			<li>|</li>
			<li class="topMenuLi">
				<a class="menuLink" href="">함수</a>
				<ul class="submenu">
					<li>
						<a href="" class="submenuLink">평균</a>
					</li>
					<li>
						<a href="" class="submenuLink">합계</a>
					</li>
					<li>
						<a href="" class="submenuLink">최대값</a>
					</li>
					<li>
						<a href="" class="submenuLink">최소값</a>
					</li>
				</ul>
			</li>
			<li>|</li>
			<li class="topMenuLi">
				<a class="menuLink"href="">검색</a>
			</li>
			<li>|</li>
			<li class="topMenuLi">
				<a class="menuLink"href="">정렬</a>
				<ul class="submenu">
					<li>
						<a href="" class="submenuLink">오름차순</a>
					</li>
					<li>
						<a href="" class="submenuLink">내림차순</a>
					</li>
				</ul>
			</li>
			<li>|</li>
			<li class="topMenuLi">
				<a class="menuLink"href="">추가</a>
				<ul class="submenu">
					<li>
						<a href="" class="submenuLink">열추가</a>
					</li>
					<li>
						<a href="" class="submenuLink">행추가</a>
					</li>
					<li>
						<a href="" class="submenuLink">시트추가</a>
					</li>
				</ul>
			</li>
			<li>|</li>
			<li class="topMenuLi">
				<a class="menuLink"href="">엑셀목록</a>
			</li>
		</ul>
	</nav>
	</div>
	
	<div id="formulaBar">
		<div class="left" style='float: left'>
			<input type="text" id="address">
		</div>
		<div class="center" style='float: left'>수식</div>
		<div class="right" style='float: left'></div>
	</div>
	
	<div id="createTable"></div>
	<div id="divForm" class="divForm"></div>
	<input type="button" onclick="submit1()" value="저장"/>
	


</body>
</html>