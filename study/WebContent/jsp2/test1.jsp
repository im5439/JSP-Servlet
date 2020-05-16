<%@ page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- test2에서 test1으로 넘어옴 변수값도 넘어옴 ctrl+c,ctrl+v의 효과라서 많이쓰이지는 않다.(include) -->
<%@ include file="test2.jsp" %>

<%=str %>


</body>
</html>