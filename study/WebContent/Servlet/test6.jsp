<%@page import="java.util.ArrayList"%>
<%@page import="com.svt.MyDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 컨텍스트 경로 (ex./study)
	
	List<MyDTO> lists = new ArrayList<MyDTO>();
	
	MyDTO dto;
	
	dto = new MyDTO("배수지",25);
	lists.add(dto);

	dto = new MyDTO("유인나",40);
	lists.add(dto);
	
	dto = new MyDTO("안젤리나",23);
	lists.add(dto);
	
	dto = new MyDTO("정인선",28);
	lists.add(dto);
	
	request.setAttribute("lists", lists);
	
%>

<jsp:forward page="tt.jsp"/>

