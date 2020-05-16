<%@page import="com.score.ScoreDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dto" class="com.score.ScoreDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>

<%
	
	String hak = dto.getHak();

	Connection conn = DBConn.getConnection();

	ScoreDAO dao = new ScoreDAO(conn);
	
	int result = dao.deleteData(hak);
	
	DBConn.close();
	
	if(result != 0){
		response.sendRedirect("list.jsp");
	}
%>

삭제 오류!!