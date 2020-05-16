<%@ page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");

	String sid = session.getId();
	int sTime = session.getMaxInactiveInterval();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h4>일정관리 화면</h4>

세션아이디: <%=sid %><br/>
세션 유지시간: <%=sTime %>초<br/>

</body>
</html>