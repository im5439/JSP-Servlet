<%@page import="com.util.DBConn"%>
<%@page import="com.guest.GuestDAO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 컨텍스트 경로 (ex./study)
%>

<jsp:useBean id="dto" class="com.guest.GuestDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>

<%

	GuestDAO dao = new GuestDAO(DBConn.getConnection());

	int maxNum = dao.getMaxNum();
	
	dto.setNum(maxNum + 1);
	dto.setIpAddr(request.getRemoteAddr());
	dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));
	
	int result = dao.insertData(dto);
	
	
	DBConn.close();
	
	response.sendRedirect(cp + "/guest/guest.jsp");

%>