<%@page import="com.guest.GuestDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 컨텍스트 경로 (ex./study)

	int num = Integer.parseInt(request.getParameter("num"));
	
	GuestDAO dao = new GuestDAO(DBConn.getConnection());
	
	dao.deleteData(num);
	
	DBConn.close();
	
	response.sendRedirect("guest.jsp");
	
	
%>

