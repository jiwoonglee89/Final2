<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Jquery</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="<c:url value="resources/formula.js" />"></script>
<script>
document.write("<script type='text/javascript' src='resources/formula.js'><"+"/script>");
 $(document).ready(function(){
	 var function_id=null;
	 	//닫기 버튼 및 취소 버튼 클릭시 화면 닫기
			$("button.close").click
			(
				function()
				{
					$("#overLayer", parent.document).css("display","none");
					$("#glayLayer", parent.document).css("display","none");
				}
			);
			$("button.cancel").click
			(
				function()
				{
					$("#overLayer", parent.document).css("display","none");
					$("#glayLayer", parent.document).css("display","none");
				}
			);
			$("#confirm").click(function(){
				if(function_id!=null){
					var function_exe="txt_"+function_id;
					eval(function_exe+"();");
					$("#overLayer", parent.document).css("display","none");
					$("#glayLayer", parent.document).css("display","none");
				}else{	
					alert("함수를 선택해주세요");
				}				
			})
			$(".c_event div",this).click(function(){
			     function_id=$(this).attr("id");
			     $(".c_event div").css("background-color", "white");
			     $('#'+function_id).css("background-color", "#a0a0a0");
			     
			 });
			
		}); 
 
 /* 검색어 함수 */
 var TRange=null;
 function findString (str) {
 	if (parseInt(navigator.appVersion)<4)
 		return;
 	var strFound;	//찾을문자
 	
 	if (window.find) 
 	{
 		strFound=self.find(str);
 		if (!strFound) 
   		{
    		strFound=self.find(str,0,1);
    		while(self.find(str,0,1))
    			continue;
   		}
  	}
 	else if (navigator.appName.indexOf("Microsoft")!=-1) {
 		if (TRange!=null) {
    			TRange.collapse(false);
    			strFound=TRange.findText(str);
     			if (strFound)
    				TRange.select();
    			}
   		if (TRange==null || strFound==0) {
    			TRange=self.document.body.createTextRange();
    			strFound=TRange.findText(str);
    			 if (strFound)
    				TRange.select();
   		}
  	}
  	else if (navigator.appName=="Opera") {
   		alert ("Opera browsers not supported, sorry...")
   	return;
  	}
  	if (!strFound) 
  		alert ("String '"+str+"' not found!")
  	return;
 }
</script>
<style>
html
{
	display: block;
}
body
{
overflow: hidden;
}
#all 
{
	display: block;
}

#top {
	display:block;
	background-color: #2B2D35;
	height: 5%;
	width: 97.5%;
	float: right;
	border: 5px;
	position:fixed;
	top: 0px;
	
}

#close {
	text-align: centers;
	float: right;
 	margin-right: 20px;
}

#content 
{
 margin-top:21px;
 background-color:#F8F9F8;
 text-align: center;
 color:black;	
 padding: 15px;
}


#bottom {
	display:block;
	vertical-align: center;
	background-color: #E1E1E1;
	color: black;
	width: 97.5%;
	position:fixed; 
	bottom:0px;
}

#btn
{
	float: right;
	padding: 10px;
	width: 20%;	
}

#functionList
{
	overflow-y:scroll;
	display:block;
	height: 380px;
	border-color: black;
	border:1px;
	border: solid;
}

#functionList div
{
	border-bottom: double;
	background-color: white;
	text-align: center;
	vertical-align: middle;
	display:block;
	text-align: left;
}
#search
{
float: left;
}
#search_text
{
	margin: 10px;
}
</style>

