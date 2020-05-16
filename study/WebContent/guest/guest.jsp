<%@page import="com.util.MyUtil"%>
<%@page import="com.guest.GuestDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.util.DBConn"%>
<%@page import="com.guest.GuestDAO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 컨텍스트 경로 (ex./study)
	
	MyUtil myUtil = new MyUtil();
	
	GuestDAO dao = new GuestDAO(DBConn.getConnection());
	
	int maxNum = dao.getMaxNum();
	
	List<GuestDTO> lists = null;
	
	//넘어온 페이지 번호
	String pageNum = request.getParameter("pageNum");
	
	int currentPage = 1;
	
	if(pageNum != null){
		currentPage = Integer.parseInt(pageNum);
	}
	
	//전체 데이터 구하기
	int dataCount = dao.getDataCount();
	//한 페이지에 표시할 데이터 수
	int numPerPage = 5;
	//전체 페이지의 수
	int totalPage = myUtil.getPageCount(numPerPage, dataCount);
	//데이터를 삭제하거나 페이지가 줄었을떄 처리
	if(currentPage > totalPage)
		currentPage = totalPage;
	//가져올 데이터의 시작과 끝 지정
	int start = (currentPage - 1) * numPerPage + 1;
	int end = currentPage * numPerPage;
	
	lists = dao.getListData(start, end);
	//페이징 처리
	String listUrl = "guest.jsp";
	String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
	
	DBConn.close();
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방 명 록</title>

<link rel="stylesheet" href="<%=cp%>/guest/data/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/board/css/style.css" type="text/css"/>
<script type="text/javascript" src="<%=cp%>/guest/data/guest.js"></script>

<script type="text/javascript">

	function fdelete(num){
		
		var returnValue;
		returnValue = window.confirm("삭제 하시겠습니까?\n");
	
		if(returnValue == true){
			alert("삭제완료!!");
			document.myForm.action = "<%=cp%>/guest/delete.jsp?num=" + num;
			document.myForm.submit();
		}
	
	
		
	}

</script>

</head>
<body>

<br/><br/>

<table width="560" border="2" cellpadding="0" cellspacing="0" bordercolor="#d6d4a6" align="center">
<tr height="40">
	<td style="padding-left: 20px;">
	<b>방 명 록(JSP)</b>
	</td>
</tr>
</table>

<br/>

<form action="" name="myForm" method="post">
<table width="560" border="0" cellspacing="0" cellpadding="3" align="center">

<tr><td colspan="2" height="3" bgcolor="#dbdbdb" align="center"></td></tr>

<tr>
	<td width="20%" height="30" bgcolor="#eeeeee" style="padding-left: 20px;">
	작성자
	</td>
	<td width="80%" style="padding-left: 10px;">
	<input type="text" name="name" size="35" maxlength="20" class="boxTF"/>
	</td>
</tr>

<tr><td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td></tr>

<tr>
	<td width="20%" height="30" bgcolor="#eeeeee" style="padding-left: 20px;">
	E-Mail
	</td>
	<td width="80%" style="padding-left: 10px;">
	<input type="text" name="email" size="35" maxlength="50" class="boxTF"/>
	</td>
</tr>

<tr><td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td></tr>

<tr>
	<td width="20%" height="30" bgcolor="#eeeeee" style="padding-left: 20px;">
	홈페이지
	</td>
	<td width="80%" style="padding-left: 10px;">
	<input type="text" name="homepage" size="35" maxlength="50" class="boxTF" value="http://"/>
	</td>
</tr>

<tr><td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td></tr>

<tr>
	<td width="20%" height="30" bgcolor="#eeeeee" style="padding-left: 20px;">
	내&nbsp;&nbsp;&nbsp;&nbsp;용
	</td>
	<td width="80%" valign="top" style="padding-left: 10px;">
	<textarea rows="7" cols="60" name="content" class="boxTA"></textarea>
	</td>
</tr>

<tr><td colspan="2" height="3" bgcolor="#dbdbdb" align="center"></td></tr>
</table>

<table width="560" border="0" cellpadding="3" cellspacing="0" align="center">
<tr align="center">
	<td height="40">
		<input type="button" value=" 등록하기 " class="btn1" onclick="sendIt();"/>
		<input type="reset" value=" 다시입력 " class="btn1" onclick="document.myForm.name.focus();"/>
	</td>
</tr>
</table>
</form>


<table width="560" border="0" cellspacing="0" cellpadding="3" align="center">
<%if(maxNum == 0) { %>
<tr><td colspan="2" height="3" bgcolor="#dbdbdb" align="center"></td></tr>
<tr><td width="100%" height="50" bgcolor="eeeeee" align="center"><b>등록된 자료가 없습니다.</b></td></tr>
<%} else { %>
	<%for(GuestDTO dto : lists){ %>
		<%
		String email;
		if(dto.getEmail() == null){
			email = "이메일 없음";
		} else {
			email = dto.getEmail();
		}
		%>
	<tr><td colspan="2" height="3" bgcolor="#dbdbdb" align="center"></td></tr>
	<tr height="30" bgcolor="eeeeee">
		<td align="left" style="padding-left: 10px"><b>NO <%=dto.getNum() %>. <%=dto.getName() %>(<%=email %>)</b></td>
		<td align="right" style="padding-right: 10px"><%=dto.getHomepage() %></td>
	</tr>
	<tr height="30" bgcolor="eeeeee">
		<td align="left" style="padding-left: 10px">작성일 : <%=dto.getCreated() %> (<%=dto.getIpAddr() %>)</td>
		<td align="right" style="padding-right: 10px"><input type="button" value=" 삭제 " class="btn2"
			 onclick="fdelete(<%=dto.getNum()%>);"/>
		</td>
	</tr>
	<tr height="40">
		<td style="padding-left: 10px"><%=dto.getContent() %></td>
	</tr>
	<%} %>

<%} %>
<tr><td colspan="2" height="3" bgcolor="#dbdbdb" align="center"></td></tr>

</table>
<br/>
<table width="560" border="0" cellspacing="0" cellpadding="3" align="center">
<tr align="center"><td> <%=pageIndexList %> </td></tr>
</table>


</body>
</html>