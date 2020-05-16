<%@page import="com.naver.NaverDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 컨텍스트 경로 (ex./study)
%>

<%
	String userid = request.getParameter("userid") ;

	Connection conn = DBConn.getConnection();
	NaverDAO dao = new NaverDAO(conn);
	
	int result = dao.deleteData(userid);

	if (result != 0)
		response.sendRedirect("naver_list.jsp");
	
%>
 삭제 실패!!