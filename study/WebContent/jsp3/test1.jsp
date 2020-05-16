<%@ page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");

	//영역(Scope) : 데이터가 유지되는 영역
	//page, request, session, application
	
	int n = 0;
	String count = (String) application.getAttribute("count");
	
	if(count != null){
		n = Integer.parseInt(count);
	}
	
	n++;
	application.setAttribute("count", Integer.toString(n));
	
	
	//실제 접속자의 주소
	String realPath = application.getRealPath("/");
	application.log("접속자: " + request.getRemoteAddr());//ip
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

총 접속자:<%=n %><br/>
웹서버의 실제 경로:<%=realPath %><br/>


</body>
</html>