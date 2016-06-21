function resizeWind(win)
{
	//30 과 40은 넉넉하게 하려는 임의의 값임
	var wid = win.document.body.offsetWidth + 30;
	var hei = win.document.body.offsetHeight + 40;        
	win.resizeTo(wid,hei);
}

function dongCheck() {
		if (!document.zipForm.area4.value) 
		{
			alert("검색어를 입력하세요!");
			document.zipForm.area4.focus();
			return false;
		}
		document.zipForm.submit();
		//return true;
	}

function sendAddress(zipcode, area1, area2, area3, area4) {
	var address = area1 + " " + area2 + " " + area3 + " " + area4;
	opener.document.joinF.zipcode.value = zipcode;
	opener.document.joinF.address.value = address;
	self.close();
}