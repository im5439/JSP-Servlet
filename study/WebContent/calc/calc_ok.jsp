<%@page import="com.calc.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");

	//int su1 = Integer.parseInt(request.getParameter("su1"));
	//int su2 = Integer.parseInt(request.getParameter("su2"));
	//String oper = request.getParameter("oper");
	
	/*
	Calc ob = new Calc();
	
	ob.setSu1(su1);
	ob.setSu2(su2);
	ob.setOper(oper);
	
	String str = ob.result();
	*/
	
	/*
	String str = null;
	int sum = 0;
	
	if(oper != null){
		
		if(oper.equals("+"))
			sum = su1 + su2;
		else if(oper.equals("-"))
			sum = su1 - su2;
		else if(oper.equals("*"))
			sum = su1 * su2;
		else if(oper.equals("/"))
			sum = su1 / su2;
		
		str = String.format("%d %s %d = %d", su1, oper, su2, sum);
		
	}
	*/

%>

<!-- Calc ob = new Calc();
	
	ob.setSu1(su1);
	ob.setSu2(su2);
	ob.setOper(oper);
	
	String str = ob.result(); 이 코딩 대신 아래 코딩을 쓸 수 있음 -->
<jsp:useBean id="ob" class="com.calc.Calc" scope="page"/> <!-- Bean이 나오면 객체가 생성한다. -->
<jsp:setProperty property="*" name="ob"/> <!-- action 태그 -->
<!--<jsp:setProperty property="su2" name="ob"/>  java파일과 jsp파일 변수의 이름이 똑같으면 value값을 안넣어도 들어감
<jsp:setProperty property="oper" name="ob"/>-->


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%=ob.result()%>


</body>
</html>