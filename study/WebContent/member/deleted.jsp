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

<link rel="stylesheet" href="<%=cp %>/member/css/style.css" type="text/css">

<script type="text/javascript">
	function check(){
		
		var f = document.myForm;
		
		if(!f.userPwd.value){
			alert("비밀번호를 입력하세요!");
			f.userPwd.focus;
			return
		}
		
		f.action = "<%=cp%>/join/deleted_ok.do";
		f.submit();
		
	}
</script>

</head>
<body>
<br/><br/>

<form action="" method="post" name="myForm">

<table align="center" cellpadding="0" cellspacing="0" width="270">
<tr height="2">
	<td colspan="2" bgcolor="#cccccc"></td>
</tr>

<tr height="30">
	<td colspan="2" align="center"><b>회원 탈퇴</b></td>
</tr>

<tr height="2">
	<td colspan="2" bgcolor="#cccccc"></td>
</tr>

<tr height="25">
	<td width="80" bgcolor="#e6e4e6" align="center"><b>비밀번호</b></td>
	<td width="120" style="padding-left: 5px;">
		<input type="password" name="userPwd" maxlength="10" size="15"/>
	</td>
</tr>

<tr height="2">
	<td colspan="2" bgcolor="#cccccc"></td>
</tr>

<tr height="30">
	<td colspan="2" align="center">
		<input type="button" value=" 확인 " class="btn2" onclick="check();"/>
		<input type="button" value=" 취소 " class="btn2" onclick="javascript:location.href='<%=cp%>';"/>
	</td>
</tr>
</table>

<table align="center">
<tr height="30">
	<td colspan="2" align="center">
	<font color="red"><b>${message3 }</b></font>
	</td>
</tr>	
</table>

</form>

</body>
</html>