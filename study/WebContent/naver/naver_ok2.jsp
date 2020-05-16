<%@ page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int date = Integer.parseInt(request.getParameter("date"));
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String nationNo = request.getParameter("nationNo");
	String tel = request.getParameter("tel");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

body {
	background-color: #F5F5F5;
}
</style>
</head>
<body>

<br/><br/><br/>
NAVER 회원가입 완료!
<br/><br/><br/><br/><br/><br/>

&nbsp; 아이디 : &nbsp;<%=id %><br/><br/>
&nbsp; 비밀번호 : &nbsp;<%=pwd %><br/><br/>
&nbsp; 이름 : &nbsp;<%=name %><br/><br/>
&nbsp; 생년월일 : &nbsp;<%=year %> . <%=month %> . <%=date %><br/><br/>
&nbsp; 성별 : &nbsp;<%=gender %><br/><br/>
&nbsp; 이메일 : &nbsp;<%=email %> <br/><br/>
&nbsp; 휴대전화 : &nbsp;<%=nationNo %>&nbsp;-&nbsp;<%=tel %><br/><br/>



</body>
</html>