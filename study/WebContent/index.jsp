<%@page import="com.member.CustomInfo"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 컨텍스트 경로 (ex./study)
	
	//CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 수업</title>

<link rel="stylesheet" href="<%=cp%>/bbs/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/bbs/css/list.css" type="text/css">

<script type="text/javascript">

	function logout(){
		
		var returnValue = window.confirm("정말로 로그아웃 하시겠습니까?");

		if(returnValue == true){
			alert("로그아웃 완료!");
			document.myForm.action="<%=cp %>/join/logout_ok.do"
			document.myForm.submit();
		}

	}

</script>

</head>
<body id="footer">
<br/><br/>

<h3>JSP 수업</h3>

<br/><br/>
<c:choose>
	<c:when test="${empty sessionScope.customInfo.userId }">
		<b>로그인하면 새로운 세상이 보인다.</b><br/><br/><br/>
	</c:when>
	<c:otherwise>
		<font color="blue"><b>${sessionScope.customInfo.userName }</b></font> 님 ㅎㅇ <br/><br/>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${empty sessionScope.customInfo.userId }">
		1. 성적처리(JSP)<br/>
		<br/>
		2. 네이버<br/>
		<br/>
		3. 게시판(JSP)<br/>
		<br/>
		4. 방명록(JSP)<br/>
		<br/>
		5. 성적처리(Servlet)<br/>
		<br/>
		6. 파일업로드다운로드(Servlet)<br/>
		<br/>
	</c:when>
	<c:otherwise>
		1. <a href="<%=cp%>/score/list.jsp">성적처리(JSP)</a><br/>
		<br/>
		2. <a href="<%=cp%>/naver/naver_list.jsp">네이버</a><br/>
		<br/>
		3. <a href="<%=cp%>/board/list.jsp">게시판(JSP)</a><br/>
		<br/>
		4. <a href="<%=cp%>/guest/guest.jsp">방명록(JSP)</a><br/>
		<br/>
		5. <a href="<%=cp%>/jumsu/list.do">성적처리(Servlet)</a><br/>
		<br/>
		6. <a href="<%=cp%>/file/list.do">파일업로드다운로드(Servlet)</a><br/>
		<br/>
	</c:otherwise>
</c:choose>

		7. <a href="<%=cp%>/sboard/list.do">게시판(Servlet)</a><br/>
		<br/>
		<br/><br/><br/>


<form action="" method="post" name="myForm">

<c:choose>
	<c:when test="${empty sessionScope.customInfo.userId }">
		<a href="<%=cp %>/join/created.do">회원가입</a><br/>	
		<a href="<%=cp %>/join/login.do">로그인</a><br/>	
	</c:when>
	<c:otherwise>
		<a href="<%=cp %>/join/updated.do">회원정보수정</a><br/>	
		<a href="javascript:logout();">로그아웃</a><br/>
		<a href="<%=cp %>/join/deleted.do">회원탈퇴</a><br/>
	</c:otherwise>
</c:choose>

</form>

</body>
</html>