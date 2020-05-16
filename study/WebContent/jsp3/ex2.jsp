<%@ page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userBirth = request.getParameter("userBirth");  //받은다음

	//session.setAttribute("userName", userName); // session에 올림
	//session.setAttribute("userBirth", userBirth);
	
	// jsp 데이터 넘기는 방법 3가지
	// 1.post/get -> getParameter    2.session    3.hidden

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="ex3.jsp" method="post">

아이디 : <input type="text" name="userId" size="10"/><br/>
패스워드 : <input type="text" name="userPwd" size="10"/><br/>

<input type="hidden" name="userName" value="<%=userName %>"/>  <!-- hidden방식 데이터 값을 보낼떄 쓴다. 브라우저에서 안보임 -->
<input type="hidden" name="userBirth" value="<%=userBirth %>"/>


<input type="submit" value="다음"/>

</form>

</body>
</html>