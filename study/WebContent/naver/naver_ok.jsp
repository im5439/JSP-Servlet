<%@page import="com.naver.NaverDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="dto" class="com.naver.NaverDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>

<%

	Connection conn = DBConn.getConnection();
	
	NaverDAO dao = new NaverDAO(conn);
	
	int result = dao.insertData(dto);
	
	DBConn.close();
	
	
	if(result != 0){
		response.sendRedirect("naver_list.jsp");
	}
	
%>

회원가입 실패!!
