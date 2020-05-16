<%@page import="com.naver.NaverDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 컨텍스트 경로 (ex./study)
%>

<jsp:useBean id="dto" class="com.naver.NaverDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>

<%

	Connection conn = DBConn.getConnection();
	NaverDAO dao = new NaverDAO(conn);
	
	int result = dao.updateData(dto);
	
	if(result != 0)
		response.sendRedirect("naver_list.jsp");
	
%>
 수정 실패!!