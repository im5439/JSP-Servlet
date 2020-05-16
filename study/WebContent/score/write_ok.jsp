<%@page import="com.score.ScoreDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="dto" class="com.score.ScoreDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>

<%

	Connection conn = DBConn.getConnection();

	ScoreDAO dao = new ScoreDAO(conn);
	
	int result = dao.insertData(dto);
	
	DBConn.close();
	
	if(result != 0){
		response.sendRedirect("list.jsp"); // 클라이언트에게 list.jsp를 다시한번 호출해라
	}

%>

입력 오류!!

