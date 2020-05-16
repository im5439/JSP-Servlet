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
	
		f.action = "<%=cp%>/join/updated_ok.do";
		f.submit();
	}

</script>


</head>
<body>

<div id="bbs">
	<div id="bbs_title">
		회원정보수정
	</div>

	<form action="" method="post" name="myForm">
	<div id="bbsCreated">
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>아&nbsp;이&nbsp;디</dt>
				<dd>
					${dto.userId }
				</dd>
			</dl>
		</div>
	
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</dt>
				<dd>
					${dto.userName }
				</dd>
			</dl>
		</div>

		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>패스워드</dt>
				<dd>
					<input type="password" name="userPwd" size="35" maxlength="20" class="boxTF" value="${dto.userPwd }"/>
				</dd>
			</dl>
		</div>
	
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>생&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</dt>
				<dd>
					<input type="text" name="userBirth" size="35" maxlength="50" class="boxTF" value="${dto.userBirth }"/>[yyyy-mm-dd]
				</dd>
			</dl>
		</div>
		
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;화</dt>
				<dd>
					<input type="text" name="userTel" size="35" maxlength="50" class="boxTF" value="${dto.userTel }"/>
				</dd>
			</dl>
		</div>
	
	</div>
	
	<div id="bbsCreated_footer">
		
		<input type="hidden" name="userId" size="35" maxlength="50" class="boxTF" value="${dto.userId }"/>
		<input type="hidden" name="userName" size="35" maxlength="50" class="boxTF" value="${dto.userName }"/>
	
		<input type="button" value=" 수정하기 " class="btn2" onclick="sendIt();"/>
		<input type="button" value=" 수정취소 " class="btn2" onclick="javascript:location.href='<%=cp %>'"/>
	</div>
	
	</form>

</div>


</body>
</html>