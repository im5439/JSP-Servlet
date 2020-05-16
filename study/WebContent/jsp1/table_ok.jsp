<%@ page contentType="text/html; charset=UTF-8"%>
<%

request.setCharacterEncoding("UTF-8");

int su1 = Integer.parseInt(request.getParameter("su1"));
int su2 = Integer.parseInt(request.getParameter("su2"));

int su = 0;

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" cellpadding="0" cellspacing="0" width="600">
<%

	for (int i = 1; i <= su1; i++){
		
		out.print("<tr>");
		
		for (int j = 1; j <= su2; j++){
			su++;
%>
		<td width="50" align ="center"><%=su %></td>
<%
		}
%>
	</tr>
<%		
	}
%>
</table>

</body>
</html>