<%@ page contentType="text/html; charset=UTF-8"%>
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

수1:<input type="text" name="su1"/><br/>
수2:<input type="text" name="su2"/><br/>
<input type="submit" value="결과"/><br/>

</form>

<br/><br/>

su1:<%=request.getParameter("su1") %><br/>
su2:<%=request.getParameter("su2") %><br/>

<%
	

	int sum = 0;

	if(request.getParameter("su1") != null && request.getParameter("su2") != null)  // null일떄 에러떠서 if문씀
		sum = Integer.parseInt(request.getParameter("su1")) + Integer.parseInt(request.getParameter("su2"));

%>

합 : <%=sum %><br/>

<br/><br/>

합 : ${param.su1 + param.su2}<br/> <!-- ${} EL로 쓰면 jsp와 구분할 필요도없고 if문 안써줘도 에러안뜸 -->

${param.su1 }은 ${param.su1%2==0?"짝수":"홀수" }<br/>

</body>
</html>