<%@page import="java.net.URL"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script src='<c:url value="/resources/formula.js"/>'></script>
<style type="text/css">
.button {
   border: 1px solid #606161;
   background: #ababab;
   background: -webkit-gradient(linear, left top, left bottom, from(#cccccc), to(#ababab));
   background: -webkit-linear-gradient(top, #cccccc, #ababab);
   background: -moz-linear-gradient(top, #cccccc, #ababab);
   background: -ms-linear-gradient(top, #cccccc, #ababab);
   background: -o-linear-gradient(top, #cccccc, #ababab);
   background-image: -ms-linear-gradient(top, #cccccc 0%, #ababab 100%);
   padding: 5px 10px;
   -webkit-border-radius: 6px;
   -moz-border-radius: 6px;
   border-radius: 6px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #ffffff 0 1px 0;
   color: #0a0a0a;
   font-size: 14px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.button:hover {
   border: 1px solid #7d7d7d;
   text-shadow: #ffffff 0 1px 0;
   background: #b3b3b3;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#b3b3b3));
   background: -webkit-linear-gradient(top, #ffffff, #b3b3b3);
   background: -moz-linear-gradient(top, #ffffff, #b3b3b3);
   background: -ms-linear-gradient(top, #ffffff, #b3b3b3);
   background: -o-linear-gradient(top, #ffffff, #b3b3b3);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #b3b3b3 100%);
   color: #000000;
   }
.button:active {
   text-shadow: #ffffff 0 1px 0;
   border: 1px solid #949494;
   background: #ffffff;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#b3b3b3));
   background: -webkit-linear-gradient(top, #ffffff, #ffffff);
   background: -moz-linear-gradient(top, #ffffff, #ffffff);
   background: -ms-linear-gradient(top, #ffffff, #ffffff);
   background: -o-linear-gradient(top, #ffffff, #ffffff);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #ffffff 100%);
   color: #000000;
   }
   
#div_footer_sheet {
   list-style-type: none;
   margin: 0;
   padding: 0;
   overflow: hidden;
   position: absolute;
   bottom: 0;
   width: 100%;
   height: 25px;
   background-color: #3fa338;
}

 /* #footer_bar div{
   display: inline-block;
   float: left;
   color:white;
   text-align:center;
   padding:4px 16px;
   text-decoration:none;
}  */
#left {
   
}

#sheet_bar {
/*    display: inline-block;
   float: right;
   color: white;
   text-align: center;
   padding: 4px 16px;
   text-decoration: none;
   margin: 0 auto; */
   position: relative;
   left: 4%; 
   float: left;
}

#sheet_bar input {
   float: left;
}

/* #add{
   position:relative;
   bottom:30%;
   left:200%;
}

#sheet{
   position:relative;
   bottom:30%;
   left:260%;
} */

   

</style>
<script>
   $(function() {
	  /*  $(this).find('input[class=button]').attr('id').substring(5)*1; */
	   //var sheetNum = $('input[class=button]').attr('id').substring(5)*1;
	  $('#btn').click(function() {
   			var list = $('#sheet_bar div').text();

   			var listleng = $('#sheet_bar').find('div').length;
      			alert(list);
      			alert(listleng);
   		});
      $('.add').click(function() {
    	  	var totalsheetNum = $('#sheet_bar').find('input').length*1;
	      	
      		$('#totalsheetNum').val(totalsheetNum);
      		
      		
      		var a = totalsheetNum + 1;
      		$('#sheetNum').val(totalsheetNum);
      		
      		var url ="";
      		var tag = "<input type='button' id='sheet"+a+"' name='sheet' class='button' value='시트'/>";
      		$('#sheet_bar').append(tag);
      		if(totalsheetNum!=1){
      			url += "<c:url value='/plus2.do'/>"
      		}else{
          		url += "<c:url value='/plus.do'/>"
      		}
    		for (var j = 1; j <= 100; j++) {
    			for (var i = 1; i <= th.length; i++) {
    				var value= $('#'+th[i]+j).text();
    				$('#in'+th[i]+j).val(value);
    			}
    		}
    		var params = $("form[name=formtable]").serialize();
    		$.ajax({
    				type:"post"
    				,url:url
    				,data:params
    				//,dataType:"json"
    				,success: function (){
    					alert('성공');
    					for (var j = 1; j <= 100; j++) { 
    		 				for (var i = 1; i <= th.length; i++) {
    		 					$('#'+th[i]+j).text("");
    		 					$('#in'+th[i]+j).val("");
    		 				   }
    		 			}
    				}
    				,error:function(request, status, error){
    					alert("code:"+request.status+"\n"+request.responseText+"\n"+"error:"+error);
    				}
    		});
    		
      });
      
      $('#sheet_bar').on('click','input',function(){
    	  var sheetNum = $(this).attr('id').substring(5)*1;
    	  $('#sheetNum').val(sheetNum-1);
    	  
    	  var url= "<c:url value='/sheet.do'/>"
  			/* for (var j = 1; j <= 100; j++) {
  				   for (var i = 1; i <= th.length; i++) {
  					   var value= $('#'+th[i]+j).text();
  					   $('#in'+th[i]+j).val(value);
  				   }
  			} */
  			var params = $("form[name=formtable]").serialize();
  			$.ajax({
  				type:"post"
  				,url:url
  				,data:params
  				,dataType:"json"
  				,success: function (rs){
  					for(var i=0;i<rs.cell_name.length;i++){
  						$('#'+rs.cell_name[i]).text(rs.cell_value[i]);
  					} 
  				}
  				,error:function(request, status, error){
  					alert("code:"+request.status+"\n"+request.responseText+"\n"+"error:"+error);
  				}
  			});
  			
      	});
      $('.del').click(function(){
    	  	var totalsheetNum = $('#sheet_bar').find('input').length*1;
    		$('#totalsheetNum').val(totalsheetNum);
    		alert("total:"+totalsheetNum);
    		
       	  	var sheetNum = $('#sheetNum').val();
       	  	alert("sheetNum:"+sheetNum);
       	  	
       	  	//해당태그삭제
       	  	$('#sheet'+sheetNum).remove();
       	  	
       	 	var url= "<c:url value='/deletesheet.do'/>"
   			/* for (var j = 1; j <= 100; j++) {
   				   for (var i = 1; i <= th.length; i++) {
   					   var value= $('#'+th[i]+j).text();
   					   $('#in'+th[i]+j).val(value);
   				   }
   			} */
   			var params = $("form[name=formtable]").serialize();
   			$.ajax({
   				type:"post"
   				,url:url
   				,data:params
   				,dataType:"json"
   				,success: function (rs){
   					for(var i=0;i<rs.cell_name.length;i++){
   						$('#'+rs.cell_name[i]).text(rs.cell_value[i]);
   					} 
   				}
   				,error:function(request, status, error){
   					alert("code:"+request.status+"\n"+request.responseText+"\n"+"error:"+error);
   				}
   			});
      });
   });
</script>
<style>
</style>
</head>
<body>
   <div id="div_footer_sheet">
   	
      <div id="footer_bar">

         <div id="sheet_bar">
            <input type="button" id="sheet1" name="sheet" class="button" value="시트" />
         </div>
      </div>
   </div>
   
   
</body>
</html>