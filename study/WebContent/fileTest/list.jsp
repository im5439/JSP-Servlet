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
<title>파일 리스트</title>
</head>
<body style="font-size: 10pt;">

<br/><br/>

<table border="1" width="400" align="center" cellpadding="0" cellspacing="0">
<tr>
	<td align="right" colspan="4">
		<input type="button" value=" 글쓰기 " onclick="javascript:location.href='<%=cp%>/file/write.do';">
	</td>
</tr>

<tr>
	<td align="center" width="50">번호</td>
	<td align="center" width="150">제목</td>
	<td align="center" width="250">파일명</td>
	<td align="center" width="50">삭제</td>
</tr>

<c:forEach var="dto" items="${lists }">

<tr>
	<td align="center" width="50">${dto.num }</td>
	<td align="center" width="150">${dto.subject }</td>
	<td align="center" width="250">${dto.originalFileName }</td>
	<td align="center" width="50">삭제</td>
</tr>

</c:forEach>

</table>

<table align="center">
<tr>
	<td>${pageIndexList }</td>
</tr>
</table>

</body>
</html>