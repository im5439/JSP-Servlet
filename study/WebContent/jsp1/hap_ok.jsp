<%@ page contentType="text/html; charset=UTF-8"%>

<%

/*
MIME [Multipurpose Internet Mail Extensions]의 종류
메세지의 내용이 어떤 형식인지 알려주기위해 정의한 인터넷 표준

text/plain : 일반 텍스트문서
text/html : HTML 문서 
text/css  :CSS 문서
text/xml : XML 문서
image/jpeg,image/png : JPEG파일, PNG파일 
video/mpeg,audio/mp3 : MPEG 비디오파일, MP3 음악파일
application/zip : zip 압축파일
*/

	request.setCharacterEncoding("UTF-8"); //post에서 한글깨짐 방지 /Window -Preference - Web - JspFile - Template에서 미리 써놓으면 새파일 생성시 편함
	/*
	String s1 = request.getParameter("su1"); // hap의 form의 값들을 request에 담아서 불러옴
	String s2 = request.getParameter("su2"); 

	int su1 = Integer.parseInt(s1);
	int su2 = Integer.parseInt(s2);
	*/
	
	int su1 = Integer.parseInt(request.getParameter("su1"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
	String name = request.getParameter("name");
	
	
	int sum;
	sum = su1 + su2;


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

결과 : <%=su1 %> + <%=su2 %> = <%=sum %><br/>
이름 : <%=name %><br/>
<!-- 1byte가 아닌 언어는 깨짐(ex.한글) form의 method = post방식은 action에 쓰여진 파일의 주소만 보여준다. 
get방식은 파일의 이름뒤에 변수들을 다가져옴 
form method="get"방식은 되는데 이유가 server.xml파일에 URIEncoding="UTF-8"을 추가해줘서 한글이 되는 것이다.
post방식에서도 한글깨짐을 방지하는 코딩이있다. 위에 -->
</body>
</html>