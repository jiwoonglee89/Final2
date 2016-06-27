<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Insert title here</title>
<script src='<c:url value="resources/formula.js"/>'></script>
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>

<style type="text/css">
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
	background-color: #CDCDCD;
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
function submit(){
	
	   for (var j = 1; j < 100; j++) {
		   for (var i = 1; i < th.length; i++) {
			   var kkkiii= $('#'+th[i]+j).text();
			   $('#in'+th[i]+j).val(kkkiii);
			   }
		   }
	   
		$('#formtable').submit(); 
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


	function key_event() {
		
		//수식과 셀 동기화
		span_key_up();
		//엔터
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
		 if(event.keyCode == 39){
			 var colltdid = $('.tdselect').attr('id').substring(2, 3);			
			 var rowtdid = $('.tdselect').attr('id').substring(3,6);	
			 var or_row_tdid= th.indexOf(colltdid)+1;
		 	 var re_row_tdid = th[or_row_tdid];
			 var id = 'td'+re_row_tdid+rowtdid;
	
			 $('.tdselect').attr('class','celltd'); 
			 $('.textselect').attr('class','divcoll').attr('contentEditable','false'); 
		 	 $('#'+id).attr('class','tdselect');
			 $('.tdselect > .divcoll').attr('class', 'textselect').attr('contentEditable', 'true').focus();
			 $('#address').val(id.substring(2, 6)); 
		} 
		//왼쪽방향키
		if(event.keyCode==37){
			 var colltdid = $('.tdselect').attr('id').substring(2, 3);
				var rowtdid = $('.tdselect').attr('id').substring(3,6);	
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
//저장 폼 생성
function createForm(){
		
		var tag = '<form id="formtable"  action="save1.do" method="post">'
		
		for (var j = 1; j < 100; j++) {
				for (var i = 1; i < th.length; i++) {
					var val=th[i]+j;
				tag += '<input type="hidden" id=in'+th[i]+j+' name='+th[i]+j+' />'
			}
		}
		tag+='</form>'
	
		var divForm1 = document.getElementById("divForm");
		divForm1.innerHTML = tag;

		}
	
	/* thead 생성 */
	function createThead(){
	
		var tag = "";
			/* 	제목의 수만큼 열을 th태그를 만들고 값을 넣어줌 id를 통해 구별한다. id는 문자열th로 시작해서 th인데스를 합친다*/
			for (var a = 0; a < th.length; a++) {
				tag += '<th id=th'+th[a]+'>' + th[a] + '</th>';
			
			}
			var Thead = document.getElementById("createThead");
			Thead.innerHTML = tag;
		
	}
	/* tbody생성 */
	function createTbody(){
		var tag ="";
		
			/*  행을 만들어준다. 아이디는 그냥 행의 번호로 설정한다.  */
			for (var j = 1; j <= 100; j++) {
				tag += '<tr id='+j+' class="divrow">'
				/* 셀을 만들어준다. 아이디는 문자열 cell로 시작해서 th인덱스와 행번호와 합친다. */
				for (var i = 0; i < th.length; i++) {
					tag += '<td   class="celltd" id=td'+th[i]+j+'><div   contentEditable="false" id='
							+ th[i]
							+ j
							+ ' onkeyDown="key_event()" class="divcoll" ondrag="drag(this,e)" ondrop="drop(this,e)" ></div></td>'
				}
				tag += '</tr>'
			}
			
			
			var Tbody = document.getElementById("createTbody");
			Tbody.innerHTML = tag;
	}
	
	
	
	
	function page_load(){
		<c:if test="${map!=null}">
		<c:forEach var="m_obj" items="${map}"  varStatus="status">
		
		var a ="${m_obj.key}";
		var b = "${m_obj.value}";
		
		$('#'+a).text(b);
		  
	</c:forEach>
	</c:if> 
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
		createThead();
		createTbody();
		createForm();
		for (var z = 1; z < 100; z++) {
			$('#' + z).val(z);
		}
		/* 헤더고정 */
		var jbOffset = $( '.jbMenu' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.jbMenu' ).addClass( 'jbFixed' );
          }
          else {
            $( '.jbMenu' ).removeClass( 'jbFixed' );
          }
        });
        page_load();
        
        
        
	});
	$(function() {
		
		$('td', this).click(function() {
			$('.tdselect').attr('class', 'celltd');
			$(this).attr('class', 'tdselect');
			var tdid = $(this).attr('id');
			$('#address').val(tdid.substring(2, 5));
			 var div = $('.tdselect > div').text();
			$('#formula').val(div);
			var divVal = $('.tdselect > div').text();
			var divId = $("#"+tdid+">div").attr('id');
			
			one_click(divId);
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
			$('.textselect').attr('ondrag', 'drag(this, event)');

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


<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href=<c:url value="resources/style.css"/> type="text/css" media="print, projection, screen" />
</head>
<body >
	

	<!-- 테이블 재설정 -->
	<br>
	<div id="formulaBar" class="jbMenu" style="padding-left:0px;">
		<div class="top" style='float: left'>
		<form >
			<input type="submit" value="함수">
			</form>
		<input type="button" onclick="submit1()" value="저장"/>
		
		</div><br/><br/>
		<div class="left" style='float: left'>
			<input type="text" id="address">
		</div>
		<div class="center" style='float: left'>수식</div>
		<div class="right" style='float: left'>
		<form id="form2" action='formula.do' method='post'>
			<input type="text" id="formula" name="formula1"/>
			</form>
		</div>
	</div>
	<div class="jbContent">
	<table cellpadding="0" cellspacing="0" class="view" id="viewtable" readonly="true">
		<thead id="createThead">
		</thead>
		<tbody id="createTbody">
		</tbody>
	</table>
	</div>
<div id="divForm"></div>

</body>
</html>
