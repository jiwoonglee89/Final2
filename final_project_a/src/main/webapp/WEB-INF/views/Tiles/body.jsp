<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Insert title here</title>
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src='<c:url value="/resources/formula.js"/>'></script>
<script src='<c:url value="/resources/sorter.js"/>'></script>
<link rel="stylesheet" href="<c:url value='/resources/style.css'/>"
	type="text/css" media="print, projection, screen" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<style type="text/css">
.ctrl_tdselect {
	border: 1px dashed black;
}

.shift_tdselect {
	border: 1px dashed red;
}
</style>
<script>
	function formula_down(){
		$('#formula').keyup(function(){
			
			var a = $('#formula').val();
			$('.textselect').text(a);
		});
		
		
	}
	function download(){
		$('#formtable').attr('action','download.do');
		submit();
		$('#formtable').attr('action', 'save1.do');
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
			
			var url= "<c:url value='/save.do'/>"
			for (var j = 1; j <= 100; j++) {
				   for (var i = 1; i <= th.length; i++) {
					   var value= $('#'+th[i]+j).text();
					   $('#in'+th[i]+j).val(value);
				   }
			}
			
			/* $('#sheetNum').val(sheetNum); */
			var params = $("form[name=formtable]").serialize();
			$.ajax({
				type:"post"
				,url:url
				,data:params
				,dataType:"json"
				,success: function (rs){
					for(var i=0;i<rs.cell_value.length;i++){
						$('#'+rs.cell_name[i]).text(rs.cell_value[i]);
					} 
				}
				,error:function(request, status, error){
					alert("code:"+request.status+"\n"+request.responseText+"\n"+"error:"+error);
				}
			});
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
			shift_tdselect_false();
			
		}
		
	};
	

	
	
	//저장 폼 생성
	function createForm() {
		//파라미터로 sheetNum, title 넘겨줌
		var tag = '<form id="formtable" name="formtable" action="save1.do" method="post">'
		for (var j = 1; j < 100; j++) {
			for (var i = 1; i < th.length; i++) {
				var val = th[i] + j;
				tag += '<input type="hidden" id=in'+th[i]+j+' name='+th[i]+j+' />'
			}
		}
		tag += '<input type="hidden" id="totalsheetNum" name="totalsheetNum"/>'
		tag += '<input type="hidden" id="sheetNum" name="sheetNum" value="${sheetNum}"/>'
		tag += '</form>'
		
		var divForm1 = document.getElementById("divForm");
		divForm1.innerHTML = tag;

	}

	/* thead 생성 */
	
	function scrollX() {
    document.all.mainDisplayRock.scrollLeft = document.all.bottomLine.scrollLeft;
    document.all.topLine.scrollLeft = document.all.bottomLine.scrollLeft;
}

