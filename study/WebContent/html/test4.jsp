<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JavaScript</title>

<script type="text/javascript">
	var str;

	str = "변수 선언 후 값 대입";

	document.write(str + " : " + typeof (str) + "<br/>");//String

	str = 123;
	document.write(str + " : " + typeof (str) + "<br/>");//Number

	str = true;
	document.write(str + " : " + typeof (str) + "<br/>");//boolean

	document.write("-----------------------------------<br/><br/>");

	var hello = "함수 밖 전역변수(hello)";

	function thisFunction() {

		var hello = "함수 안 지역변수(hello)";
		global = "함수 안 전역변수(global)";
		var local = "함수 안 지역변수(local)";

		document.write(hello + "<br/>");
		document.write(global + "<br/>");
		document.write(local + "<br/>");
		document.write("===============<br/><br/>");
	}
	
	thisFunction();
	
	document.write(hello + "<br/>"); // 함수 밖에서는 함수 밖의 전역변수 hello로 출력이 된다.
	document.write(global + "<br/>");
	//document.write(local + "<br/>"); // local은 함수 안의 지역변수라 출력이 안됨  / 중간에 에러있으면 아래문장 실행 안됨.
	
	document.write("===============<br/><br/>");

	var num1 = 20, num2 = 5;
	
	document.write("num1 + num2 = " + (num1 + num2) + "<br/>");
	document.write("num1 - num2 = " + (num1 - num2) + "<br/>");
	document.write("num1 x num2 = " + (num1 * num2) + "<br/>");
	document.write("num1 / num2 = " + (num1 / num2) + "<br/>");
	document.write("num1 % num2 = " + (num1 % num2) + "<br/>");
	
	document.write("num1 > num2 = " + (num1 > num2) + "<br/>");
	document.write("num1 < num2 = " + (num1 < num2) + "<br/>");

	
	var ans = 0;
	if(ans > 0){
		document.write(ans + "은 양수");
	} else if(ans < 0){
		document.write(ans + "은 음수");
	} else {
		document.write(ans + "은 0");
	}
	
	document.write("<br/><br/>");
	
	for(var i = 1; i <= 10; i++){
		document.write(i + " ");
	}
	
	document.write("<br/><br/>");

	var a = 1;
	while(a <= 10){
		document.write(a + "\t");
		a++;
	}
	
	function test1(){
		
		alert("javascript 함수!");
		
	}
	
	function test2(color){
		
		document.bgColor = color;
		
	}
	
	function idpwCheck(){
		
		var f = document.myForm;
		
		if(!f.id.value){
			alert("아이디를 입력하세요!");
			f.id.focus(); //id에 커서 갖다놓기
			return;
		}
		
		if(!f.pwd.value){
			alert("패스워드를 입력하세요!");
			f.pwd.focus(); //pw에 커서 갖다놓기
			return;
		}
		
		alert("로그인 성공!!");
		
	}
	
	function fdelete(num){
		
		var returnValue;
		returnValue = window.confirm("삭제 하시겠습니까?\n" + "delete custom where num=" + num);
		
		if(returnValue == true){
			alert("delete custom where num=" + num + "실행됨!!");
		}
		
	}


</script>

</head>
<body onload="test1();">

배경색 선택하기<br/>

<input type ="radio" name ="r1" onclick ="test2('white')" checked ="checked"/>white<br/>
<input type ="radio" name ="r1" onclick ="test2('red')"/>red<br/>
<input type ="radio" name ="r1" onclick ="test2('blue')"/>blue<br/>
<input type ="radio" name ="r1" onclick ="test2('yellow')"/>yellow<br/>

<br/><br/><br/><br/><br/>

<form action="" name ="myForm">
<table style ="font-size: 10pt; font-style: 돋움;" cellpadding ="3">
<tr>
	<td><b>아이디</b></td>
	<td><input type ="text" style ="width: 100px; height :22px;" name ="id"></td>
	<td></td>
</tr>

<tr>
	<td><b>비밀번호</b></td>
	<td><input type ="password" style ="width: 100px; height :22px;" name ="pwd"></td>
	<td><a href="javascript:idpwCheck();"><img src ="./img/btn_login.gif"></a></td> <!-- 하이퍼링크를 클릭하면 자바스크립트:함수() 실행 -->
</tr>
<tr>
	<td colspan ="3" align ="center">
	<input type ="checkbox">아이디 저장
	<input type ="checkbox" checked ="checked">보안 접속
	</td>
</tr>

<tr height ="1">
	<td colspan ="3" bgcolor ="#dad6d6"></td>
</tr>

</table>
</form>

<br/><br/><br/>

<table border ="0" cellpadding ="5">
<tr bgColor ="#ccccff">
	<td>1</td><td>배수지</td><td>25</td><td>서울</td><td><a href ="javascript:fdelete(1);">삭제</a></td>
</tr>
<tr bgColor ="#ccccff">
	<td>2</td><td>유인나</td><td>40</td><td>부산</td><td><a href ="javascript:fdelete(2);">삭제</a></td>
</tr>
</table>



</body>
</html>