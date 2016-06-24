var textRange=null;
var chkImVal=true;
var chkTmp=true;

var TRange = null;
var TRangeCopy = null;
var n = 0;
var preSearchText;
var preSearchType = "";
var isFirstSearch = true;
var clickElement = null;
var chkImVal = true;
var chkTmp = "1";
var chkTmp1 = true;

function clickBtnContSrch(){
	$('input[name="txtContSrch"]').val('한다');
	var strContSrch=$('input[name="txtContSrch"]').val();
};

function bodySearchAll(targetDiv, searchKeyword, inputId, chkMode, mode, chkPass){
	TRangeViewChk=false;
	
	searchKeyword=searchKeyword.replace(/\"/gi,'');

	if(document.getElementById("preTargetDiv")!=null){
		preTargetDiv=document.getElementById("preTargetDiv").value;
	}else{
		preTargetDiv='';
	}
	
	if(document.getElementById("preSearchText")!=null){
		preSearchText=document.getElementById("preSearchText").value;
	}else{
		preSearchText='';
	}
	
	if(preTargetDiv!='' && preTargetDiv!=targetDiv){
	    preSearchText='';
	    TRangeViewChk=true;
	}
	
	if(chkPass == "pass"){
	    preSearchText='';
	    TRangeViewChk=true;
	}
	
	if(preSearchText!=searchKeyword){
		
			bodySearchReset(targetDiv);
			
			textRange=document.body.createTextRange();
			textRange.moveToElementText(document.getElementById(targetDiv));
			
			var i=0;
			var iCnt=0;
			
			if(searchKeyword!=''){
			    while(textRange.findText(searchKeyword)){
					setTRangeOn(textRange);
					textRange.collapse(false);
					
					iCnt += 1;
				}
			}
			
			var inputEl=document.createElement("INPUT");
			inputEl.type="hidden";
			inputEl.name='preSearchText';
			inputEl.id='preSearchText';
			inputEl.value=searchKeyword;
			
			document.getElementById(targetDiv).appendChild(inputEl);
			
			document.getElementById(targetDiv).onclick=function(){
				if(    event.srcElement.parentElement.className == "pgroup"
				    || event.srcElement.parentElement.parentElement.className == "pgroup")
				clickElement=event.srcElement;
			}
			
			document.getElementById('preSearchText').value=searchKeyword;

			preSearchText=searchKeyword;
			preSearchType="W";
			
			//////////////////////////////////////////////////////////////////////////////////
			
			var inputEl=document.createElement("INPUT");
			inputEl.type="hidden";
			inputEl.name='preTargetDiv';
			inputEl.id='preTargetDiv';
			inputEl.value=targetDiv;
			document.getElementById(targetDiv).appendChild(inputEl);
			document.getElementById('preTargetDiv').value=targetDiv;
			
			//////////////////////////////////////////////////////////////////////////////////
			
			textRange.moveToElementText(document.getElementById(targetDiv));
			isFirstSearch=true;
			clickElement=null;
	}

	if(mode == "1"){
		//addInputTextFocus();
		bodySearch2(targetDiv, searchKeyword, false, inputId, iCnt, TRangeViewChk);
	}else{
		bodySearch(targetDiv, searchKeyword, false, inputId, chkMode);
	}
}


function bodySearch(targetDiv, searchText, clear, inputId, chkMode, chkAr){
	if(clear!=null && clear && preSearchType == "W") bodySearchReset(targetDiv);
	preSearchType="T";

	var hasInput=false;
	if(inputId!=null && typeof(document.getElementById(inputId))!="undefined") hasInput=true;;
	var strFound='';
	
	// CHROME, FIREFOX
	if(navigator.appName.indexOf("Microsoft")<0){
		window.find(searchText,false,false);
		return;
	}

	// EXPLORER
	if(textRange!=null){
		if(!isFirstSearch){
			if(chkMode=='up'){
			    setTRangeSelectOff();
			    chkTmp=false;
			}else{
			    if(chkTmp) setTRangeSelectOff();
			    else setTRangeSelectOff();
			}
		}
		
		isFirstSearch=false;

		if(clickElement!=null){
			try{
				textRange.moveToElementText(clickElement);
			} catch(e){
				//잘못된 범위를 클릭했을 때
			}
			clickElement=null;
		}
		
		if(chkMode == "up"){
			textRange.collapse(true);
		    strFound=textRange.findText(searchText, -100000000,4);
		    
		    // 위로찾을대 더이상 위에 해당 검색어가 없을경우
		    // 닫혀져있는 부칙을 열어놓고 검색처리후 닫아준다
		    // 닫아주는 처리는 밑에서 함 2013.2.21 홍석균
		    if(!strFound){
                var arInfs=document.getElementsByName('arInf');
                var arInfCnt=arInfs.length;
                
                if(arInfCnt > 1){
                    for(var i=0;i<arInfCnt-1;i++){
                        var arInf=arInfs[i].value;
                        if(document.getElementById('ar'+arInfs[i].value)!=null && document.getElementById('ar'+arInfs[i].value).style.display!='') arView('ar'+arInf);
                    }
                }
            }
			strFound=textRange.findText(searchText, -100000000,4);
			
			if(textRange.parentElement().parentNode.parentNode.id.indexOf("liBgcolor") > -1
			    || textRange.parentElement().parentNode.parentNode.parentNode.id.indexOf("liBgcolor") > -1
			   )
			{
				textRange=null;
	            bodySearch(targetDiv, searchText, false, inputId, chkMode);
			}
			
		}else{
			textRange.collapse(false);
		    strFound=textRange.findText(searchText);
		}
		
		try {
			if(strFound){
				if(chkMode == "up"){
					//textRange.moveStart('character',0);
                    //textRange.moveEnd('character',0);
                    
					textRange.select();
        			setTRangeSelectOn();
        			
					//textRange.collapse(false);
					
					// 전엔 부칙쪽 화면내검색 위치정보찾을때 엘리먼트네임 "arDivs" 이걸 기준으로 찾앗었는데
					// 누군가 수정하다 지워버린거같음(웹접근성하다가 안쓰는걸로 인식해서 지운거 같음)
					// 각각의 부칙 엘리먼트id값으로 위치정보 다시 적용함(이후 밑으로 전부) 2013.2.21 홍석균
					if(textRange.parentElement().parentNode.parentNode.name == "arDivs"
        			    || textRange.parentElement().parentNode.parentNode.parentNode.name == "arDivs"
        			    || textRange.parentElement().parentNode.parentNode.id.indexOf('ar') > -1
        			    || textRange.parentElement().parentNode.parentNode.parentNode.id.indexOf('ar') > -1
        			   )
        			{
                        var arInfsId='';
                        
                        if(textRange.parentElement().parentNode.parentNode.name == "arDivs"
            		        || textRange.parentElement().parentNode.parentNode.id.indexOf('ar') > -1
            		       )
            		    {
            		    	  arInfsId=textRange.parentElement().parentNode.parentNode.id;
            		    	  //location.href="#"+ arInfsId;
            		    }
            		    
            		    if(textRange.parentElement().parentNode.parentNode.parentNode.name == "arDivs"
            		        || textRange.parentElement().parentNode.parentNode.parentNode.id.indexOf('ar') > -1
            		       )
            		    {
            		    	  arInfsId=textRange.parentElement().parentNode.parentNode.parentNode.id;
            		    	  //location.href="#"+ arInfsId;
            		    }
		                
                        var arInfs=document.getElementsByName('arInf');
                        var arInfCnt=arInfs.length;
                        
                        if(arInfCnt > 1){
                            if(chkAr == 'ar'){
                                for(var i=0;i<arInfCnt-1;i++){
                                    var arInf=arInfs[i].value;
                                    
                                    if(arInfsId!='ar'+arInf){
                                        if(document.getElementById('ar'+arInfs[i].value)!=null && document.getElementById('ar'+arInfs[i].value).style.display == ''){
                                            arView('ar'+arInf);
                                        }
                                    }
                                }
                                
                            } else  if(arInfsId == 'ar'+arInfs[arInfCnt-1].value){
                                if(document.getElementById('ar'+arInfs[arInfCnt-2].value)!=null && document.getElementById('ar'+arInfs[arInfCnt-2].value).style.display == ''){
                                    arView('ar'+arInfs[arInfCnt-2].value);
                                }
                            }
                        }
                        
            		}else{
            		    if(chkAr == 'ar'){
            		        bodySearch(targetDiv, searchText, false, inputId, "up", 'ar');
            		        return;
            		    }
            		    
            		    var arInfs=document.getElementsByName('arInf');
                        var arInfCnt=arInfs.length;
                        
            		    if(arInfCnt > 1){
                            var arInf=arInfs[0].value;
                            
                            if(document.getElementById('ar'+arInf)!=null && document.getElementById('ar'+arInf).style.display == '') arView('ar'+arInf);
                            /*
                            for(var i=0;i<arInfCnt-1;i++){
                                var arInf=arInfs[i].value;
                                
                                if(document.getElementById('ar'+arInf)!=null && document.getElementById('ar'+arInf).style.display == ''){
                                    //arView('ar'+arInf);
                                }
                            }
                            */
                        }
            		}
                    
				}else{
					textRange.select();
					setTRangeSelectOn();
					
					if(textRange.parentElement().parentNode.parentNode.name == "arDivs"
        			    || textRange.parentElement().parentNode.parentNode.parentNode.name == "arDivs"
        			    || textRange.parentElement().parentNode.parentNode.id.indexOf('ar') > -1
        			    || textRange.parentElement().parentNode.parentNode.parentNode.id.indexOf('ar') > -1
        			   )
        			{
                        var arInfsId='';
                        
                        if(textRange.parentElement().parentNode.parentNode.name == "arDivs"
            		        || textRange.parentElement().parentNode.parentNode.id.indexOf('ar') > -1
            		       ) arInfsId=textRange.parentElement().parentNode.parentNode.id;
            		    
            		    if(textRange.parentElement().parentNode.parentNode.parentNode.name == "arDivs"
            		        || textRange.parentElement().parentNode.parentNode.parentNode.id.indexOf('ar') > -1
            		       ) arInfsId=textRange.parentElement().parentNode.parentNode.parentNode.id;
		                
                        var arInfs=document.getElementsByName('arInf');
                        var arInfCnt=arInfs.length;
                        
                        if(arInfCnt > 1){
                            if(arInfsId == 'ar'+arInfs[arInfCnt-1].value){
                                if(document.getElementById('ar'+arInfs[arInfCnt-2].value)!=null && document.getElementById('ar'+arInfs[arInfCnt-2].value).style.display == ''){
                                    arView('ar'+arInfs[arInfCnt-2].value);
                                }
                            }
                        }
            		}
				}
				
				if(chkAr!='ar') if(hasInput) document.getElementById(inputId).focus();
				else textRange.execCommand("Unselect");
				return;
			}
		} catch(e){
		    //if(chkMode == "up") setShowArUp3(hasInput, inputId);
        	//else setShowArDown2(hasInput, inputId);
        	
    		if(chkTmp1){
    			textRange=null;
				bodySearch(targetDiv, searchText, false, inputId, chkMode);
				chkTmp1=true;
		    }
		}
		
		if(chkImVal) textRange.collapse(false);
		chkImVal=true;
	}
	
	if(textRange==null || !strFound){
		textRange=document.body.createTextRange();
		textRange.moveToElementText(document.getElementById(targetDiv));
		
		if(chkMode == "up") strFound=textRange.findText(searchText, -100000000,4);
		else strFound=textRange.findText(searchText);
		
		try{
			if(strFound){
				textRange.select();
				setTRangeSelectOn();
				
				if(chkMode == "up"){
				    if(textRange.parentElement().parentNode.parentNode.name == "arDivs"
        			    || textRange.parentElement().parentNode.parentNode.parentNode.name == "arDivs"
        			    || textRange.parentElement().parentNode.parentNode.id.indexOf('ar') > -1
        			    || textRange.parentElement().parentNode.parentNode.parentNode.id.indexOf('ar') > -1
        			   )
        			{
            		    var arInfs=document.getElementsByName('arInf');
                        var arInfCnt=arInfs.length;
                        
            		    var arInfsId='';
            		    
            		    if(textRange.parentElement().parentNode.parentNode.name == "arDivs"
            		        || textRange.parentElement().parentNode.parentNode.id.indexOf('ar') > -1
            		       )  arInfsId=textRange.parentElement().parentNode.parentNode.id;
            		    
            		    if(textRange.parentElement().parentNode.parentNode.parentNode.name == "arDivs"
            		        || textRange.parentElement().parentNode.parentNode.parentNode.id.indexOf('ar') > -1
            		       ) arInfsId=textRange.parentElement().parentNode.parentNode.parentNode.id;
            		    
            		    if(arInfCnt > 1){
                            for(var i=0;i<arInfCnt-1;i++){
                                var arInf=arInfs[i].value;
                                
                                if(arInfsId!='ar'+arInf){
                                    if(document.getElementById('ar'+arInfs[i].value)!=null && document.getElementById('ar'+arInfs[i].value).style.display == ''){
                                        arView('ar'+arInf);
                                    }
                                }
                            }
                        }
                        
            		}else{
                        var arInfs=document.getElementsByName('arInf');
                        var arInfCnt=arInfs.length;
                        
                        if(arInfCnt > 1){
                            if(document.getElementById('ar'+arInfs[0].value)!=null && document.getElementById('ar'+arInfs[0].value).style.display == ''){
                                for(var i=0;i<arInfCnt-1;i++){
                                    var arInf=arInfs[i].value;
                                    
                                    arView('ar'+arInf);
                                }
                            }
                        }
                        
                        chkTmp1=true;
            		}
            		
				}else{
				    if(textRange.parentElement().parentNode.parentNode.name == "arDivs"
        			    || textRange.parentElement().parentNode.parentNode.parentNode.name == "arDivs"
        			    || textRange.parentElement().parentNode.parentNode.id.indexOf('ar') > -1
        			    || textRange.parentElement().parentNode.parentNode.parentNode.id.indexOf('ar') > -1
        			   )
        			{
            		    
            		}else{
                        var arInfs=document.getElementsByName('arInf');
                        var arInfCnt=arInfs.length;
                        
                        if(arInfCnt > 1){
                            if(document.getElementById('ar'+arInfs[0].value)!=null && document.getElementById('ar'+arInfs[0].value).style.display == ''){
                                for(var i=0;i<arInfCnt-1;i++){
                                    var arInf=arInfs[i].value;
                                    
                                    arView('ar'+arInf);
                                }
                            }
                        }
                        
                        chkTmp1=true;
            		}
				}
				
				if(hasInput) document.getElementById(inputId).focus();
			}
			
		} catch(e){
			//alert('\''+searchText+'\'를(을) 찾지 못했습니다.');
			isFirstSearch=true;
			return;
		}
		
		if(strFound){
			textRange.select();
			setTRangeSelectOn();
			
			if(hasInput) document.getElementById(inputId).focus();
		}
	}
	
	if(!strFound){
		//alert('\''+searchText+'\'를(을) 찾지 못했습니다.');
		isFirstSearch=true;
		return;
	}

}


function bodySearchReset(targetDiv){	
	var arInfs=document.getElementsByName('arInf');
    var arInfCnt=arInfs.length;
	if(textRange!=null && preSearchText!=null && preSearchText!=''){
		// 화면내검색은 닫혀있는(display none) 부칙의 내용검색이 안됨
		// 때문에 초기화할때도 전부열어놓고 처리 <2013.2.21 : 홍석균>
		if(arInfCnt > 0){
            for(var i=0;i<arInfCnt-1;i++){
                var arInf=arInfs[i].value;
                if(document.getElementById('ar'+arInf)!=null && document.getElementById('ar'+arInf).style.display!=''){
                    arView('ar'+arInf);
                }
            }
        }
		textRange=document.body.createTextRange();
		textRange.moveToElementText(document.getElementById(targetDiv));
		for(i=0;textRange.findText(preSearchText);i++){
			setTRangeOff();
			textRange.collapse(false);
		}
	}
}

function setTRangeOff(){
	textRange.execCommand("RemoveFormat");
	textRange.collapse(false);
}

function setTRangeSelectOn(){
	textRange.execCommand("RemoveFormat");
	textRange.execCommand("ForeColor", false, "#FFFFFF");
	textRange.execCommand("BackColor", false, "#FF0000");
}

function setTRangeSelectOff(){
	textRange.execCommand("RemoveFormat");
	textRange.execCommand("ForeColor", false, "#FF0000");
}

function setTRangeSelectOffUp(){
	TRangeCopy.execCommand("RemoveFormat");
	TRangeCopy.execCommand("ForeColor", false, "#a30200");
}

function setTRangeOn(){
	textRange.execCommand("ForeColor", false, "#FF0000");
}
