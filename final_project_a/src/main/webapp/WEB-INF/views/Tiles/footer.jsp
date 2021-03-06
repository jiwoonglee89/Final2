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
   
#div_footer_sheet {
   list-style-type: none;
   margin: 0;
   padding: 0;
   overflow: hidden;
   position: absolute;
   bottom: 0;
   width: 100%;
   height: 25px;
   background-color: #1E3269;
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
   position: relative;
   left: 4%; 
   float: left;
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
   left: 8%; 
    
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

	function addSheetTag(a){
		var tag = "<input type='button' id='sheet"+a+"' name='sheet' class='button' value='시트"+(a+1)+"'/>";
  		$('#sheet_bar').append(tag);
	}
	
	
   $(function() {
	   
	  $('#save').click(function(){
		  var sheetNum = $('#sheet_bar').find('input').length*1;
    	  $('#sheetNum').val(sheetNum);
    	  var url= "<c:url value='/save1.do'/>"
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
      $('.add').click(function() {
    	  	var totalsheetNum = $('#sheet_bar').find('input').length*1;
	      	
      		$('#totalsheetNum').val(totalsheetNum);
      		
      		var a = totalsheetNum*1;
      		$('#sheetNum').val(totalsheetNum);
      		
      		var url ="";
      		
      		addSheetTag(a);
      		
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
    				
    					for (var j = 1; j <= 100; j++) { 
    		 				for (var i = 1; i <= th.length; i++) {
    		 					$('#'+th[i]+j).text("");
    		 					$('#in'+th[i]+j).val("");
    		 				   }
    		 			}
    					$('#sheet_num').empty();
      					$('#sheet_num').append("[ "+(totalsheetNum+1)+"번째시트 ]");

    				}
    				,error:function(request, status, error){
    					alert("code:"+request.status+"\n"+request.responseText+"\n"+"error:"+error);
    				}
    		});
    		
      });
      
      $('#sheet_bar').on('click','input',function(){
    	  var sheetNum = $(this).attr('id').substring(5)*1;
    	  $('#sheetNum').val(sheetNum);
    	  var url= "<c:url value='/sheet.do'/>"

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
  					$('#sheet_num').empty();
  					$('#sheet_num').append("[ "+(sheetNum+1)+"번째시트 ]");
  				}
  				,error:function(request, status, error){
  					alert("code:"+request.status+"\n"+request.responseText+"\n"+"error:"+error);
  				}
  			});
  			
      	});
      $('.del').click(function(){
    	  	var totalsheetNum = $('#sheet_bar').find('input').length*1;
    		$('#totalsheetNum').val(totalsheetNum);
    		
       	  	var sheetNum = ($('#sheetNum').val())*1;
       	  	
       		
       		
       	  	//해당태그삭제
       	  	$('#sheet_bar').empty();
       	  	
       	  	for(var i=0; i<(totalsheetNum-1); i++){
       	  		addSheetTag(i);
       	  	}
       	  		
       	 	var url= "<c:url value='/deletesheet.do'/>"
   			
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
   					$('#sheet_num').empty();
  					$('#sheet_num').append("[ "+sheetNum+"번째시트 ]");
					/* if(sheetNum!=totalsheetNum){
  						
  					} */
  					// $('#sheetNum').val(sheetNum);
  					
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
            <input type="button" id="sheet0" name="sheet" class="button" value="시트1" />
         </div>
      </div>
   </div>
   
   
</body>
</html>