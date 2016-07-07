<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>力格 涝仿</title>
<link href='https://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<style>
html,body{overflow:hidden;}

.button {
   border: 1px solid #000000;
   background: #ffffff;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff));
   background: -webkit-linear-gradient(top, #ffffff, #ffffff);
   background: -moz-linear-gradient(top, #ffffff, #ffffff);
   background: -ms-linear-gradient(top, #ffffff, #ffffff);
   background: -o-linear-gradient(top, #ffffff, #ffffff);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #ffffff 100%);
   padding: 7.5px 15px;
   -webkit-border-radius: 0px;
   -moz-border-radius: 0px;
   border-radius: 0px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #ffffff 0 1px 0;
   color: #000000;
   font-size: 13px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.button:hover {
   border: 1px solid #000000;
   text-shadow: #000000 0 1px 0;
   background: #858585;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#858585));
   background: -webkit-linear-gradient(top, #ffffff, #858585);
   background: -moz-linear-gradient(top, #ffffff, #858585);
   background: -ms-linear-gradient(top, #ffffff, #858585);
   background: -o-linear-gradient(top, #ffffff, #858585);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #858585 100%);
   color: #fff;
   }
.button:active {
   text-shadow: #000000 0 1px 0;
   border: 1px solid #000000;
   background: #000000;
   background: -webkit-gradient(linear, left top, left bottom, from(#000000), to(#858585));
   background: -webkit-linear-gradient(top, #000000, #000000);
   background: -moz-linear-gradient(top, #000000, #000000);
   background: -ms-linear-gradient(top, #000000, #000000);
   background: -o-linear-gradient(top, #000000, #000000);
   background-image: -ms-linear-gradient(top, #000000 0%, #000000 100%);
   color: #fff;
   }
   
#submit_find_title
{
 	position:absolute; 
	top:80px;
	left:135px; 
	font-family:'Poiret One', cursive;
}

#title
{
	position:absolute;
	top:30px;
	left:100px;
	width:140px;
	height:25px;
	text-align:center;
	font-family:'Poiret One', cursive;
}
#hidden_input{
	display:none;
}
</style>
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script>
$(function(){
	$("#submit_find_title").click(function(){
		
		if($('#title').val().trim() == "" )
		{
			event.preventDefault();
			 alert("力格阑 涝仿秦林技夸.");
		
		}
		
		else if($('#title').val().trim() != "" ){
		opener.parent.location="tiles.do?title="+$('#title').val()+"";
		
		self.close();
		
		}

	});
	
	$('#title').keydown(function(e){
		if(e.keyCode==13){
			
			if($('#title').val().trim() == "" )
			{
				event.preventDefault();
				 alert("力格阑 涝仿秦林技夸.");
			
			}
			
			else if($('#title').val().trim() != "" ){
			opener.parent.location="tiles.do?title="+$('#title').val()+"";
			
			self.close();
			
			}

		
	}
		
	});
	
});
</script>
</head> 
<body>
<form action="tiles.do" name="title" id="in_title">
<table>
	<tr>
		<td>
			<div class="size_long" id="divtitle">
			<input type="text" class="text_login" id="title" name="title" size="50" placeholder="力格"></input>
			<input type="text" id="hidden_input"/>
			</div>
			<input id="submit_find_title" class="button" type="button"  name="confirm_title" value="check"></input>
		</td>
	</tr>
</table>
</form> 
</body> 
</html>