</head>
<!-- oncontextmenu : 드래그 금지 -->
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false" >
	<div id='all'>
		<div id='top'>
			<button id='close' class="close">X</button>
		</div>
		<div id='content'>
			<div id="functionList" class="c_event">
				<div id="abs"  tabindex="0" class="f">함수 이름: ABS(number)<br> 함수 내용: 절대 값을 구합니다.</div>
				<div id="acos"  tabindex="0" >함수 이름: ACOS(number)<br> 함수 내용: 아크코사인값을 구합니다. </div>
				<div id="acosh" tabindex="0"  >함수 이름: ACOSH(number)<br>함수 내용: 역 하이퍼 코사인값을 구합니다.</div>
				<div id="address" tabindex="0" class="f">함수 이름: ADDRESS(row_number, column_number,abs_number,a1,sheet_text)<br>함수 내용: 행과 열로 지정된 셀의 주소를 반환합니다. </div>
				<div id="and" tabindex="0"  >함수 이름: AND(logical1, logical2, ...)<br>함수 내용:인수가 모두 TRUE이면 TRUE를 반환합니다. </div>				
				<div id="asin" tabindex="0"  >함수 이름: ASIN(number)<br>함수 내용: 아크사인값을 구합니다.</div>
				<div id="asinh" tabindex="0">함수 이름: ASINH(number)<br>함수 내용: 역 하이퍼볼릭 사인 값을 구합니다.</div>
				<div id="atan" tabindex="0">함수 이름: ATAN(number)<br>함수 내용: 아크탄젠트 값을 구합니다.</div>
				<div id="atan2" tabindex="0">함수 이름: ATAN2(x_num, y_num)<br>함수 내용: 지정된 x, y 좌표의 아크탄젠트 값을 구합니다. </div>
				<div id="atanh" tabindex="0">함수 이름: ATANH(number)<br>함수 내용: 역 하이퍼볼릭 탄젠트 값을 구합니다.</div>				
				<div id="average" tabindex="0">함수 이름: AVERAGE(number1, number2, ...)<br>함수 내용:모든 인수들의 평균을 구합니다. </div>
				<div id="betadist"  tabindex="0">함수 이름: BETADIST(x, alpha, beta, A, B)<br>함수 내용: 누적 베타 확률 밀도 함수값을 구합니다.</div>
				<div id="bin2dec"  tabindex="0">함수 이름: BIN2DEC(number)<br>함수 내용: 2진수를 10진수로 변환합니다.</div>
				<div id="bin2hex" tabindex="0">함수 이름: BIN2HEX(number, place)<br>함수 내용: 2진수를 16진수로 변환합니다.</div>
				<div id="bin2oct" tabindex="0">함수 이름: BIN2OCT(number, place)<br>함수 내용: 2진수를 8진수로 변환합니다.</div>
				<div id="binomdist"  tabindex="0">함수 이름: BINOMDIST(number_s, trials, probability_s, cummulative)<br>함수 내용: 개별항 이항 분포 확률을 구합니다.</div>
				<div id="ceiling"  tabindex="0">함수 이름: CEILING(number, significance)<br>함수 내용: 수를 significance의 배수가 되도록 절대 값을 올림합니다.</div>
				<div id="char"  tabindex="0" >함수 이름: CHAR(number)<br>함수 내용: 코드번호를 문자로 바꾸는 함수입니다. 인수로 128이 넘어가는 숫자를 지정하면, 이 번호에 해당하는 문자 코드가 없기 때문에 아무 내용도 출력하지 않습니다.</div>
				<div id="chidist"  tabindex="0">함수 이름: CHIDIST(x, deg_freedom)<br>함수 내용: 카이 제곱 분포의 단측 검정 확률값을 구합니다.</div>
				<div id="chitest"  tabindex="0">함수 이름: CHITEST(actual_range, expected_range)<br>함수 내용: 독립 검정 결과를 구합니다. 통계적이고 적절한 자유도에 대한 카이 제곱 분포값을 의미합니다.</div>
				<div id="code"  tabindex="0">함수 이름: CODE(text)<br>함수 내용: 문자를 코드 번호로 바꾸는 함수 입니다. 인수를 문장으로 지정한 경우에는 첫 글자의 코드번호를 구합니다.</div>
				<div id="column"  tabindex="0">함수 이름: COLUMN(reference)<br>함수 내용: 참조하고 있는 열 번호를 반환합니다. 참조가 생략되면 함수를 입력한 셀의 열 번호를 반환합니다.</div>
				<div id="columns"  tabindex="0">함수 이름: COLUMNS(reference)<br>함수 내용: 참조하고 있는 열의 수를 반환합니다.</div>
				<div id="combin"  tabindex="0">함수 이름: COMBIN(number, number_chosen)<br>함수 내용: 주어진 개체로 만들 수 있는 조합의 수를 구합니다.</div>
				<div id="concatenate" tabindex="0">함수 이름: CONCATENATE(text1, text2, ...)<br>함수 내용: 여러 셀에 나뉘어 입력된 문자 또는 수식을 결합해 하나의 셀에 입력할 때 사용합니다. CONCATENATE 함수 대신 & 연산자를 사용해도 됩니다. Text 인수는 30개까지 지정할 수 있으며, 텍스트, 숫자, 셀 등을 지정할 수 있습니다.</div>
				<div id="confidence" tabindex="0">함수 이름: CONFIDENCE(alpha, standard_dev, size)<br>함수 내용: 모집단 평균의 신뢰 구간을 표시합니다.</div>
				<div id="correl" tabindex="0">함수 이름: CORREL(array1, array2)<br>함수 내용: 두 데이터 집합 사이의 상관계수를 표시합니다.</div>
				<div id="cos" tabindex="0">함수 이름: COS(number)<br>함수 내용: 코사인값을 구합니다.</div>
				<div id="cosh" tabindex="0">함수 이름: COSH(number)<br>함수 내용: 하이퍼블릭 코사인값을 구합니다.</div>
				<div id="count" tabindex="0">함수 이름:COUNT(value1, value2, ...)<br> 함수 내용: 범위에서 숫자가 포함된 셀의 개수를 구합니다.</div>
				<div id="counta" tabindex="0">함수 이름: COUNTA(value1, value2, ...)<br>함수 내용: 범위에서 비어 있지 않은 셀의 개수를 구합니다.</div>
				<div id="countblank" tabindex="0">함수 이름: COUNTBLANK(range)<br>함수 내용: 범위에서 비어 있는 셀의 개수를 구합니다.</div>
				<div id="countif" tabindex="0">함수 이름: COUNTIF(number)<br>함수 내용: 주어진 찾을 조건과 일치하는 범위의 값이 들어 있는 셀 개수를 구합니다.</div>
				<div id="covar" tabindex="0">함수 이름: COVAR(array1, array2)<br>함수 내용: 각 데이터 쌍의 공분산을 표시합니다.</div>
				<div id="date" tabindex="0">함수 이름: DATE(year, month, day)<br>함수 내용: 년, 월, 일 데이터를 통합해 연월일 데이터로 만듭니다. 또는 각각의 셀에 나뉘어 입력되어있는 날짜 데이터에서 연월일을 통합해 하나의 셀에 입력합니다.</div>
				<div id="dya" tabindex="0">함수 이름: DAY(serial_number)<br>함수 내용:날짜가 입력되어있는 셀에서 날짜(1부터 31까지의 정수)만 추출해 현재 셀에 입력합니다. 인수는 현재 날짜가 입력된 셀을 이용합니다. 날짜가 입력된 셀이 없을 때에는 =DAY(DATE(2011,3,7))식으로 DATE함수와 함께 사용해야 합니다. </div>
				<div id="dec2bin" tabindex="0">함수 이름: DEC2BIN(number, place)<br>함수 내용: 10진수를 2진수로 변환합니다.</div>
				<div id="dec2hex" tabindex="0">함수 이름: DEC2HEX(number, place)<br>함수 내용: 10진수를 16진수로 변환합니다.</div>
				<div id="dec2oct" tabindex="0">함수 이름: DEC2OCT(number, place)<br>함수 내용: 10진수를 8진수로 변환합니다.</div>
				<div id="degrees" tabindex="0">함수 이름: DEGREES(angle)<br>함수 내용: 라디안을 각도를 변환합니다.</div>
				<div id="even" tabindex="0">함수 이름: EVEN(number)<br>함수 내용: 가장 가까운 짝수인 정수로 양수는 올림하고 음수는 내림합니다.</div>
				<div id="exp" tabindex="0">함수 이름: EXP(number)<br>함수 내용: 자연로그 e의 거듭제곱을 구합니다.</div>
				<div id="expondist" tabindex="0">함수 이름: EXPONDIST(x, lambda, cummulative)<br>함수 내용: 지수 분포의 확률값을 구합니다.</div>
				<div id="fact" tabindex="0">함수 이름: FACT(number)<br>함수 내용: 계승값을 구합니다.</div>
				<div id="false" tabindex="0">함수 이름: FALSE( )<br>함수 내용: 인수없이 FALSE를 돌려줍니다.</div>
				<div id="fdist" tabindex="0">함수 이름: FDIST(x, deg_freedom1, deg_freedom2)<br>함수 내용: 두 데이터 집합에 대해 F 확률 분포값을 구합니다.</div>
				<div id="find" tabindex="0">함수 이름: FIND(find_text, within_text, start_num)<br>함수 내용: 지정한 문자열 안에서 원하는 문자의 위치를 찾습니다. FIND함수는 대/소문자를 구분합니다.</div>
				<div id="fixed" tabindex="0">함수 이름: FIXED(number, decimals, no_commas)<br>함수 내용: 고정 소수점과 '쉼표 스타일'을 지정합니다.</div>
				<div id="floor" tabindex="0">함수 이름: FLOOR(number, significance)<br>함수 내용: 수를 significance의 배수가 되도록 절대 값을 내림합니다.</div>
				<div id="ftest" tabindex="0">함수 이름: FTEST(array1, array2)<br>함수 내용: F 검정 결과를 표시합니다.</div>
				<div id="gammadist" tabindex="0">함수 이름: GAMMADIST(x, alpha, beta, cummulative)<br>함수 내용: 감마 분포값을 구합니다.</div>
				<div id="gammaln" tabindex="0">함수 이름: GAMMALN(x)<br>함수 내용: 감마 함수 G(x)의 자연 로그값을 구합니다.</div>
				<div id="gcd" tabindex="0">함수 이름: GCD(number1, number2, ...)<br>함수 내용: 최대공약수를 구합니다.</div>
				<div id="geomean" tabindex="0">함수 이름: GEOMEAN(number1, number2, ...)<br>함수 내용: 기하 평균을 구합니다.</div>
				<div id="harmean" tabindex="0">함수 이름: HARMEAN(number1, number2, ...)<br>함수 내용: 조화 평균을 구합니다.</div>
				<div id="hex2bin" tabindex="0">함수 이름: HEX2BIN(number, place)<br>함수 내용: 16진수를 2진수로 변환합니다.</div>
				<div id="hex2dec" tabindex="0">함수 이름: HEX2DEC(number)<br>함수 내용: 16진수를 10진수로 변환합니다.</div>
				<div id="hex2oct" tabindex="0">함수 이름: HEX2OCT(number, place)<br>함수 내용: 16진수를 8진수로 변환합니다.</div>
				<div id="hlookup" tabindex="0">함수 이름: HLOOKUP(lookup_value, table_array, row_index_number, range_lookup)<br>함수 내용: 범위의 첫 번째 행을 검색한 후 참조 범위의 같은 열에 있는 셀 값을 반환합니다.</div>
				<div id="hour" tabindex="0">함수 이름: HOUR(serial_number)<br>함수 내용: 시간이 입력되어있는 셀에서 시만 추출해서 현재 셀에 입력합니다. 24시간이므로 0부터 23까지의 숫자로 표시합니다. 인수는 현재 시간이 입력된 셀을 이용합니다. 시간이 입력된 셀이 없을 때에는 =HOUR(TIME(12,13,14))식으로 TIME함수와 함께 사용해야 합니다.</div>
				<div id="hypgeomdist" tabindex="0">함수 이름: HYPGEOMDIST(sample_s, number_sample, population_s, number_pop)<br>함수 내용: 초기하 분포값을 구합니다.</div>
				<div id="index" tabindex="0">함수 이름: INDEX(reference, row_number, column_number)<br>함수 내용: 범위에서 행과 열 번호 인덱스로 선택한 요소의 값을 반환합니다.</div>
				<div id="if" tabindex="0">함수 이름: IF(logical_test, value_if_true, value_if_false)<br>함수 내용: 데이터를 비교 분석해 참값과 거짓값을 입력합니다. 7번까지 중첩해서 사용할 수 있으므로, 여러가지 조건일 때는 IF함수를 중첩해서 사용합니다.</div>
				<div id="iferror" tabindex="0">함수 이름: IFERROR(value, value_if_error)<br>함수 내용: 식이나 식 자체의 값이 오류인 경우 value_if_error를 반환합니다.</div>
				<div id="int" tabindex="0">함수 이름: INT(number)<br>함수 내용: 버림을 하여 가장 가가운 정수로 만듭니다.</div>
				<div id="intercept" tabindex="0">함수 이름: INTERCEPT(known_y's, known_x's)<br>함수 내용: 주어진 x, y 값에 의거한 선형 회귀선의 y 절편을 구합니다.</div>
				<div id="isblank" tabindex="0">함수 이름: ISBLANK(value)<br>함수 내용: 값이 없으면 TRUE를 표시합니다.</div>
				<div id="iserr" tabindex="0">함수 이름: ISERR(value)<br>함수 내용: #N/A를 제외한 오류값이면 TRUE를 표시합니다.</div>
				<div id="iserror" tabindex="0">함수 이름: ISERROR(value)<br>함수 내용: 오류값이면 TRUE를 표시합니다.</div>
				<div id="isna" tabindex="0">함수 이름: ISNA(value)<br>함수 내용: #N/A 오류값이면 TRUE를 표시합니다.</div>
				<div id="isnumber" tabindex="0">함수 이름: ISNUMBER(value)<br>함수 내용: 숫자이면 TRUE를 표시합니다.</div>
				<div id="istext" tabindex="0">함수 이름: ISTEXT(value)<br>함수 내용: 문자열이면 TRUE를 표시합니다.</div>
				<div id="kurt" tabindex="0">함수 이름: KURT()<br>함수 내용:데이터 집합의 첨도를 구합니다. </div>
				<div id="large" tabindex="0">함수 이름: LARGE(array, k)<br>함수 내용: 데이터 집합에서 k번째로 큰값을 구합니다.</div>
				<div id="lcm" tabindex="0">함수 이름: LCM(number1, number2, ...)<br>함수 내용: 최소공배수를 구합니다.</div>
				<div id="left" tabindex="0">함수 이름: LEFT(text, num_chars)<br>함수 내용: 원본 데이터에서 왼쪽을 기준으로 지정된 수만큼 문자나 숫자를 추출해 문자로 입력합니다. LEFT함수로 추출한 숫자는 문자로 인식된다는 점 주의해주세요.</div>
				<div id="len" tabindex="0">함수 이름: LEN(text)<br>함수 내용: 문자의 개수를 출력합니다. Spacebar를 눌러 입력한 공백도 문자의 개수에 포함됩니다.</div>
				<div id="ln" tabindex="0">함수 이름: LN(number)<br>함수 내용: 자연 로그값을 구합니다.</div>
				<div id="log" tabindex="0">함수 이름: LOG(number, base)<br>함수 내용: 지정한 수를 밑으로 하는 로그값을 구합니다.</div>
				<div id="log10" tabindex="0">함수 이름: LOG10(number)<br>함수 내용: 10을 밑으로 하는 로그값을 구합니다.</div>
				<div id="lookup" tabindex="0">함수 이름: LOOKUP(lookup_value, reference, result_refefence)<br>함수 내용:행이나 열로 이루어진 참조 범위의 값을 반환합니다. 벡터형과 배열형 두 가지 형식을 지원합니다. </div>
				<div id="lower" tabindex="0">함수 이름: LOWER(text)<br>함수 내용: 영문 대문자로 입력된 내용을 모두 소문자로 바꾸는 함수입니다.</div>
				<div id="match" tabindex="0">함수 이름: MATCH(lookup_value, lookup_array, match_type)<br>함수 내용: 범위에서 지정된 항목을 검색한 다음 해당 항목의 상대 위치를 반환합니다.</div>
				<div id="max" tabindex="0">함수 이름: MAX(number1, number2, ...)<br>함수 내용: 인수 목록의 최대값을 표시합니다.</div>
				<div id="median" tabindex="0">함수 이름: MEDIAN(number1, number2, ...)<br>함수 내용: 주어진 수들의 중앙값을 표시합니다.</div>
				<div id="mid" tabindex="0">함수 이름: MID(text, start_num, num_bytes)<br>함수 내용: LEFT, RIGHT 함수처럼 원본 데이터에서 지정한 수만큼 문자나 숫자를 가져옵니다. 다른 점은 사용자가 정한 시작 위치를 기준으로 문자나 숫자를 가져온다는 점입니다. 즉, 시작위치를 3으로, 가져올 글자를 2로 정하면 세 번째부터 두 글자를 가져옵니다.</div>
				<div id="min" tabindex="0">함수 이름: MIN(number1, number2, ...)<br>함수 내용: 인수 목록의 최소값을 표시합니다.</div>
				<div id="minute" tabindex="0">함수 이름: MINUTE(serial_number)<br>함수 내용: 시간이 입력되어있는 셀에서 분만 추출해 현재 셀에 입력합니다. 60분이므로 0부터 59까지 숫자로 표시합니다. 인수는 현재 시간이 입력된 셀을 이용합니다. 시간이 입력된 셀이 없을 때에는 =MINUTE(TIME(17,25,35)) 식으로 TIME 함수와 함께 사용해야 합니다.</div>
				<div id="mod" tabindex="0">함수 이름: MOD(number, divisor)<br>함수 내용: 나눗셈의 나머지를 구합니다.</div>
				<div id="mode" tabindex="0">함수 이름: MODE(number1, number2, ...)<br>함수 내용: 데이터 집합에서 가장 자주 발생하는 값(최빈수)를 구합니다.</div>
				<div id="month" tabindex="0">함수 이름: MONTH(serial_number)<br>함수 내용: 날짜가 입력되어있는 셀에서 월(1부터 12까지의 정수)만 추출해 현재 셀에 입력합니다. 인수는 날짜 데이터 또는 날짜가 입력된 셀을 이용합니다. 날짜가 입력된 셀이 없을 때에는 =MONTH(DATE(2011,3,7))식으로 DATE함수와 함께 사용해야 합니다.</div>
				<div id="na" tabindex="0">함수 이름: NA( )<br>함수 내용: #N/A 오류 값을 돌려줍니다.</div>
				<div id="normdist" tabindex="0">함수 이름: NORMDIST(x, mean, standard_dev, cummulative)<br>함수 내용: 누적 정규 분포의 확률값을 구합니다.</div>
				<div id="normsdist" tabindex="0">함수 이름: NORMSDIST(z)<br>함수 내용: 누적 정규 분포의 확률값을 구합니다.</div>
				<div id="not" tabindex="0">함수 이름: NOT(logical)<br>함수 내용: NOT은 TRUE와 FALSE의 논리 값을 참조하여 반대의 값을 돌려줍니다. IF함수를 비롯해 대부분 함수에서는 TRUE와 FALSE를 1과 0이라고 숫자로 표시합니다.</div>
				<div id="now" tabindex="0">함수 이름: NOW( )<br>함수 내용: 선택되어있는 셀에 현재 날짜와 시간을 입력합니다. 인수없이 사용하며,NOW함수가 계산된 셀에는 항상 컴퓨터 시스템의 현재 날짜와 시간이 자동으로 입력됩니다.</div>
				<div id="oct2bin" tabindex="0">함수 이름: OCT2BIN(number, place)<br>함수 내용: 8진수를 2진수로 변환합니다.</div>
				<div id="oct2dec" tabindex="0">함수 이름: OCT2DEC(number)<br>함수 내용: 8진수를 10진수로 변환합니다.</div>
				<div id="oct2hex" tabindex="0">함수 이름: OCT2HEX(number, place)<br> 함수 내용: 8진수를 16진수로 변환합니다.</div>
				<div id="odd" tabindex="0">함수 이름: ODD(number)<br>함수 내용: 주어진 수에 가장 가까운 홀수로, 양수인 경우 올림하고 음수인 경우 내림합니다.</div>
				<div id="or" tabindex="0">함수 이름: OR(logical1, logical2, ...)<br>함수 내용: 두개 이상의 조건을 제시하고, 모든 조건 중에서 하나 이상만 만족시키면 참(TRUE)으로 표시하는 함수입니다. 주로 IF함수와 같이 사용해 논리식을 만듭니다.</div>
				<div id="pearson" tabindex="0">함수 이름: PEARSON(array1, array2)<br>함수 내용: 피어슨 곱 모멘트의 상관 계수 r을 구합니다.</div>
				<div id="percentile" tabindex="0">함수 이름: PERCENTILE(array, k)<br>함수 내용: 범위에서 k번째 백분위수 구합니다.</div>
				<div id="percentrank" tabindex="0">함수 이름: PERCENTRANK(array, x, significance)<br>함수 내용: 데이터 집합에서 특정 값의 백분율 순위를 표시합니다.</div>
				<div id="permut" tabindex="0">함수 이름: PERMUT(number, number_chosen)<br>함수 내용: 주어진 개체로 만들 수 있는 순열의 개수를 구합니다.</div>
				<div id="pi" tabindex="0">함수 이름: PI( )<br>함수 내용: Pi 값을 구합니다.</div>
				<div id="poisson" tabindex="0">함수 이름: POISSON(x, mean, cummulative)<br>함수 내용: 포아송 확률 분포값을 구합니다.</div>
				<div id="power" tabindex="0">함수 이름: POWER(number, power)<br>함수 내용: 거듭제곱값을 구합니다.</div>
				<div id="product" tabindex="0">함수 이름: PRODUCT(number1, number2, ...)<br>함수 내용: 인수의 곱을 구합니다.</div>
				<div id="radians" tabindex="0">함수 이름: RADIANS(angle)<br>함수 내용: 각도를 라디안으로 환산합니다.</div>
				<div id="rand" tabindex="0">함수 이름: RAND( )<br>함수 내용: 0에서 1사이의 난수를 구합니다.</div>
				<div id="rank" tabindex="0">함수 이름: RANK(number, ref, order)<br>함수 내용: 수 목록에서 특정 수의 순위를 구합니다.</div>
				<div id="replace" tabindex="0">함수 이름: REPLACE(old_text, start_num, num_chars, new_text)<br>함수 내용: 셀에 입력한 문자의 위치를 지정해 다른 내용으로 바꿉니다. 예를 들어 '하얀 파도'에서 '하얀'을 '푸른'으로 바꾸려면 '첫 문자부터 두 글자를 '겨울'로 바꾸겠다'고 지정하면 됩니다.</div>				
				<div id="rept" tabindex="0">함수 이름: REPT(text, number_times)<br>함수 내용: 일정한 글자나 숫자를 지정한 횟수만큼 반복해 입력합니다.</div>
				<div id="right" tabindex="0">함수 이름: RIGHT(text, num_chars)<br>함수 내용: 원본 데이터에서 오른쪽을 기준으로 지정된 수만큼 문자나 숫자를 추출해 문자로 입력합니다. 주의할 점은 RIGHT함수로 추출한 숫자는 문자로 인식된다는 점입니다.</div>
				<div id="round" tabindex="0">함수 이름: ROUND(number, num_digits)<br>함수 내용: 수를 지정한 자리수로 반올림합니다.</div>
				<div id="rounddown" tabindex="0">함수 이름: ROUNDDOWN(number, num_digits)<br>함수 내용: 0에 가까워지도록 수를 내림합니다.</div>
				<div id="roundup" tabindex="0">함수 이름: ROUNDUP(number, num_digits)<br>함수 내용: 0에서 멀어지도록 올림합니다.</div>				
				<div id="row" tabindex="0">함수 이름: ROW(reference)<br>함수 내용: 참조하고 있는 행 번호를 반환합니다. 참조가 생략되면 함수를 입력한 셀의 행 번호를 반환합니다.</div>
				<div id="rows" tabindex="0">함수 이름: ROWS(reference)<br>함수 내용: 참조하고 있는 행의 수를 반환합니다.</div>
				<div id="search" tabindex="0">함수 이름: SEARCH(find_text, within_text, start_num)<br>함수 내용: 어떤 문자열을 다른 문자열 내에서 찾습니다(대소문자 구분하지 않음).</div>
				<div id="second" tabindex="0">함수 이름: SECOND(serial_number)<br>함수 내용: 시간이 입력되어있는 셀에서 초만 추출해 현재 셀에 입력합니다. 60초이므로 0부터 59까지의 숫자로 표시합니다. 인수는 시간이 입력된 셀을 이용합니다. 시간이 입력된 셀이 없을 때에는 =SECOND(TIME(18,22,30))식으로 TIME함수와 함께 사용해야 합니다.</div>
				<div id="sign" tabindex="0">함수 이름: SIGN(number)<br>함수 내용:숫자의 부호를 표시합니다. </div>				
				<div id="sin" tabindex="0">함수 이름: SIN(number)<br>함수 내용: 사인값을 구합니다.</div>
				<div id="sinh" tabindex="0">함수 이름: SINH(number)<br>함수 내용: 하이퍼블릭 사인값을 구합니다.</div>
				<div id="skew" tabindex="0">함수 이름: SKEW(number1, number2, ...)<br>함수 내용: 분포의 왜곡도를 구합니다.</div>
				<div id="slope" tabindex="0">함수 이름: SLOPE(known_y's, known_x's)<br>함수 내용: 선형 회귀선의 기울기를 구합니다.</div>
				<div id="small" tabindex="0">함수 이름: SMALL(array, k)<br>함수 내용: 데이터 집합에서 k번째로 작은 값을 구합니다.</div>				
				<div id="sqrt" tabindex="0">함수 이름: SQRT(number)<br>함수 내용: 양의 제곱근을 구합니다.</div>
				<div id="sqrtpi" tabindex="0">함수 이름: SQRTPI(number)<br>함수 내용: (number*pi)의 제곱근을 반환합니다.</div>
				<div id="standardize" tabindex="0">함수 이름: STANDARDIZE(x, mean, stardard_dev)<br>함수 내용: 정규화된 값을 구합니다.</div>
				<div id="stdev" tabindex="0">함수 이름: STDEV(number1, number2, ...)<br>함수 내용: 표본 집단의 표준 편차를 구합니다.</div>
				<div id="substitute" tabindex="0">함수 이름: SUBSTITUTE(text, old_text, new_text, instance_num)<br>함수 내용: 텍스트 중의 old_text를 찾아서 new_text로 바꿉니다.</div>			
				<div id="sum" tabindex="0">함수 이름: SUM(number1, number2, ...)<br>함수 내용: 인수들의 합을 구합니다.</div>
				<div id="sumif" tabindex="0">함수 이름: SUMIF(range, criteria, sum_range)<br>함수 내용: 조건을 제시하고, 조건에 맞는 데이터의 합계를 구합니다. 더 자세히 설명하면, 조건의 범위에 포함된 합계를 구할 영역(Sum_ Range)에서 하나의 조건(Criteria)에 맞는 데이터의 합을 구합니다. 이름 그대로 IF함수와 SUM함수가 합쳐졌다고 생각하면 됩니다.</div>
				<div id="sumproduct" tabindex="0">함수 이름: SUMPRODUCT(array1, array2, array3, ...)<br>함수 내용: 대응하는 배열 요소끼리의 곱을 모두 더합니다.</div>
				<div id="sumsq" tabindex="0">함수 이름: SUMSQ(number1, number2, ...)<br>함수 내용: 인수의 제곱의 합을 구합니다.</div>
				<div id="tan" tabindex="0">함수 이름: TAN(number)<br>함수 내용: 탄젠트값을 구합니다.</div>			
				<div id="tanh" tabindex="0">함수 이름: TANH(number)<br>함수 내용: 하이퍼블릭 탄젠트값을 구합니다.</div>
				<div id="tdist" tabindex="0">함수 이름: TDIST(x, deg_freedom, tails)<br>함수 내용: 스튜던트 t-분포값을 구합니다.</div>
				<div id="text" tabindex="0">함수 이름: TEXT(value, format_text)<br>함수 내용: 숫자에 표시 형식을 지정한 후 문자 데이터로 입력합니다.</div>
				<div id="time" tabindex="0">함수 이름: TIME(hour, minute, second)<br>함수 내용: 특정 시간에 해당하는 일련 번호를 구합니다.</div>
				<div id="today" tabindex="0">함수 이름: TODAY( )<br>함수 내용: 선택되어있는 셀에 오늘 날짜를 입력합니다. 인수 없이 사용하며,TODAY함수가 계산된 셀에는 항상 컴퓨터 시스템의 현재 날짜가 자동으로 입력됩니다.</div>			
				<div id="trim" tabindex="0">함수 이름: TRIM(text)<br>함수 내용: 문자열에서 공백을 제거합니다.</div>
				<div id="true" tabindex="0">함수 이름: TRUE( )<br>함수 내용: 인수 없이 TRUE를 돌려줍니다.</div>
				<div id="trunc" tabindex="0">함수 이름: TRUNC(number, num_digits)<br>함수 내용: 지정한 자릿수만을 소수점 아래에 남기고 나머지 자리를 버립니다.</div>
				<div id="ttest" tabindex="0">함수 이름: TTEST(array1, array2, tails, type)<br>함수 내용: 스튜던트 t 검정에 근거한 확률을 구합니다.</div>
				<div id="upper" tabindex="0">함수 이름: UPPER(text)<br>함수 내용: 텍스트 문자열을 모두 대문자로 바꿉니다.</div>				
				<div id="value" tabindex="0">함수 이름: VALUE(text)<br>함수 내용: 텍스트 문자열 인수를 숫자로 바꿉니다.</div>
				<div id="var" tabindex="0">함수 이름: VAR(number1, number2, ...)<br>함수 내용: 표본 집단의 분산을 구합니다.</div>
				<div id="vlookup" tabindex="0">함수 이름: VLOOKUP(lookup_value, table_array, col_index_number, range_lookup)<br>함수 내용: 범위의 첫 번째 열을 검색한 후 참조 범위의 같은 행에 있는 셀 값을 반환합니다.</div>
				<div id="weekday" tabindex="0">함수 이름: WEEKDAY(serial_number, return_type)<br>함수 내용: Serial_number 인수에 입력한 날짜를 참조해, Return_type인수에 입력한 숫자를 토대로 요일을 숫자(1~7, 또는 0~6)로 바꿔 출력합니다. '월요일' 형태로 요일을 표시하려면 'aaaa', '월' 형태로 표시하려면 'aaa', '(월)'로 표시하려면 '(aaa)'로 사용자 지정표시 형식을 만들어 사용합니다.</div>
				<div id="weibull" tabindex="0">함수 이름: WEIBULL(x, alpha, beta, cumulative)<br>함수 내용: 와이블 분포값을 구합니다.</div>			
				<div id="year" tabindex="0">함수 이름: YEAR(serial_number)<br>함수 내용: 날짜가 입력되어있는 셀에서 연도(1900부터 9999년 까지의 정수)만 추출해, 현재 셀에 입력합니다. 날짜가 입력된 셀이 없을때에는 =YEAR(DATE(2011,3,7))식으로 DATE함수와 함께 사용합니다.</div>
			</div>
		</div>
		<div id='bottom'>
		<div id="search">
			<input type="text" placeholder="함수 이름 검색" name="search_text" size="20" id="search_text"
			onkeypress="javascript:if(event.keyCode==13){findString($('#search_text').val()); return false;}">
		</div>	
		<div id="btn">
			<button id="confirm">확인</button>
			<button id="cancel" class="cancel">취소</button>
		</div>
		</div>
	</div>
</body>
</html>