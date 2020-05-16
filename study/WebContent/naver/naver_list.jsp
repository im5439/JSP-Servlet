<%@page import="java.util.ArrayList"%>
<%@page import="com.naver.NaverDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.naver.NaverDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 컨텍스트 경로 (ex./study)
	
	Connection conn = DBConn.getConnection();
	
	NaverDAO dao = new NaverDAO(conn);
	
	List<NaverDTO> lists = dao.getList();
	
	DBConn.close();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 리스트</title>

<style type="text/css">
body {
	background-color: #F5F5F5;
}

table {
	margin-left: auto;
	margin-right: auto;
}
</style>

</head>
<body>
<table width="700" cellpadding="0" cellspacing="3" align="center" bgcolor="#e4e4e4">
<tr height="50">
	<td bgcolor="#ffffff" style="padding-left: 10px;">
	<b>네이버 회원리스트 화면</b>
	</td>
</tr>
</table>

<br/>

<table width="650" cellpadding="0" cellspacing="3" align="center">
<tr height="35">
	<td align="right">
		<input type="button" class="btn" value="회원가입" onclick="javascript:location.href='<%=cp%>/naver/naver.jsp';"/> <!-- location만 써도 잘된다. -->
	</td>
</tr>
</table>

<table width="800" cellpadding="0" cellspacing="1" align="center" bgcolor="#cccccc">
<tr height="30">
	<td align="center" bgcolor="#e6e6e6" width="80">아이디</td>
	<td align="center" bgcolor="#e6e6e6" width="150">비밀번호</td>
	<td align="center" bgcolor="#e6e6e6" width="60">이름</td>
	<td align="center" bgcolor="#e6e6e6" width="150">생년월일</td>
	<td align="center" bgcolor="#e6e6e6" width="60">성별</td>
	<td align="center" bgcolor="#e6e6e6" width="250">이메일</td>
	<td align="center" bgcolor="#e6e6e6" width="200">휴대전화</td>
	<td align="center" bgcolor="#e6e6e6" width="200">가입일자</td>
	<td align="center" bgcolor="#e6e6e6" width="200">수정</td>
</tr>

<%for(NaverDTO dto : lists){%>
<tr height="30">
	<td align="center" bgcolor="#ffffff"><%=dto.getUserid() %></td>
	<td align="center" bgcolor="#ffffff"><%=dto.getPwd() %></td>
	<td align="center" bgcolor="#ffffff"><%=dto.getName() %></td>
	<td align="center" bgcolor="#ffffff"><%=dto.toString() %></td>
	<td align="center" bgcolor="#ffffff"><%=dto.getGender() %></td>
	<td align="center" bgcolor="#ffffff"><%=dto.getEmail() %></td>
	<td align="center" bgcolor="#ffffff"><%=dto.getTel() %></td>
	<td align="center" bgcolor="#ffffff"><%=dto.getDay() %></td>
	<td align="center" bgcolor="#ffffff">
	<a href="naver_update.jsp?userid=<%=dto.getUserid()%>">수정</a>
	<a href="naver_delete.jsp?userid=<%=dto.getUserid()%>">삭제</a></td>
</tr>
<%} %>
</table>
</body>
</html>