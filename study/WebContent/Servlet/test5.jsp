<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 컨텍스트 경로 (ex./study)

	/*
	
	JSTL(JSP Standard Tag Library)
	
	Jsp에는 XML처럼 사용자가 태그를 정의해서 사용하는것이 가능한데
	이런 사용자 정의 태그를 커스텀태그라고 하고 이들중에 자주 사용하는 
	태그를 표준으로 만들어 놓은 것
	
	JSTL의 처리영역은 크게 4가지 : core, format, xml, sql
	
	*/

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="" method="post">

수 : <input type="text" name="su"/><br/>
<input type="submit" value="결과"/><br/>

</form>

<br/><br/>

<c:if test="${!empty param.su }">
	<c:if test="${param.su%2==0 }">
		${param.su } : 짝수<br/>
	</c:if>
	<c:if test="${param.su%2==1 }">
		${param.su } : 홀수<br/>
	</c:if>
</c:if>

<br/><br/>

<table border="1" cellpadding="0" cellspacing="0" align="center">
<c:forEach var = "i" begin="1" end="9" step="1">
<tr>
	<c:forEach var="j" begin="1" end="9" step="1">
		<td width="50">${i*j }</td>
	</c:forEach>
</c:forEach>
</table>

</body>
</html>