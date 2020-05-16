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
</head>
<body>

<form action="" method="post">

수 1 : <input type="text" name="su1"/><br/>
수 2 : <input type="text" name="su2"/><br/>
<input type="submit" value="결과"/><br/><br/>

</form>
<!-- if, fotEach가 많이 쓰임 -->
<c:if test="${!empty param.su1 && !empty param.su2 }">
	<c:set var="result" value="1"/> <!-- 변수만들고 초기화 / set은 초기화 작업 -->
	<c:forEach var="i" begin="1" end="${param.su2 }" step="1">
		<c:set var="result" value="${result * param.su1 }"/>
		${param.su1 }^${i } = ${result }<br/>
	</c:forEach>
</c:if>

<br/><br/>


<c:if test="${!empty param.su1 && !empty param.su2 }">
	
	<c:choose><!-- java의 switch문 -->
		<c:when test="${param.su1%3==0 && param.su1%4==0 }">
			${param.su1 }은 3과 4의 배수<br/>
		</c:when>

		<c:when test="${param.su1%4==0 }">
			${param.su1 }은 4의 배수<br/>
		</c:when>
		
		<c:when test="${param.su1%3==0 }">
			${param.su1 }은 3의 배수<br/>
		</c:when>

		<c:otherwise> <!-- default값 -->
			${param.su1 }은 3과 4의 배수가 아니다<br/>
		</c:otherwise>		
	</c:choose>


</c:if>







</body>
</html>