function scrollY() {
    document.all.leftDisplay.scrollTop = document.all.mainDisplayRock.scrollTop;
    document.all.leftDisplay.scrollBottom = document.all.mainDisplayRock.scrollBottom;
    document.all.mainDisplayRock.scrollTop = document.all.leftDisplay.scrollTop;
    document.all.mainDisplayRock.scrollBottom = document.all.leftDisplay.scrollBottom;
}



	function createThead(){
		var th = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K","L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
		var tag = "";
			/* 	제목의 수만큼 열을 th태그를 만들고 값을 넣어줌 id를 통해 구별한다. id는 문자열th로 시작해서 th인데스를 합친다*/
			tag += '<tr height="41" class="thtr" >'
			for (var a = 0; a < th.length; a++) {
				//tag += '<th id=th'+th[a]+' style="width:90px;" class="tha" norwap ><div style="width:90px;">'+ th[a] +'</div></th>';
				tag += '<th id=th'+th[a]+' style="width:90px;" class="tha" norwap ><div style="width:90px;">'
				+th[a]
				+'<input type="button" id="sorter'+th[a]+'" class="sorter_b" value="▼">'
				+'</div></th>';
			
			}
			tag+= '</tr>'
			var Thead = document.getElementById("createThead");
			Thead.innerHTML = tag;
		
	}
	/* tbody생성 */
	function createTbody(){
		var th = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K","L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
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
	function createLeft(){
		var tag = ""
		
		for(var i=1; i<=100; i++){
			tag += '<tr><td width="202px" height="21" nowrap >'+i+'</td></tr>'; 
		}
			
			
		var Tbody = document.getElementById("createLeft");
		Tbody.innerHTML = tag;
	}
	
	
	//셀 클릭시 셀값 자동 추가
	function one_click(divId){
		if($('.textselect' ).text().search('=')!=-1  ){  
		
			if(divId != $('.textselect').attr('id') ){
			
	/* 			var tselect_Id = $('.textselect').attr('id'); */
				
				var tx = $('.textselect').text();
				// (앞에 수식만 자르기 
				
				var num1_text= tx.indexOf('(')+1;
				
				var func_text = tx.substring(0,num1_text);			
				
				var click_text = func_text+divId;
				$('.textselect').text(click_text).focus(); 
		 		$('#formula').val(click_text);
			}
		}
	}
function ctrl_tdselect_false(){
		
		$('.ctrl_tdselect').attr('class','celltd');
		
	}
function shift_tdselect_false(){
	$('.shift_tdselect').attr('class','.tdselect');
	
}
	function address_input(tdid){
		if($('.textselect').attr('id') != null )
	{
			$('#address').val( $('.textselect').attr('id') );
	}
		else{
			
			$('#address').val(tdid.substring(2));
		}
	}
	
	
	function formula_load(){
		
		if($('.textselect').text().indexOf('=') != -1  ){
		$('#formula').val( $('.textselect').text() );	
			
		}
		else{
		var div_text =$('.tdselect>div').text();
		$('#formula').val(div_text);
		}
	}
	function ctrl_formula_load(end_statement){
		
		$('#formula').val(end_statement);
	}
	

	function prvent_key(){
		if(event.keyCode == 116){
			event.preventDefault();
		}
	
		
	}

	function shift_sel(restatement, first_num,seccond_num){
		var sh_num1 = restatement.indexOf(':');
		var r_start =  restatement.substring(0,sh_num1);
		var r_end = restatement.substring(sh_num1+1);
		
		var r_start_alpa = r_start.substring(0,1);
		var r_end_alpa = r_end.substring(0,1);
		
		var r_start_alpa_num = th.indexOf(r_start_alpa);
		var r_end_alpa_num = th.indexOf(r_end_alpa);
		
	
		if(r_start_alpa_num < r_end_alpa_num && first_num < seccond_num ){
			for(var j = r_start_alpa_num ; j<= r_end_alpa_num ;  j ++ ){
				var k_id = th[j];
	 			for(var i = first_num ; i <= seccond_num ; i++){
				var end_id = k_id+i;
				$('#td'+end_id).attr('class','shift_tdselect');
			} 
			} 
			}
		else if(r_start_alpa_num >r_end_alpa_num && first_num > seccond_num){
				for(var k = r_end_alpa_num ; k<= r_start_alpa_num ;  k ++ ){
					var k_id = th[k];
		 			for(var z = seccond_num ; z <= first_num ; z++){
					var end_id = k_id+z;
					$('#td'+end_id).attr('class','shift_tdselect');
				} 
				} 
			}
		else if(r_start_alpa_num > r_end_alpa_num && first_num < seccond_num){
			for(var k = r_end_alpa_num ; k <= r_start_alpa_num ;  k ++ ){
				var k_id = th[k];
	 			for(var z = first_num ; z <= seccond_num ; z++){
				var end_id = k_id+z;
				$('#td'+end_id).attr('class','shift_tdselect');
			} 
			} 
		}
		else if(r_start_alpa_num < r_end_alpa_num && first_num > seccond_num){
				for(var k = r_start_row_alpa ; k <= r_end_row_alpa ;  k ++ ){
					var k_id = th[k];
		 			for(var z = seccond_num ; z <= first_num ; z++){
					var end_id = k_id+z;
					$('#td'+end_id).attr('class','shift_tdselect');
				} 
				} 	
		}

		
	}
	
	//컨트롤키
	$(document).keydown(function(event){
		if(event.target.nodeName!="DIV"){
			if(event.keyCode==8){
				alert("뒤로가기 키는 사용하실 수 없습니다.")
				return false;
			}
			
		} 
	});

	$(document).ready(function() {
		/* head body 생성 */
		createThead();
		createTbody();
		createLeft();
		createForm();
		
		for (var z = 1; z < 100; z++) {
			$('#' + z).val(z);
		}
		
		//시트개수만큼 시트태그추가
		var tagNum = "${tagNum}";
      		if(typeof(tagNum)!='undefined'){
      			if(tagNum!=0){
      				for(var i=0; i<tagNum; i++){
      				addSheetTag(i+1);
      				}
      			}
      		}
		page_load();
		formula_down();
	});
	
	$(function() {
		
		$('.sorter_b',this).click(function(){
			var a = $(this).attr('id');
			if($('#'+a).attr('value')=='▼'){
				$('#'+a).attr('value', '▲')
				//$('#'+a).attr('onclick', 'div_sorter2')
				var div_n=a.substring(6);
				div_sorter(div_n);
			}else{
				$('#'+a).attr('value', '▼')
				//$('#'+a).attr('onclick', 'div_sorter')
				var div_n=a.substring(6);
				div_sorter2(div_n);
			}
		});
		
document.onkeydown=prvent_key; 
		
		var isCtrl = false;
		var isShift = false;
		$(document).keydown(function(event){
		$()
			if(event.which=="17"){
				isCtrl = true;
			
			}
			else if(event.which=="16"){
				isShift = true;
				
			}
			//오른쪽 방향키
			else if(event.which=='39'){
				if($('.textselect').attr('id') ==null ){
				var colltdid = $('.tdselect').attr('id').substring(2, 3);
				var rowtdid = $('.tdselect').attr('id').substring(3);
				var or_row_tdid = th.indexOf(colltdid) + 1;
				var re_row_tdid = th[or_row_tdid];
				var id = 'td' + re_row_tdid + rowtdid;
				
				$('.tdselect').attr('class', 'celltd');
				$('#' + id).attr('class', 'tdselect');
				$('#address').val(id.substring(2));
				
				}
				formula_load();
			}
		
			//왼쪽 방향키
			
			else if (event.which == '37') {
				if($('.textselect').attr('id') ==null ){
				var colltdid = $('.tdselect').attr('id').substring(2, 3);
				var rowtdid = $('.tdselect').attr('id').substring(3);
				var or_row_tdid = th.indexOf(colltdid) - 1;
				var re_row_tdid = th[or_row_tdid];
				var id = 'td' + re_row_tdid + rowtdid;

				$('.tdselect').attr('class', 'celltd');
				$('#' + id).attr('class', 'tdselect');
				$('#address').val(id.substring(2));
			}
			formula_load();
			}
			
			//위쪽 방향키
			else if (event.which == '38') {
				if($('.textselect').attr('id') ==null ){
				var numtdid = $('.tdselect').attr('id').substring(3);
				var sum = Number(numtdid) - 1;
				var stringid = $('.tdselect').attr('id').substring(0, 3) + sum;
				$('.tdselect').attr('class', 'celltd');
				$('#' + stringid).attr('class', 'tdselect');
				$('#address').val(stringid.substring(2));
			}
				formula_load();
			}
			//아래쪽 방향키
			else if (event.which == '40') {
				if($('.textselect').attr('id') ==null ){
				var numtdid = $('.tdselect').attr('id').substring(3);
				var sum = Number(numtdid) + 1;
				var stringid = $('.tdselect').attr('id').substring(0, 3) + sum;
				$('.tdselect').attr('class', 'celltd');
				$('#' + stringid).attr('class', 'tdselect');
				$('#address').val(stringid.substring(2));
			}
				formula_load();
			}
			
			else{
				if($('.textselect').attr('id') ==null ){
					$('.tdselect > div').attr('class', 'textselect');
					$('.tdselect > div').attr('contenteditable', 'true').focus();
					
				}
			} 
			});
			
		$(document).keyup(function(event){
				if(event.which=="17"){
					isCtrl = false;
					
				}  
				else if(event.which=="16"){
					isShift=false;
					
				}
				else if(event.which=='39'){
					formula_load();
				}
				else if (event.which == '37') {

				formula_load();
				}
				
				//위쪽 방향키
				else if (event.which == '38') {

					formula_load();
				}
				//아래쪽 방향키
				else if (event.which == '40') {
					formula_load();
				}

				
		});
		
		$('.celltd',this).click(function() {
			
			
			if(isCtrl){
				var table_id = $(this).attr('id');
				$(this).attr('class', 'ctrl_tdselect');
				var div_id = $('#'+table_id+'>div').attr('id');	
				if($('.textselect' ).text().search('=')!=-1  )  {
						if(div_id != $('.textselect').attr('id') ){
						
				/* 			var tselect_Id = $('.textselect').attr('id'); */
							var div_text = $('.textselect').text();
							/* alert(in11); */
							//둘다 없을때
							if(div_text.indexOf(')')==-1 && div_text.indexOf('(') ==-1){
								var end_statement = div_text+'('+div_id+')';
									$('.textselect').text(end_statement);
									ctrl_formula_load(end_statement);
									$('.textselect').focus();
							}
							// 마지막 ) 가 없고 ( 가 있고 (뒤에 다른 셀값이 있을때
							else if(div_text.indexOf(')')==-1 && div_text.indexOf('(') !=div_text.length-1 )
							{
								var end_statement = div_text+','+div_id+')';
								$('.textselect').text(end_statement);
								ctrl_formula_load(end_statement);
								$('.textselect').focus();
							}
							//( 만 있고   그뒤에 아무값도 없을때.
							else if(div_text.indexOf('(') ==div_text.length-1 )
							{
								var end_statement = div_text+div_id+')';
								$('.textselect').text(end_statement);
								ctrl_formula_load(end_statement);
								$('.textselect').focus();
							}
							//둘다 있고 값이 있을대
						 	else if(div_text.indexOf('(')!=-1 && div_text.indexOf(')') !=-1 ){
								
						 		var num1 = div_text.indexOf('(');
						 		//()자르기 인덱스 시작
						 		var num2 = div_text.indexOf('(')+1;
								//() 자르기 인덱스 끝
						 		var num3 = div_text.indexOf(')');
								//괄호 앞의 값들 
						 		var func_1 = div_text.substring(0,num1);
								//괄호 안의 값
						 		var select_cell_id =  div_text.substring(num2,num3);
								
								if(select_cell_id == "" ){
									var add_cell_id = select_cell_id.concat(div_id);
									
									var end_statement =  func_1+'('+add_cell_id+')';
									
									$('.textselect').text(end_statement);	
									ctrl_formula_load(end_statement);
									$('.textselect').focus();
								}
								
								else if(select_cell_id != ""){
								var add_cell_id = select_cell_id.concat(','+div_id);
								
								var end_statement =  func_1+'('+add_cell_id+')';
								
								$('.textselect').text(end_statement);
								ctrl_formula_load(end_statement);
								$('.textselect').focus();
								}
								}
							//둘다 있고 값이 없을때 
						}
					} 
			}
			
			else if(isShift){
				var table_id = $(this).attr('id');
				var th = [ "", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K","L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
				
				if($('.shift_tdselect').attr('id') != null  ){
				
				var first_id = $('.shift_tdselect').attr('id');
				var num1 = table_id.indexOf('d');
				$('.shift_tdselect').attr('class','celltd');
				$('#'+first_id).attr('class','shift_tdselect');
				var first_row =  first_id.substring(num1+1,num1+2);
				var first_num =  first_id.substring(num1+2);
				var first_row_alpa = th.indexOf(first_row);
				
				var seccond_id =  $(this).attr('id');
				var seccond_row =  seccond_id.substring(num1+1,num1+2);
				var seccond_num = seccond_id.substring(num1+2);
				var seccond_row_alpa= th.indexOf(seccond_row);
				
				var div_text = $('.textselect').text();
				
				var num1 = div_text.indexOf('(');
		 		//()자르기 인덱스 시작
		 		var num2 = div_text.indexOf('(')+1;
				//() 자르기 인덱스 끝
		 		var num3 = div_text.indexOf(')');
				//괄호 앞의 값들 
		 		var func_1 = div_text.substring(0,num1);
				//괄호 안의 값
		 		var select_cell_id =  div_text.substring(num2,num3);
				
/* 				if(first_row_alpa < seccond_row_alpa){
				for(var j = first_row_alpa ; j<= seccond_row_alpa ;  j ++ ){
					var k_id = th[j];
		 			for(var i = first_num ; i <= seccond_num ; i++){
					var end_id = k_id+i;
					$('#td'+end_id).attr('class','shift_tdselect');
				} 
				} 
				}
				else if(first_row_alpa > seccond_row_alpa){
					for(var k = seccond_row_alpa ; k<= first_row_alpa ;  k ++ ){
						var k_id = th[k];
			 			for(var z = first_num ; z <= seccond_num ; z++){
						var end_id = k_id+z;
						$('#td'+end_id).attr('class','shift_tdselect');
					} 
					} 
				}
				
				 */
				
				}
				$(this).attr('class', 'shift_tdselect');
				var div_id = $('#'+table_id+'>div').attr('id');	
				if($('.textselect' ).text().search('=')!=-1  ) {
					if(div_id != $('.textselect').attr('id') ){

						/* 			var tselect_Id = $('.textselect').attr('id'); */
									var div_text = $('.textselect').text();
									/* alert(in11); */
									//둘다 없을때
									if(div_text.indexOf(')')==-1 && div_text.indexOf('(') ==-1){
										var end_statement = div_text+'('+div_id+')';
											$('.textselect').text(end_statement);
											ctrl_formula_load(end_statement);
											$('.textselect').focus();
									}
									// 마지막 ) 가 없고 ( 가 있고 (뒤에 다른 셀값이 있을때
									else if(div_text.indexOf(')')==-1 && div_text.indexOf('(') !=div_text.length-1 )
									{
										var end_statement = div_text+':'+div_id+')';
										$('.textselect').text(end_statement);
										ctrl_formula_load(end_statement);
										$('.textselect').focus();
									}
									//( 만 있고   그뒤에 아무값도 없을때.
									else if(div_text.indexOf('(') ==div_text.length-1 )
									{
										var end_statement = div_text+div_id+')';
										$('.textselect').text(end_statement);
										ctrl_formula_load(end_statement);
										$('.textselect').focus();
									}
							//둘다 있고 값이 있을대
								 	else if(div_text.indexOf('(')!=-1 && div_text.indexOf(')') !=-1 ){
										
								 		var num1 = div_text.indexOf('(');
								 		//()자르기 인덱스 시작
								 		var num2 = div_text.indexOf('(')+1;
										//() 자르기 인덱스 끝
								 		var num3 = div_text.indexOf(')');
										//괄호 앞의 값들 
								 		var func_1 = div_text.substring(0,num1);
										//괄호 안의 값
								 		var select_cell_id =  div_text.substring(num2,num3);
										
										if(select_cell_id == "" ){
											var add_cell_id = select_cell_id.concat(div_id);
											
											
											var end_statement =  func_1+'('+add_cell_id+')';
											
											$('.textselect').text(end_statement);	
											ctrl_formula_load(end_statement);
											$('.textselect').focus();
										}
										
										else if(select_cell_id != "" && select_cell_id.indexOf(':') ==-1  ){
										var add_cell_id = select_cell_id.concat(':'+div_id);
										
										
										var end_statement =  func_1+'('+add_cell_id+')';
										
										$('.textselect').text(end_statement);
										ctrl_formula_load(end_statement);
										$('.textselect').focus();
										}
										else if(select_cell_id!="" && select_cell_id.indexOf(':') !=-1 ){
											
											var com_find = select_cell_id.lastIndexOf(':')+1;
											var com_end = select_cell_id.indexOf(')');
											var end = select_cell_id.length;
											
											var end_id =  select_cell_id.substring(com_find,end);
											
														
											
											
											var middle_statement = select_cell_id.substring(com_find,com_end);
											//middle_statement를 교체 
											var restatement =  middle_statement.concat(div_id);
											shift_sel(restatement,first_num,seccond_num);
											/* $('#td'+end_id).attr('class','celltd');
											
											var end_statement =  func_1+'('+restatement+')' ;
											var sh_num1 = restatement.indexOf(':');
											var r_start =  restatement.substring(0,sh_num1);
											var r_end = restatement.substring(sh_num1+1);
											
											var r_start_alpa = r_start.substring(0,1);
											var r_end_alpa = r_end.substring(0,1);
											
											var r_start_alpa_num = th.indexOf(r_start_alpa);
											var r_end_alpa_num = th.indexOf(r_end_alpa);
											
										
											if(r_start_alpa_num < r_end_alpa_num && first_num < seccond_num ){
												for(var j = r_start_alpa_num ; j<= r_end_alpa_num ;  j ++ ){
													var k_id = th[j];
										 			for(var i = first_num ; i <= seccond_num ; i++){
													var end_id = k_id+i;
													$('#td'+end_id).attr('class','shift_tdselect');
												} 
												} 
												}
											else if(r_start_alpa_num >r_end_alpa_num && first_num > seccond_num){
													for(var k = r_end_alpa_num ; k<= r_start_alpa_num ;  k ++ ){
														var k_id = th[k];
											 			for(var z = seccond_num ; z <= first_num ; z++){
														var end_id = k_id+z;
														$('#td'+end_id).attr('class','shift_tdselect');
													} 
													} 
												}
											else if(r_start_alpa_num > r_end_alpa_num && first_num < seccond_num){
												for(var k = r_end_alpa_num ; k <= r_start_alpa_num ;  k ++ ){
													var k_id = th[k];
										 			for(var z = first_num ; z <= seccond_num ; z++){
													var end_id = k_id+z;
													$('#td'+end_id).attr('class','shift_tdselect');
												} 
												} 
											}
											else if(r_start_alpa_num < r_end_alpa_num && first_num > seccond_num){
													for(var k = r_start_row_alpa ; k <= r_end_row_alpa ;  k ++ ){
														var k_id = th[k];
											 			for(var z = seccond_num ; z <= first_num ; z++){
														var end_id = k_id+z;
														$('#td'+end_id).attr('class','shift_tdselect');
													} 
													} 	
											} */
							
											
											
											$('.textselect').text(end_statement);
											ctrl_formula_load(end_statement);
											$('.textselect').focus(); 
											
										}
										
								 	}
								}
							
					}
				}
			
	
			
			
			else {	
			$('.tdselect').attr('class', 'celltd');
			$(this).attr('class', 'tdselect');
			//현재 마우스로 찍은 div 아이디
			var tdid = $(this).attr('id');
			address_input(tdid);
			
			var div = $('.tdselect > div').text();
			var divId = $("#"+tdid+">div").attr('id');

			formula_load();
		if($('.textselect').attr('id') !=null && 
					$('.textselect').attr('id') != divId &&
					$('.textselect').text().indexOf('=') == -1 &&
					$('.textselect').text().indexOf(',') == -1
			){
				$('.textselect').attr('contentEditable','false');
				$('.textselect').attr('class','divcoll');	
				ctrl_tdselect_false();
				shift_tdselect_false();
				formula_load();
			}
		else if($('.textselect').attr('id') !=null &&   //
					$('.textselect').attr('id') != divId &&
					$('.ctrl_tdselect').attr('id') !=null && 
					$('.textselect').text().indexOf('=') == -1 &&
					$('.textselect').text().indexOf(',') ==-1		
			){
				
				$('.ctrl_tdselect').attr('class','tdselect');
				$('.textselect').attr('contentEditable','false');
				$('.textselect').attr('class','divcoll');	
				formula_load();				
			} 
		else if($('.textselect').attr('id') !=null &&   //
					$('.textselect').attr('id') != divId &&
					$('.ctrl_tdselect').attr('id') !=null && 
					$('.textselect').text().indexOf('=') != -1 &&
					$('.textselect').text().indexOf(',') != -1 
					)
				{
				var table_id = $(this).attr('id');
				var div_id = $('#'+table_id+'>div').attr('id');	
				var div_text = $('.textselect').text();
				
				var num1 = div_text.indexOf('(');
		 		//()자르기 인덱스 시작
		 		var num2 = div_text.indexOf('(')+1;
				//() 자르기 인덱스 끝
		 		var num3 = div_text.indexOf(')');
				//괄호 앞의 값들 
		 		var func_1 = div_text.substring(0,num1);
				//괄호 안의 값
		 		var select_cell_id =  div_text.substring(num2,num3);
				
				var com_find = select_cell_id.lastIndexOf(',')+1;
				var com_end = select_cell_id.indexOf(')');
				var end = select_cell_id.length;
				
				var end_id =  select_cell_id.substring(com_find,end);
				
				var middle_statement = select_cell_id.substring(com_find,com_end);
				//middle_statement를 교체 
				var restatement =  middle_statement.concat(div_id);
				
				$('#td'+end_id).attr('class','celltd');
				
				var end_statement =  func_1+'('+restatement+')' ;
				
				
				
				$('.textselect').text(end_statement);
				ctrl_formula_load(end_statement);
				 $('.textselect').focus(); 
				
				 var id = $('.textselect').attr('id');
			
			
				}
		
		else if($('.textselect').attr('id') ==null &&   
					$('.ctrl_tdselect').attr('id') !=null 
					){
				
				ctrl_tdselect_false();
			}
				
				

		else if($('.shift_tdselect').attr('id') != null && $('.textselect').attr('id') != null && $('.textselect').text() != "" ){
			var table_id = $(this).attr('id');
			var div_id = $('#'+table_id+'>div').attr('id');	
			var div_text = $('.textselect').text();
			
			var num1 = div_text.indexOf('(');
	 		//()자르기 인덱스 시작
	 		var num2 = div_text.indexOf('(')+1;
			//() 자르기 인덱스 끝
	 		var num3 = div_text.indexOf(')');
			//괄호 앞의 값들 
	 		var func_1 = div_text.substring(0,num1);
			//괄호 안의 값
	 		var select_cell_id =  div_text.substring(num2,num3);
			
			var com_find = select_cell_id.lastIndexOf(':')+1;
			var com_end = select_cell_id.indexOf(')');
			var end = select_cell_id.length;
			
			var end_id =  select_cell_id.substring(com_find,end);
			
						
			
			
			var middle_statement = select_cell_id.substring(com_find,com_end);
			//middle_statement를 교체 
			var restatement =  middle_statement.concat(div_id);
			
			$('#td'+end_id).attr('class','celltd');
			
			var end_statement =  func_1+'('+restatement+')' ;
			
			$('.textselect').text(end_statement);
			ctrl_formula_load(end_statement);
			$('.textselect').focus(); 
			
		}
			}
		
		}); 
		//마우스 더블 클릭시 td select와 div textselect div를 편집할수있게 만들어준다. 
		$('.celltd', this).dblclick(function() {
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
	<div class="jbContent" style="overflow: hidden;">
		<TABLE cellpadding="0" cellspacing="0" border="0">
			<TR>
				<TD colspan="1">
					<TABLE cellspacing="1" cellpadding="0" border="0"
						class="main_table">
						<THEAD>
							<TR>
								<TD width="202px" nowrap height="41" class="TIT_CONT_GRAY_C"></TD>
							</TR>
						</THEAD>
					</TABLE>
				</TD>

				<TD>
					<DIV id="topLine" style="width: 1168px; overflow: hidden;">
						<TABLE width="700px" cellspacing="1" cellpadding="0" border="0"
							class="main_table">
							<THEAD id="createThead">
							</THEAD>
						</TABLE>
					</DIV>
				</TD>
			</TR>

			<TR>
				<TD>
					<DIV id="leftDisplay" style="height: 730px; overflow: hidden;"
						onscroll="scrollY()">
						<TABLE cellspacing="1" cellpadding="0" border="0"
							class="main_table" id="createLeft">
						</TABLE>
					</DIV>
				</TD>
				<TD>
					<DIV id="mainDisplayRock"
						style="width: 1180px; height: 730px; overflow-y: scroll; overflow-x: hidden;"
						onscroll="scrollY()">
						<TABLE width="700px" cellspacing="1" cellpadding="0" border="0"
							class="main_table" id="createTbody">
						</TABLE>
					</DIV>
				</TD>

			</TR>
			<TR>
				<TD valign="top"></TD>
				<TD>
					<DIV id="bottomLine"
						style="height: 18; width: 1100px; overflow-x: scroll; overflow-y: hidden;"
						onscroll="scrollX()">
						<TABLE width="2352px" cellspacing="1" cellpadding="0" border="0">
							<TR>
								<td height="0" norwap class="BG_WHITE_RIGHT">&nbsp;</td>
							</TR>
						</TABLE>
					</DIV>
				</TD>
			</TR>
		</TABLE>
	</div>
	<div id="divForm"></div>
	<span id="expression_Div" class="expression_class_Div"></span>
</body>
</html>