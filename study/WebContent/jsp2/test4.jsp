<%@ page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
//리다이렉트 : 서버가 클라이언트에게 명령을 줌 
//db에 i,u,d,session 데이터가 바뀌면 리다이렉트 그 외에는 포워드
//포워드는 servlet할때 배움

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="" method="post">

이름: <input type="text" name="name"/><br/>
<input type="submit" value="리다이렉트" onclick="this.form.action='test4_ok.jsp'"/>
<input type="submit" value="포워드" onclick="this.form.action='test4_for.jsp'"/>


</form>

</body>
</html>