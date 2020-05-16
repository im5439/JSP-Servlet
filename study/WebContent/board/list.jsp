<%@page import="com.util.DBCPConn"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.util.MyUtil"%>
<%@page import="com.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.board.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 컨텍스트 경로 (ex./study)
	
	MyUtil myUtil = new MyUtil();
	
	//Connection conn = DBConn.getConnection();
	Connection conn = DBCPConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	
	//넘어온 페이지 번호(myUtil,article)
	String pageNum = request.getParameter("pageNum");
	
	int currentPage = 1; // 안넘어오면 1페이지를 불러옴
	
	if(pageNum != null){
		currentPage = Integer.parseInt(pageNum);
	} else{
		pageNum = "1"; 
	}
	
	//검색-----------------------------------------
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");
	
	if(searchValue != null){ // 검색을 했을때
		
		if(request.getMethod().equalsIgnoreCase("GET")){ // 검색창에 한글을 입력했을떄 디코딩 하지않으면 깨져서 넘어감
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
	} else { // 검색을 안했을때
		
		searchKey = "subject";
		searchValue = "";
	
	}
	//검색------------------------------------------
	
	//전체 데이터 구하기
	int dataCount = dao.getDataCount(searchKey, searchValue);
	
	//한 페이지에 표시할 데이터 갯수
	int numPerPage = 3;
	
	//전체 페이지의 갯수
	int totalPage = myUtil.getPageCount(numPerPage, dataCount);
	
	//데이터를 삭제해서 페이지가 줄었을 때 처리
	if(currentPage > totalPage){
		currentPage = totalPage;
	}
	
	//가져올 데이터 시작과 끝 지정
	int start = (currentPage - 1) * numPerPage + 1;
	int end = currentPage * numPerPage;
	
	List<BoardDTO> lists = dao.getLists(start, end, searchKey, searchValue);
	
	String param = "";
	if(!searchValue.equals("")){ // 검색을 했을때
		
		param = "?searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		
	}
	
	//페이징 처리
	String listUrl = "list.jsp" + param;
	String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

	//글 내용보기 주소정리
	String articleUrl = cp + "/board/article.jsp";
	if(param.equals("")) {// 검색 안했을때
		articleUrl += "?pageNum=" + currentPage + "&searchValue" + URLEncoder.encode(searchValue, "UTF-8");
	} else {// 검색 했을때
		articleUrl += param + "&pageNum=" + currentPage;
	}
	
	//DBConn.close();
	DBCPConn.close();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게 시 판</title>

<link rel="stylesheet" href="<%=cp%>/board/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/board/css/list.css" type="text/css">

<script type="text/javascript">
	
	function sendIt(){
	
		var f = document.searchForm;
	
		f.action = "<%=cp%>/board/list.jsp";
		f.submit();
		
	}

</script>

</head>
<body>

<div id="bbsList">
	<div id="bbsList_title">
	게시판(JSP)
	</div>
	<div id="bbsList_header">
		<div id="leftHeader">
		<form action="" method="post" name="searchForm">
			<select name="searchKey" class="selectField">
				<option value="subject">제목</option>
				<option value="name">작성자</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchValue" class="textField"/>
			<input type="button" value=" 검 색 " class="btn2" onclick="sendIt();">
		</form>
		</div>
		<div id="rightHeader">
			<input type="button" value=" 글올리기" class="btn2" onclick="javascript:location.href='<%=cp%>/board/created.jsp';"/>
		</div>
		
	</div>
	
	<div id="bbsList_list">
		<div id="title">
			<dl>
				<dt class="num">번호</dt>
				<dt class="subject">제목</dt>
				<dt class="name">작성자</dt>
				<dt class="created">작성일</dt>
				<dt class="hitCount">조회수</dt>
			</dl>
		</div>
		<div id="lists">
		<%for (BoardDTO dto : lists) { %>
			<dl>
				<dd class="num"><%=dto.getNum() %></dd>
				<dd class="subject">
				<a href="<%=articleUrl %>&num=<%=dto.getNum() %>"><%=dto.getSubject() %></a>
				</dd>
				<dd class="name"><%=dto.getName() %></dd>
				<dd class="created"><%=dto.getCreated() %></dd>
				<dd class="hitCount"><%=dto.getHitCount() %></dd>
			</dl>
		<%} %>
		</div>
		<div id="footer">
			<%=pageIndexList %>
		</div>
	</div>
</div>

</body>
</html>