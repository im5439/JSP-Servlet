<%@ page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");

	session.removeAttribute("userId");//suzi가 삭제
	session.invalidate(); // userId 변수가 삭제
	
	response.sendRedirect("login.jsp");
	
%>
