<%@ page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	if(userId.equals("im5439") && userPwd.equals("1234")){
		
		session.setAttribute("userId", userId);
		response.sendRedirect("login.jsp");
		
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

아이디 또는 패스워드 오류<br/>
<a href="login.jsp">돌아가기</a>

</body>
</html>