<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 컨텍스트 경로 (ex./study)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<%=cp %>/member/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/member/css/created.css" type="text/css"/>
<script type="text/javascript" src="<%=cp%>/member/js/util.js"></script>

<script type="text/javascript">

	function sendIt() {
	
		var f = document.myForm;
	
		str = f.userId.value;
		str = str.trim();
	
		if(!str) {
			alert("\n아이디를 입력하세요.");
			f.userId.focus();
			return;
		}
		f.userId.value = str;

		str = f.userPwd.value;
		str = str.trim();
		
		if(!str) {
			alert("\n패스워드를 입력하세요.");
			f.userPwd.focus();
			return;
		}
		f.userPwd.value = str;

		str = f.userName.value;
		str = str.trim();
		
		if(!str) {
			alert("\n이름을 입력하세요.");
			f.userName.focus();
			return;
		}
		f.userName.value = str;

		str = f.userBirth.value;
		str = str.trim();
		
		if(!str) {
			alert("\n생년월일 입력하세요.");
			f.userBirth.focus();
			return;
		}
		f.userBirth.value = str;

		str = f.userTel.value;
		str = str.trim();
		
		if(!str) {
			alert("\n전화번호를 입력하세요.");
			f.userTel.focus();
			return;
		}
		f.userTel.value = str;
	
		f.action = "<%=cp%>/join/created_ok.do";
		f.submit();
	}

</script>


</head>
<body>

<div id="bbs">
	<div id="bbs_title">
		회원가입
	</div>

	<form action="" method="post" name="myForm">
	<div id="bbsCreated">
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>아&nbsp;이&nbsp;디</dt>
				<dd>
					<input type="text" name="userId" size="35" maxlength="20" class="boxTF"/>
				</dd>
			</dl>
		</div>
	
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>패스워드</dt>
				<dd>
					<input type="password" name="userPwd" size="35" maxlength="20" class="boxTF"/>
				</dd>
			</dl>
		</div>
	
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</dt>
				<dd>
					<input type="text" name="userName" size="35" maxlength="50" class="boxTF"/>
				</dd>
			</dl>
		</div>
	
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>생&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</dt>
				<dd>
					<input type="text" name="userBirth" size="35" maxlength="50" class="boxTF"/>[yyyy-mm-dd]]
				</dd>
			</dl>
		</div>
		
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;화</dt>
				<dd>
					<input type="text" name="userTel" size="35" maxlength="50" class="boxTF"/>
				</dd>
			</dl>
		</div>
	
	</div>
	
	<div id="bbsCreated_footer">
		<input type="button" value=" 가입하기 " class="btn2" onclick="sendIt();"/>
		<input type="reset" value=" 다시입력 " class="btn2" onclick="document.myForm.userId.focus();">
		<input type="button" value=" 가입취소 " class="btn2" onclick="javascript:location.href='<%=cp %>'"/>
	</div>
	
	</form>

</div>


</body>
</html>