<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 컨텍스트 경로 (ex./study)

	Cookie c1 = new Cookie("name","inna");
	Cookie c2 = new Cookie("age","40");
	Cookie c3 = new Cookie("addr","seoul");
	Cookie c4 = new Cookie("tel","010-111-2222");

	//쿠키 삭제 타이머
	c1.setMaxAge(0); // 바로 삭제
	c2.setMaxAge(-1); //끝까지 저장됨
	c3.setMaxAge(10); // 20초후 삭제
	
	response.addCookie(c1);
	response.addCookie(c2);
	response.addCookie(c3);
	response.addCookie(c4);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<a href="test4.jsp">확인</a>

</body>
</html>