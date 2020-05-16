<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
//Session : 여러 jsp 페이지에서 공유하는 영역
//Redirect

	String userId = (String) session.getAttribute("userId");

	//session.setMaxInactiveInterval(5);//session의 유지시간 설정(초단위) (자동로그아웃기능에 많이씀), 기본:1800초(30분)
	
	Calendar cal = Calendar.getInstance();
	
	// 오늘 날짜 구하기
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	// 클라이언트에서 넘어온 년,월 받기
	String strYear = request.getParameter("year");	
	String strMonth = request.getParameter("month");
	
	int year = nowYear;
	int month = nowMonth;
	
	if (strYear != null) {
		year = Integer.parseInt(strYear);
	}
	if (strMonth != null) {
		month = Integer.parseInt(strMonth);
	}
	
	// ◀btn
	int preYear = year;
	int preMonth = month - 1;
	if (preMonth < 1) {
		preYear = year - 1;
		preMonth = 12;
	}
	
	// ▶btn
	int nextYear = year;
	int nextMonth = month + 1;
	if (nextMonth > 12) {
		nextYear = year + 1;
		nextMonth = 1;
	}
	
	// 표시할 달력 세팅
	cal.set(year, month-1,1);
	
	int startDay = 1;
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	int week = cal.get(Calendar.DAY_OF_WEEK);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function sendIt() {
		
		var f = document.myForm;
		
		if(!f.userId.value){
			alert("아이디 입력!!");
			f.userId.focus();
			return;
		}
		
		if(!f.userPwd.value){
			alert("패스워드 입력!!");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
		
	}

</script>

<style type="text/css">

body {
	font-size: 12pt;
}

td {
	font-size: 12pt;
}

</style>

</head>
<body style="font-size: 10pt">

<table border="1" width="600" align="center" style="font: 10">
<tr height="20">
	<td colspan="2" align="right">
	|게시판|
	<%if(userId==null){ %>
	일정관리
	<%} else {%>
	<a href="schedule.jsp">일정관리</a>|
	<%} %>
	</td>
</tr>

<tr height="400">
	<td width="100" valign="top">
	<%if(userId == null){ %>
	<form action="login_ok.jsp" method="post" name="myForm">
		아이디:<input type="text" name="userId" size="10"/><br/>
		패스워드:<input type="password" name="userPwd" size="10"/><br/>
		<input type="button" value="로그인" onclick="sendIt();"/>
	</form>
	<%} else { %>
		<font color="blue"><b><%=userId %></b></font>님 방가방가<br/>
		<a href="logout.jsp">로그아웃</a><br/>
	<%} %>
	</td>
	
	<td valign="middle" align="center">
	<%if(userId == null){ %>
	<b>로그인 하면 새로운 세상이 보입니다</b>
	<%}else{ %>
	<font color="red"><b>로그인 성공!! 새로운 세상!!</b></font>
	<table align="center" width="210" cellpadding="2" cellspacing="1">
<tr>
	<td align="center">
		<a href="login.jsp?year=<%=nowYear %>&month=<%=nowMonth %>"><img alt="" src="./img/today.jpg" align="left"></a>
		<a href="login.jsp?year=<%=preYear %>&month=<%=preMonth %>">◀</a>
		<b>&nbsp;<%=year %>년&nbsp;&nbsp;<%=month %>월</b>
		<a href="login.jsp?year=<%=nextYear %>&month=<%=nextMonth %>">▶</a>
	</td>
</tr>
</table>

<table align="center" width="210" cellpadding="1" bgcolor="#cccccc">
<tr>
	<td bgcolor="#e6e4e6" align="center"><font color="red">일</font></td>
	<td bgcolor="#e6e4e6" align="center">월</td>
	<td bgcolor="#e6e4e6" align="center">화</td>
	<td bgcolor="#e6e4e6" align="center">수</td>
	<td bgcolor="#e6e4e6" align="center">목</td>
	<td bgcolor="#e6e4e6" align="center">금</td>
	<td bgcolor="#e6e4e6" align="center"><font color="blue">토</font></td>
</tr>

<%

	int newLine = 0;

	out.print("<tr height='20'>");
	
	for (int i = 1; i < week; i++) {
		out.print("<td bgcolor='#ffffff'>&nbsp;</td>");
		newLine++;
	}

	for (int i = startDay; i <= endDay; i++ ) {
		String fontColor = (newLine == 0)?"red":(newLine == 6)?"blue":"black";
		String bgColor = (nowYear == year)&&(nowMonth == month)&&(nowDay == i)?"#e6e5e6":"#ffffff";
		
		out.print("<td align='center' bgcolor='"+ bgColor + "'><font color='" + fontColor + "'>" + i + "</font></td>");
		// <td align='center' bgcolor='#ffffff'><font color='black'>29</font></td> 오늘날짜
		
		newLine++;
		
		if (newLine == 7 && i != endDay){
			out.print("</tr><tr height='20'>");
			newLine = 0;
		}
		
	}
	
	while(newLine > 0 && newLine < 7){
		out.print("<td bgcolor='#ffffff'>&nbsp;</td>");
		newLine++;
	}
	
	out.print("</tr>");

%>


</table>
	<%} %>
	</td>
</tr>
</table>

</body>
</html>