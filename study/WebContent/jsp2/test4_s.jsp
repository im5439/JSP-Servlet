<%@ page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name"); // getParameter는 1:1방식이라 두번이상 값을 넘겨 받을수 없다.
												// test4 -> test4_ok -> test4_s
	String msg = (String) request.getAttribute("msg");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

리다이렉트 또는 포워드 한 페이지<br/>
<h3>test4_s 파일</h3>

이름:<%=name %> <%=msg %>

</body>
</html>