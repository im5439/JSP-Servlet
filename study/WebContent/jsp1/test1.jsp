<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function sendIt(){
		
		var f = document.myForm;
		
		if(!f.userId.value){
			alert("아이디 입력!!")
			f.userId.focus();
			return;
		}
		
		if(!f.userPwd.value){
			alert("패스워드 입력!!")
			f.userPwd.focus();
			return;
		}

		if(!f.tel1.value){
			alert("전화번호 선택!!");
			f.tel1.focus();
			return;
		}
		
		alert("회원가입 성공!!")

		f.action="test1_ok.jsp";
		f.submit();
		
		
	}
	
	function onlyNum(){
		
		if(event.keyCode < 48 || event.keyCode > 57){
			event.returnValue=false;
		}
		
	}

	function hangul(){
		
		if(event.keyCode < 12592 || event.keyCode > 12687){
			event.returnValue=false;
		}
		
	}

	
</script>

</head>
<body>

<form action="" name="myForm" method="post">

아이디: <input type="text" name="userId"/><br/>
패스워드: <input type="password" name="userPwd"/><br/>
이름: <input type="text" name="userName"  onkeypress="hangul()"/><br/>
성별: <input type="radio" name="gender" checked="checked" value="M"/>남자
<input type="radio" name="gender" checked="checked" value="F"/>여자<br/>
전화: 
<select name="tel1">
	<option value="">선택</option>
	<option value="010" selected = "selected">010</option>
	<option value="011">011</option>
	<option value="012">012</option>
	<option value="013">013</option>
</select>
<input type ="text" name="tel2" onkeypress="onlyNum()"/>
-
<input type="text" name="tel3" onkeypress="onlyNum()"/><br/>
동의합니까? <input type="checkbox" name="chk" value="y"/><br/>
메모:<br/>
<textarea rows="5" cols="20" name="memo"></textarea><br/>

<input type="button" value="회원가입" onclick="sendIt();"/>
<input type="reset" value="다시입력" onclick="document.myForm.userId.focus();"/>
<input type="button" value="취소"/>
</form>

</body>
</html>