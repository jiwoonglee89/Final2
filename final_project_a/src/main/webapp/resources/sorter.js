function div_sorter(div_name){
	var for_sorter_num=new Array();
	var for_sorter_ch=new Array();
	var for_sorter=new Array();
	for (var j = 1; j <= 100; j++) {
		if($('#'+div_name+j).text()!='' && $('#'+div_name+j).text()!=null){
			if(isNaN(Number($('#'+div_name+j).text()))==false){
				for_sorter_num.push(Number($('#'+div_name+j).text()));
			}else{
				for_sorter_ch.push($('#'+div_name+j).text());
			}
		}
	}	
	for_sorter_num.sort(compNumber);
	for_sorter_ch.sort(compString);
	for(var i=0;i<for_sorter_num.length;i++){
		for_sorter.push(for_sorter_num[i]);
	}
	for(var i=0;i<for_sorter_ch.length;i++){
		for_sorter.push(for_sorter_ch[i]);
	}
	
	
	for (var j = 1; j <= 100; j++) {
		if($('#'+div_name+j).text()!='' && $('#'+div_name+j).text()!=null)
			$('#'+div_name+j).text(for_sorter.pop());
	}
}
function div_sorter2(div_name){
	var for_sorter_num=new Array();
	var for_sorter_ch=new Array();
	var for_sorter=new Array();
	for (var j = 1; j <= 100; j++) {
		if($('#'+div_name+j).text()!='' && $('#'+div_name+j).text()!=null){
			if(isNaN(Number($('#'+div_name+j).text()))==false){
				for_sorter_num.push(Number($('#'+div_name+j).text()));
			}else{
				for_sorter_ch.push($('#'+div_name+j).text());
			}
		}
	}	
	for_sorter_num.sort(compNumberReverse);
	for_sorter_ch.sort(compStringReverse	);
	for(var i=0;i<for_sorter_num.length;i++){
		for_sorter.push(for_sorter_num[i]);
	}
	for(var i=0;i<for_sorter_ch.length;i++){
		for_sorter.push(for_sorter_ch[i]);
	}
	
	
	for (var j = 1; j <= 100; j++) {
		if($('#'+div_name+j).text()!='' && $('#'+div_name+j).text()!=null)
			$('#'+div_name+j).text(for_sorter.pop());
	}
}
function compNumber(a, b) {
	return a - b;
}
function compNumberReverse(a, b){
	return b - a;
}
function compString(a, b) {
	if (a > b) 
	  return -1;
	if (b > a) 
	  return 1;
	return 0;
}
function compStringReverse(a, b) {
	if (a < b) 
	  return -1;
	if (b > a) 
	  return 1;
	return 0;
}