<%@ page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String memo = request.getParameter("memo");
	String[] type = request.getParameterValues("type");
	String major = request.getParameter("major");
	String[] hobby = request.getParameterValues("hobby");
	
	memo = memo.replaceAll("\n", "<br/>");
	
	String str = ""; // 여러개의 데이터를 받을때는 배열처리
	if(type!=null){
		for(String temp : type)
			str += temp + " ";
	}
	
	String str1 = ""; // 여러개의 데이터를 받을때는 배열처리
	if(hobby!=null){
		for(String temp : hobby)
			str1 += temp + " ";
	}
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

이름: <%=name %><br/>
메모: <%=memo %><br/>
전공: <%=major %><br/>
이상형: <%=str %><br/>
취미: <%=str1 %><br/>

</body>
</html>