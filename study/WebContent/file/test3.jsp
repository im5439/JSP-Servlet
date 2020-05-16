<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 컨텍스트 경로 (ex./study)
	
	//String root1 = request.getRealPath("/");
	String root = pageContext.getServletContext().getRealPath("/"); //pageContext생략해도 됨.
	
	String path = root + File.separator + "pds" + File.separator + "saveData";
	
	//File f = new File(path);
	//if(!f.exists()){
	//	f.mkdirs();
	//}
	
	//파일 업로드 -> 파일정보 추출 -> db에 insert -> list select해서 데이터를 가져옴

	String encType = "UTF-8";
	int maxFileSize = 10*1024*1024; //10M
	
	try{
		// 파일 업로드
		MultipartRequest mr = new MultipartRequest(request,path,maxFileSize,encType,new DefaultFileRenamePolicy());
		
		// 업로드된 파일 정보추출
		out.print("제목: " + mr.getParameter("subject") + "<br/>");
		out.print("서버에 저장된 파일이름: " + mr.getFilesystemName("upload") + "<br/>");
		out.print("업로드된 파일명: " + mr.getOriginalFileName("upload") + "<br/>");
		out.print("파일 타입:" + mr.getContentType("upload") + "<br/>");
		
		File file = mr.getFile("upload");
		if(file != null)
			out.print("파일길이: " + file.length() + "<br/>");
		
	}catch(Exception e){
		
	}
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%=path %>

</body>
</html>