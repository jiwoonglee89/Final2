function passCheck()
{
	if(!document.deleteForm.password.value)
		{
			alert("비밀번호를 입력해 주세요.");
			return false;
		}
	else
		{
		alert("성공");
		
		}
	return true;	  
}