<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Insert title here</title>
<script src='<c:url value="/resources/formula.js"/>'></script>
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/style.css'/>" type="text/css" media="print, projection, screen" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<style type="text/css">


</style>
<script>
	function page_load(){
		<c:if test="${map!=null}">
		<c:forEach var="m_obj" items="${map}"  varStatus="status">
		
		var a ="${m_obj.key}";
		var b = "${m_obj.value}";
	
		$('#'+a).text(b);
	  
		</c:forEach>
		</c:if> 
	}

	function popup(){
   		var  screenW=screen.availWidth;
  		 var  screenH=screen.availHeight;
  		 var popW = 600;
  		 var popH = 600;
  		 var l=(screenW-popW) / 2 ;
  		 var t=(screenH-popH) / 2 ;
   
  		 url = "join.do";
  		 window.open(url,"get","toolbar=no ,width="+popW+",height="+popH+",left="+l+",top="+t+",directories=+no,status=yes,scrollbars=yes,menubar=no");
   
	}
	
	function span_key_up(){
		
		$('.textselect').keyup(function(e){	
			var a = $('.textselect').attr('id');
			var b = $('.textselect').text();
			$('#exp'+a).text(b);
			$('#formula').val(b);
			$('#exp'+a).attr('class','write');
		
		});
			
	}


	function submit(){
		
		   for (var j = 1; j < 100; j++) {
			   for (var i = 1; i < th.length; i++) {
				   var kkkiii= $('#'+th[i]+j).text();
				   $('#in'+th[i]+j).val(kkkiii);
				   }
			   }
		   
			$('#formtable').submit(); 
	}
	
	function key_event() {

		//수식과 셀 동기화
		span_key_up();
		

		//엔터키
		if(event.keyCode == 13){	
			event.preventDefault();
			submit();
			var numtdid = $('.tdselect').attr('id').substring(3, 6);
			var sum = Number(numtdid) + 1;
			var stringid = $('.tdselect').attr('id').substring(0, 3) + sum;
			var value=$('#inA1').val();
			$('.tdselect').attr('class', 'celltd');
			$('.textselect').attr('class', 'divcoll').attr('contentEditable',
					'false');
			$('#' + stringid).attr('class', 'tdselect');
			$('.tdselect > .divcoll').attr('class', 'textselect').attr(
					'contentEditable', 'true').focus();
			$('#address').val(stringid.substring(2, 6));
			
		}
		
		//오른쪽 방향키
		if (event.keyCode == 39) {
			var colltdid = $('.tdselect').attr('id').substring(2, 3);
			var rowtdid = $('.tdselect').attr('id').substring(3, 6);
			var or_row_tdid = th.indexOf(colltdid) + 1;
			var re_row_tdid = th[or_row_tdid];
			var id = 'td' + re_row_tdid + rowtdid;

			$('.tdselect').attr('class', 'celltd');
			$('.textselect').attr('class', 'divcoll').attr('contentEditable','false');
			$('#' + id).attr('class', 'tdselect');
			$('.tdselect > .divcoll').attr('class', 'textselect').attr('contentEditable', 'true').focus();
			$('#address').val(id.substring(2, 6));
		}
		//왼쪽방향키
		if (event.keyCode == 37) {
			var colltdid = $('.tdselect').attr('id').substring(2, 3);
			var rowtdid = $('.tdselect').attr('id').substring(3, 6);
			var or_row_tdid = th.indexOf(colltdid) - 1;
			var re_row_tdid = th[or_row_tdid];
			var id = 'td' + re_row_tdid + rowtdid;

			$('.tdselect').attr('class', 'celltd');
			$('.textselect').attr('class', 'divcoll').attr('contentEditable',
					'false');
			$('#' + id).attr('class', 'tdselect');
			$('.tdselect > .divcoll').attr('class', 'textselect').attr(
					'contentEditable', 'true').focus();
			$('#address').val(id.substring(2, 6));
		}
		//위쪽 방향키
		if (event.keyCode == 38) {
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
		if (event.keyCode == 40) {
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
	
	//함수식 저장
	function expressionDiv(){
	
		
		var tag ="";
		
		/*  행을 만들어준다. 아이디는 그냥 행의 번호로 설정한다.  */
		for (var j = 1; j <= 100; j++) {
			for (var i = 0; i < th.length; i++) {
				tag += '<span id=exp'
						+ th[i]
						+ j
						+ '  class="exp_divcoll" ></span>'
			}
		}
		
		
		var expression = document.getElementById("expression_Div");
		expression.innerHTML = tag;
		
		
		
	}
	//저장 폼 생성
	function createForm() {

		var tag = '<form id="formtable"  action="save1.do" method="post">'

		for (var j = 1; j < 100; j++) {
			for (var i = 1; i < th.length; i++) {
				var val = th[i] + j;
				tag += '<input type="hidden" id=in'+th[i]+j+' name='+th[i]+j+' />'
			}
		}
		tag += '</form>'

		var divForm1 = document.getElementById("divForm");
		divForm1.innerHTML = tag;

	}

	/* thead 생성 */
	function createTable() {
		var tag = "<thead id='thead' style='position:fixed;'><tr>"
		/* 	제목의 수만큼 열을 th태그를 만들고 값을 넣어줌 id를 통해 구별한다. id는 문자열th로 시작해서 th인데스를 합친다*/
		for (var a = 0; a < th.length; a++) {
			tag += '<th id=th'+th[a]+'><div style="width:90px;">' + th[a] + '</div></th>'
		}
		tag += "</tr></thead>"
		tag += "<tbody>"
			for (var j = 1; j <= 100; j++) {
				tag += '<tr id='+j+' class="divrow">'
				/* 셀을 만들어준다. 아이디는 문자열 cell로 시작해서 th인덱스와 행번호와 합친다. */
				for (var i = 0; i < th.length; i++) {
					tag += '<td class="celltd" id=td'+th[i]+j+'><div contentEditable="false" id='
							+ th[i]
							+ j
							+ ' onkeyDown="key_event()" class="divcoll"></div></td>'
				}
				tag += '</tr>'
			}
		tag+= "</tbody>"
		
		var Thead = document.getElementById("viewtable");
		Thead.innerHTML = tag;

	}
	//셀 클릭시 셀값 자동 추가
	function one_click(divId){
		if($('.textselect' ).text().search('=')!=-1  ){  
		
			if(divId != $('.textselect').attr('id') ){
			
	/* 			var tselect_Id = $('.textselect').attr('id'); */
				
				var tx = $('.textselect').text();
			
		$('.textselect').text(tx+divId).focus(); 
		 		
			}
		}
	}
	
	
	$(document).ready(function() {
		/* head body 생성 */
		createTable()
		createForm();
		expressionDiv()
		for (var z = 1; z < 100; z++) {
			$('#' + z).val(z);
		}
		/* 헤더고정 */
		 var jbOffset = $('.jbMenu').offset();
		 $(window).scroll(function() {
			if ($(document).scrollLeft() > jbOffset.left) {
				$('.jbMenu').addClass('jbFixed');
				$('.jbMenu2').addClass('jbFixed2');
				$('.jbContent').addClass('jbMove');
			} else {
				$('.jbMenu').removeClass('jbFixed');	
				$('.jbMenu2').removeClass('jbFixed2');
				$('.jbContent').removeClass('jbMove');
			}
		});
		 
		page_load();
	});
	
	$(function() {
		//체크해야함
		$('td', this).click(function() {
			$('.tdselect').attr('class', 'celltd');
			$(this).attr('class', 'tdselect');
			var tdid = $(this).attr('id');
			$('#address').val(tdid.substring(2, 5));
			var div = $('.tdselect > div').text();
			var divId = $("#"+tdid+">div").attr('id');
			
			one_click(divId);
			//$('#formula').val(divVal);

			if($('#'+divId).attr('contentEditable') == "true"){

				if($('#exp'+divId).text() !=""){
					var expression = $('#exp'+divId).text();
					$('#formula').val(expression);
					
				} 
 				if($('#exp'+divId).text() == ""){
					var textselect1 = $('.textselect').text();
					$('#formula').val(textselect1);
				}
			}	
			
		});

		$('.tdselect').keydown(function(e) {
			var tdid = $('.tdselect').attr('id');

		});
		//마우스 더블 클릭시 td select와 div textselect div를 편집할수있게 만들어준다. 
		$('td', this).dblclick(function() {
			$('div').attr('contentEditable', 'false');

			var tableTdId = $(this).attr('id').substring(2, 5);
			$('.textselect').attr('class', 'divcoll');
			$('#' + tableTdId).attr('class', 'textselect').focus();
			$('.textselect').attr('contentEditable', 'true');
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
	<div class="jbContent" style="width:2000px; height:800px; ">
		<table cellpadding="0" cellspacing="0" class="view" id="viewtable" style='float: left'>
		</table>
	</div>
	<div id="divForm"></div>
	<span id="expression_Div" class="expression_class_Div"></span>
</body>
</html>