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
 $(document).ready(function()
		{
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
			$('#function').click(function(){
				$('#function').attr('class','selected');
			});
			
			$("#formula").foucs(function()
			{
				$("#function").click(function(){
					$("#function").text();
				});
			});
			
			
		}); 

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

#function
{
	border-bottom: double;
	background-color: white;
	text-align: center;
	vertical-align: middle;
	display:block;
}
#function:ACTIVE 
{
	background-color: #a0a0a0;
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
			<div id="functionList" >
			<%-- <c:forEach begin="1" end="151" step="1"> --%>
				<div id="function">[함수 이름: ABS(number) / 함수 내용: 절대 값을 구합니다. ]</div>
				<div id="function">[함수 이름: ACOS(number) / 함수 내용: ]</div>
				<div id="function">[함수 이름: ACOSH(number)/ 함수 내용: ]</div>
				<div id="function">[함수 이름: ADDRESS(row_number, column_number,[abs_number],[a1],[sheet_text])/ 함수 내용: 행과 열로 지정된 셀의 주소를 반환합니다. ]</div>
				<div id="function">[함수 이름: AND(logical1, [logical2], ...)/ 함수 내용:인수가 모두 TRUE이면 TRUE를 반환합니다. ]</div>
				
				<div id="function">[함수 이름: ASIN(number)/ 함수 내용: 아크사인값을 구합니다.]</div>
				<div id="function">[함수 이름: ASINH(number)/ 함수 내용: 역 하이퍼볼릭 사인 값을 구합니다.]</div>
				<div id="function">[함수 이름: ATAN(number)/ 함수 내용: 아크탄젠트 값을 구합니다.]</div>
				<div id="function">[함수 이름: ATAN2(x_num, y_num)/ 함수 내용: 지정된 x, y 좌표의 아크탄젠트 값을 구합니다. ]</div>
				<div id="function">[함수 이름: ATANH(number)/ 함수 내용: 역 하이퍼볼릭 탄젠트 값을 구합니다.]</div>
				
				<div id="function">[함수 이름: AVERAGE(number1, [number2], ...)/ 함수 내용:모든 인수들의 평균을 구합니다. ]</div>
				<div id="function">[함수 이름: BETADIST(x, alpha, beta, [A], [B])/ 함수 내용: 누적 베타 확률 밀도 함수값을 구합니다.]</div>
				<div id="function">[함수 이름: BIN2DEC(number)/ 함수 내용: 2진수를 10진수로 변환합니다.]</div>
				<div id="function">[함수 이름: BIN2HEX(number, [place])/ 함수 내용: 2진수를 16진수로 변환합니다.]</div>
				<div id="function">[함수 이름: BIN2OCT(number, [place])/ 함수 내용: 2진수를 8진수로 변환합니다.]</div>
				
				<div id="function">[함수 이름: BINOMDIST(number_s, trials, probability_s, cummulative)/ 함수 내용: 개별항 이항 분포 확률을 구합니다.]</div>
				<div id="function">[함수 이름: CEILING(number, significance)/ 함수 내용: 수를 significance의 배수가 되도록 절대 값을 올림합니다.]</div>
				<div id="function">[함수 이름: CHAR(number)/ 함수 내용: 코드번호를 문자로 바꾸는 함수입니다. 인수로 128이 넘어가는 숫자를 지정하면, 이 번호에 해당하는 문자 코드가 없기 때문에 아무 내용도 출력하지 않습니다.]</div>
				<div id="function">[함수 이름: CHIDIST(x, deg_freedom)/ 함수 내용: 카이 제곱 분포의 단측 검정 확률값을 구합니다.]</div>
				<div id="function">[함수 이름: CHITEST(actual_range, expected_range)/ 함수 내용: 카이 제곱 분포의 단측 검정 확률값을 구합니다.]</div>
				
				<div id="function">[함수 이름: CHITEST(actual_range, expected_range)/ 함수 내용:독립 검정 결과를 구합니다. 통계적이고 적절한 자유도에 대한 카이 제곱 분포값을 의미합니다. ]</div>
				<div id="function">[함수 이름: CODE(text)/ 함수 내용: 문자를 코드 번호로 바꾸는 함수 입니다. 인수를 문장으로 지정한 경우에는 첫 글자의 코드번호를 구합니다.]</div>
				<div id="function">[함수 이름: COLUMN([reference])/ 함수 내용: 참조하고 있는 열 번호를 반환합니다. 참조가 생략되면 함수를 입력한 셀의 열 번호를 반환합니다.]</div>
				<div id="function">[함수 이름: COLUMNS([reference])/ 함수 내용: 참조하고 있는 열의 수를 반환합니다.]</div>
				<div id="function">[함수 이름: COMBIN(number, number_chosen)/ 함수 내용: 주어진 개체로 만들 수 있는 조합의 수를 구합니다.]</div>
				
				<div id="function">[함수 이름: CONCATENATE(text1, [text2], ...)/ 함수 내용: 여러 셀에 나뉘어 입력된 문자 또는 수식을 결합해 하나의 셀에 입력할 때 사용합니다. CONCATENATE 함수 대신 & 연산자를 사용해도 됩니다. Text 인수는 30개까지 지정할 수 있으며, 텍스트, 숫자, 셀 등을 지정할 수 있습니다.]</div>
				<div id="function">[함수 이름: CONFIDENCE(alpha, standard_dev, size)/ 함수 내용: 모집단 평균의 신뢰 구간을 표시합니다.]</div>
				<div id="function">[함수 이름: CORREL(array1, array2)/ 함수 내용: 두 데이터 집합 사이의 상관계수를 표시합니다.]</div>
				<div id="function">[함수 이름: COS(number)/ 함수 내용: 코사인값을 구합니다.]</div>
				<div id="function">[함수 이름: COSH(number)/ 함수 내용: 하이퍼블릭 코사인값을 구합니다.]</div>
				
				<div id="function">[함수 이름:COUNT(value1, [value2], ...) / 함수 내용: 범위에서 숫자가 포함된 셀의 개수를 구합니다.]</div>
				<div id="function">[함수 이름: COUNTA(value1, [value2], ...)/ 함수 내용: 범위에서 비어 있지 않은 셀의 개수를 구합니다.]</div>
				<div id="function">[함수 이름: COUNTBLANK(range)/ 함수 내용: 범위에서 비어 있는 셀의 개수를 구합니다.]</div>
				<div id="function">[함수 이름: COUNTIF(number)/ 함수 내용: 주어진 찾을 조건과 일치하는 범위의 값이 들어 있는 셀 개수를 구합니다.]</div>
				<div id="function">[함수 이름: COVAR(array1, array2)/ 함수 내용: 각 데이터 쌍의 공분산을 표시합니다.]</div>
				
				<div id="function">[함수 이름: DATE(year, month, day)/ 함수 내용: 년, 월, 일 데이터를 통합해 연월일 데이터로 만듭니다. 또는 각각의 셀에 나뉘어 입력되어있는 날짜 데이터에서 연월일을 통합해 하나의 셀에 입력합니다.]</div>
				<div id="function">[함수 이름: DAY(serial_number)/ 함수 내용:날짜가 입력되어있는 셀에서 날짜(1부터 31까지의 정수)만 추출해 현재 셀에 입력합니다. 인수는 현재 날짜가 입력된 셀을 이용합니다. 날짜가 입력된 셀이 없을 때에는 =DAY(DATE(2011,3,7))식으로 DATE함수와 함께 사용해야 합니다. ]</div>
				<div id="function">[함수 이름: DEC2BIN(number, [place])/ 함수 내용: 10진수를 2진수로 변환합니다.]</div>
				<div id="function">[함수 이름: DEC2HEX(number, [place])/ 함수 내용: 10진수를 16진수로 변환합니다.]</div>
				<div id="function">[함수 이름: DEC2OCT(number, [place])/ 함수 내용: 10진수를 8진수로 변환합니다.]</div>
				
				<div id="function">[함수 이름: DEGREES(angle)/ 함수 내용: 라디안을 각도를 변환합니다.]</div>
				<div id="function">[함수 이름: EVEN(number)/ 함수 내용: 가장 가까운 짝수인 정수로 양수는 올림하고 음수는 내림합니다.]</div>
				<div id="function">[함수 이름: EXP(number)/ 함수 내용: 자연로그 e의 거듭제곱을 구합니다.]</div>
				<div id="function">[함수 이름: EXPONDIST(x, lambda, cummulative)/ 함수 내용: 지수 분포의 확률값을 구합니다.]</div>
				<div id="function">[함수 이름: FACT(number)/ 함수 내용: 계승값을 구합니다.]</div>
				
				<div id="function">[함수 이름: FALSE( )/ 함수 내용: 인수없이 FALSE를 돌려줍니다.]</div>
				<div id="function">[함수 이름: FDIST(x, deg_freedom1, deg_freedom2)/ 함수 내용: 두 데이터 집합에 대해 F 확률 분포값을 구합니다.]</div>
				<div id="function">[함수 이름: FIND(find_text, within_text, [start_num])/ 함수 내용: 지정한 문자열 안에서 원하는 문자의 위치를 찾습니다. FIND함수는 대/소문자를 구분합니다.]</div>
				<div id="function">[함수 이름: FIXED(number, [decimals], [no_commas])/ 함수 내용: 고정 소수점과 '쉼표 스타일'을 지정합니다.]</div>
				<div id="function">[함수 이름: FLOOR(number, significance)/ 함수 내용: 수를 significance의 배수가 되도록 절대 값을 내림합니다.]</div>
				
				<div id="function">[함수 이름: FTEST(array1, array2)/ 함수 내용: F 검정 결과를 표시합니다.]</div>
				<div id="function">[함수 이름: GAMMADIST(x, alpha, beta, cummulative)/ 함수 내용: 감마 분포값을 구합니다.]</div>
				<div id="function">[함수 이름: GAMMALN(x)/ 함수 내용: 감마 함수 G(x)의 자연 로그값을 구합니다.]</div>
				<div id="function">[함수 이름: GCD(number1, [number2], ...)/ 함수 내용: 최대공약수를 구합니다.]</div>
				<div id="function">[함수 이름: GEOMEAN(number1, [number2], ...)/ 함수 내용: 기하 평균을 구합니다.]</div>
				
				<div id="function">[함수 이름: HARMEAN(number1, [number2], ...)/ 함수 내용: 조화 평균을 구합니다.]</div>
				<div id="function">[함수 이름: HEX2BIN(number, [place])/ 함수 내용: 16진수를 2진수로 변환합니다.]</div>
				<div id="function">[함수 이름: HEX2DEC(number)/ 함수 내용: 16진수를 10진수로 변환합니다.]</div>
				<div id="function">[함수 이름: HEX2OCT(number, [place])/ 함수 내용: 16진수를 8진수로 변환합니다.]</div>
				<div id="function">[함수 이름: HLOOKUP(lookup_value, table_array, row_index_number, [range_lookup])/ 함수 내용: 범위의 첫 번째 행을 검색한 후 참조 범위의 같은 열에 있는 셀 값을 반환합니다.]</div>
				
				<div id="function">[함수 이름: HOUR(serial_number)/ 함수 내용: 시간이 입력되어있는 셀에서 시만 추출해서 현재 셀에 입력합니다. 24시간이므로 0부터 23까지의 숫자로 표시합니다. 인수는 현재 시간이 입력된 셀을 이용합니다. 시간이 입력된 셀이 없을 때에는 =HOUR(TIME(12,13,14))식으로 TIME함수와 함께 사용해야 합니다.]</div>
				<div id="function">[함수 이름: HYPGEOMDIST(sample_s, number_sample, population_s, number_pop)/ 함수 내용: 초기하 분포값을 구합니다.]</div>
				<div id="function">[함수 이름: INDEX(reference, row_number, column_number)/ 함수 내용: 범위에서 행과 열 번호 인덱스로 선택한 요소의 값을 반환합니다.]</div>
				<div id="function">[함수 이름: IF(logical_test, [value_if_true], [value_if_false])/ 함수 내용: 데이터를 비교 분석해 참값과 거짓값을 입력합니다. 7번까지 중첩해서 사용할 수 있으므로, 여러가지 조건일 때는 IF함수를 중첩해서 사용합니다.]</div>
				<div id="function">[함수 이름: IFERROR(value, value_if_error)/ 함수 내용: 식이나 식 자체의 값이 오류인 경우 value_if_error를 반환합니다.]</div>
				
				<div id="function">[함수 이름: INT(number)/ 함수 내용: 버림을 하여 가장 가가운 정수로 만듭니다.]</div>
				<div id="function">[함수 이름: INTERCEPT(known_y's, known_x's)/ 함수 내용: 주어진 x, y 값에 의거한 선형 회귀선의 y 절편을 구합니다.]</div>
				<div id="function">[함수 이름: ISBLANK(value)/ 함수 내용: 값이 없으면 TRUE를 표시합니다.]</div>
				<div id="function">[함수 이름: ISERR(value)/ 함수 내용: #N/A를 제외한 오류값이면 TRUE를 표시합니다.]</div>
				<div id="function">[함수 이름: ISERROR(value)/ 함수 내용: 오류값이면 TRUE를 표시합니다.]</div>
				
				<div id="function">[함수 이름: ISNA(value)/ 함수 내용: #N/A 오류값이면 TRUE를 표시합니다.]</div>
				<div id="function">[함수 이름: ISNUMBER(value)/ 함수 내용: 숫자이면 TRUE를 표시합니다.]</div>
				<div id="function">[함수 이름: ISTEXT(value)/ 함수 내용: 문자열이면 TRUE를 표시합니다.]</div>
				<div id="function">[함수 이름: KURT()/ 함수 내용:데이터 집합의 첨도를 구합니다. ]</div>
				<div id="function">[함수 이름: LARGE(array, k)/ 함수 내용: 데이터 집합에서 k번째로 큰값을 구합니다.]</div>
				
				<div id="function">[함수 이름: LCM(number1, [number2], ...)/ 함수 내용: 최소공배수를 구합니다.]</div>
				<div id="function">[함수 이름: LEFT(text, [num_chars])/ 함수 내용: 원본 데이터에서 왼쪽을 기준으로 지정된 수만큼 문자나 숫자를 추출해 문자로 입력합니다. LEFT함수로 추출한 숫자는 문자로 인식된다는 점 주의해주세요.]</div>
				<div id="function">[함수 이름: LEN(text)/ 함수 내용: 문자의 개수를 출력합니다. [Spacebar]를 눌러 입력한 공백도 문자의 개수에 포함됩니다.]</div>
				<div id="function">[함수 이름: LN(number)/ 함수 내용: 자연 로그값을 구합니다.]</div>
				<div id="function">[함수 이름: LOG(number, [base])/ 함수 내용: 지정한 수를 밑으로 하는 로그값을 구합니다.]</div>
				
				<div id="function">[함수 이름: LOG10(number)/ 함수 내용: 10을 밑으로 하는 로그값을 구합니다.]</div>
				<div id="function">[함수 이름: LOOKUP(lookup_value, reference, [result_refefence])/ 함수 내용:행이나 열로 이루어진 참조 범위의 값을 반환합니다. 벡터형과 배열형 두 가지 형식을 지원합니다. ]</div>
				<div id="function">[함수 이름: LOWER(text)/ 함수 내용: 영문 대문자로 입력된 내용을 모두 소문자로 바꾸는 함수입니다.]</div>
				<div id="function">[함수 이름: MATCH(lookup_value, lookup_array, [match_type])/ 함수 내용: 범위에서 지정된 항목을 검색한 다음 해당 항목의 상대 위치를 반환합니다.]</div>
				<div id="function">[함수 이름: MAX(number1, [number2], ...)/ 함수 내용: 인수 목록의 최대값을 표시합니다.]</div>
				
				<div id="function">[함수 이름: MEDIAN(number1, [number2], ...)/ 함수 내용: 주어진 수들의 중앙값을 표시합니다.]</div>
				<div id="function">[함수 이름: MID(text, start_num, num_bytes)/ 함수 내용: LEFT, RIGHT 함수처럼 원본 데이터에서 지정한 수만큼 문자나 숫자를 가져옵니다. 다른 점은 사용자가 정한 시작 위치를 기준으로 문자나 숫자를 가져온다는 점입니다. 즉, 시작위치를 3으로, 가져올 글자를 2로 정하면 세 번째부터 두 글자를 가져옵니다.]</div>
				<div id="function">[함수 이름: MIN(number1, [number2], ...)/ 함수 내용: 인수 목록의 최소값을 표시합니다.]</div>
				<div id="function">[함수 이름: MINUTE(serial_number)/ 함수 내용: 시간이 입력되어있는 셀에서 분만 추출해 현재 셀에 입력합니다. 60분이므로 0부터 59까지 숫자로 표시합니다. 인수는 현재 시간이 입력된 셀을 이용합니다. 시간이 입력된 셀이 없을 때에는 =MINUTE(TIME(17,25,35)) 식으로 TIME 함수와 함께 사용해야 합니다.]</div>
				<div id="function">[함수 이름: MOD(number, divisor)/ 함수 내용: 나눗셈의 나머지를 구합니다.]</div>
				
				<div id="function">[함수 이름: MODE(number1, [number2], ...)/ 함수 내용: 데이터 집합에서 가장 자주 발생하는 값(최빈수)를 구합니다.]</div>
				<div id="function">[함수 이름: MONTH(serial_number)/ 함수 내용: 날짜가 입력되어있는 셀에서 월(1부터 12까지의 정수)만 추출해 현재 셀에 입력합니다. 인수는 날짜 데이터 또는 날짜가 입력된 셀을 이용합니다. 날짜가 입력된 셀이 없을 때에는 =MONTH(DATE(2011,3,7))식으로 DATE함수와 함께 사용해야 합니다.]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				
								<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
								<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				
								<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				
								<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				
								<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				
								<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				
								<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				
								<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				
								<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				
								<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				
								<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				
								<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				
								<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				
								<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				
								<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
				<div id="function">[함수 이름: / 함수 내용: ]</div>
			 <%-- </c:forEach>  --%>
			</div>
		</div>
		<div id='bottom'>
		<div id="btn">
			<button id="confirm">확인</button>
			<button id="cancel" class="cancel">취소</button>
		</div>
		</div>
	</div>
</body>
</html>