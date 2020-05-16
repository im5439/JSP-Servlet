<%@ page contentType="text/html; charset=UTF-8"%>

<%
	int a = 10, b = 5, c;
	c = a + b;

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- html영역에서 출력하는법 -->
합 : <%=a%> + <%=b%> = <%=c%><br/> <!-- % =c% - X 앞은 띄어쓰기 하면 안됨 -->

<%
//내장객체(servlet)
//jsp영역에서 출력하는법
out.print("합 : " + a + " + " + b + " = " + c + "<br/>");

String str = String.format("합 : %d + %d = %d<br/>", a,b,c ); // web에서 줄바꿈은 무조건 br

out.println(str);

%>

</body>
</html>