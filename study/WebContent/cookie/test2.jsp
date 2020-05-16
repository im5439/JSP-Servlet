<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 컨텍스트 경로 (ex./study)
	
	Cookie[] ck = request.getCookies();
	
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	if(ck!=null){
		
		for(Cookie c : ck){
			
			out.print("쿠키이름: ");
			out.print(c.getName());
			out.print(", 쿠키값: ");
			
			String str = c.getValue();
			if(c.getName().equals("addr")){
				str = URLDecoder.decode(str, "UTF-8");
			}
			out.print(str + "<br/>");
			
		}
		
	}


%>

</body>
</html>