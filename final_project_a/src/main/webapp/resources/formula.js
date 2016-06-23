var th = [ "", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K","L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];

function cell_plus(cell1, cell2){
	var cell1_en=cell1.substring(0,1);
	var cell1_num=cell1.substring(1,2);
	var cell2_en=cell2.substring(0,1);
	var cell2_num=cell2.substring(1,2);
	
	var start=th.indexOf(cell1_en);
	var end=th.indexOf(cell2_en);
	var result=0;
	for (var i=cell1_num;i<=cell2_num;i++){
		for (var j=start;j<=end;j++){
			result+=Number($('#'+th[j]+i).text());
		}
	}
	return result;
}
function multi(cell1, cell2){
	var cell1_en=cell1.substring(0,1);
	var cell1_num=cell1.substring(1,2);
	var cell2_en=cell2.substring(0,1);
	var cell2_num=cell2.substring(1,2);
	
	var start=th.indexOf(cell1_en);
	var end=th.indexOf(cell2_en);
	var result=1;
	for (var i=cell1_num;i<=cell2_num;i++){
		for (var j=start;j<=end;j++){
			result*=Number($('#'+th[j]+i).text());
		}
	}
	return result;
}
function num_max(cell1, cell2){
	var cell1_en=cell1.substring(0,1);
	var cell1_num=cell1.substring(1,2);
	var cell2_en=cell2.substring(0,1);
	var cell2_num=cell2.substring(1,2);
	
	var start=th.indexOf(cell1_en);
	var end=th.indexOf(cell2_en);
	var cells=new Array();
	var len=end*cell2_num;
	for (var i=cell1_num;i<=cell2_num;i++){
		for (var j=start;j<=end;j++){
			cells[--len]=Number($('#'+th[j]+i).text());
		}
	}
	return Math.max.apply(null, cells);
}
function num_min(cell1, cell2){
	var cell1_en=cell1.substring(0,1);
	var cell1_num=cell1.substring(1,2);
	var cell2_en=cell2.substring(0,1);
	var cell2_num=cell2.substring(1,2);
	
	var start=th.indexOf(cell1_en);
	var end=th.indexOf(cell2_en);
	var cells=new Array();
	var len=end*cell2_num;
	for (var i=cell1_num;i<=cell2_num;i++){
		for (var j=start;j<=end;j++){
			cells[--len]=Number($('#'+th[j]+i).text());
		}
	}
	return Math.min.apply(null, cells);
}
function num_abs(cell){
	var result=0;
	result=Number($('#'+cell).text());
	return Math.abs(result);
}
function avg(cell1, cell2){
	var cell1_en=cell1.substring(0,1);
	var cell1_num=cell1.substring(1,2);
	var cell2_en=cell2.substring(0,1);
	var cell2_num=cell2.substring(1,2);
	
	var start=th.indexOf(cell1_en);
	var end=th.indexOf(cell2_en);
	var index_num=cell2_num*end;
	var result=0;
	for (var i=cell1_num;i<=cell2_num;i++){
		for (var j=start;j<=end;j++){
			result+=Number($('#'+th[j]+i).text());
		}
	}
	return result/index_num;
}