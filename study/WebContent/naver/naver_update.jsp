<%@page import="com.naver.NaverDTO"%>
<%@page import="com.naver.NaverDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 컨텍스트 경로 (ex./study)

	String userid = request.getParameter("userid");
	
	Connection conn = DBConn.getConnection();
	NaverDAO dao = new NaverDAO(conn);
	
	NaverDTO dto = dao.getReadData(userid);
	
	DBConn.close();
	
	if(dto == null)
		response.sendRedirect("naver_list.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
body {
	background-color: #F5F5F5;
}

table {
	margin-left: auto;
	margin-right: auto;
}

input.box {
	border: 1px solid #c8c8c8;
	width: 400px;
	height: 40px;
}

.box2 {
	border: 1px solid #c8c8c8;
	width: 128px;
	height: 40px;
}

.box3 {
	border: 1px solid #c8c8c8;
	width: 300px;
	height: 40px;
}

select.box4 {
	border: 1px solid #c8c8c8;
	width: 400px;
	height: 44px;
}

.box5 {
	border: 1px solid #c8c8c8;
	width: 128px;
	height: 44px;
}
</style>

<script type="text/javascript">

	function sendIt(){
	
		var f = document.myForm

		alert("수정 완료!!")
		
		f.action = "<%=cp%>/naver/naver_update_ok.jsp";
		f.submit();
	
	}	
	

</script>


</head>
<body>

<br/><br/>
<center>
<a href = "naver_list.jsp">
<img src="./img/naver.gif" style="width: 250px; height : 70px"><br/>
</a>
</center>
<br/>

<form action="" method="post" name="myForm">

<table>
<tr><td><b><font size ="2">아이디</font></b></td></tr>
<tr >
	<td>
	<input type="text" name="userid" class="box" maxlength="15" value="<%=dto.getUserid()%>" readonly="readonly">
	</td>
</tr>
</table>

<br/>

<table>
<tr><td><b><font size ="2">비밀번호</font></b></td></tr>
<tr>
	<td>
	<input type="password" name="pwd" class="box" maxlength="15" value="<%=dto.getPwd()%>">
	</td>
</tr>
</table>

<br/>

<table>
<tr><td><b><font size ="2">비밀번호 재확인</font></b></td></tr>
<tr>
	<td>
	<input type="password" class="box" name="pwd2" maxlength="15" value="<%=dto.getPwd()%>">
	</td>
</tr>
</table>

<br/>

<table>
<tr><td><b><font size ="2">이름</font></b></td></tr>
<tr>
	<td>
	<input type="text" name="name" class="box" value="<%=dto.getName()%>">
	</td>
</tr>
</table>

<br/>

<table>
<tr><td><b><font size ="2">생년월일</font></b></td></tr>
<tr>
	<td>
	<input type = "text" class="box2" name="birth" placeholder="  년(4자)" maxlength="4" value="<%=dto.getBirth()%>">
	</td>
	<td>
	<select class = "box5" name="month">
		<option value = "">&nbsp;&nbsp;월</option>
		<option value = "1">&nbsp;&nbsp;1</option>
		<option value = "2">&nbsp;&nbsp;2</option>
		<option value = "3">&nbsp;&nbsp;3</option>
		<option value = "4">&nbsp;&nbsp;4</option>
		<option value = "5">&nbsp;&nbsp;5</option>
		<option value = "6">&nbsp;&nbsp;6</option>
		<option value = "7">&nbsp;&nbsp;7</option>
		<option value = "8">&nbsp;&nbsp;8</option>
		<option value = "9">&nbsp;&nbsp;9</option>
		<option value = "10">&nbsp;&nbsp;10</option>
		<option value = "11">&nbsp;&nbsp;11</option>
		<option value = "12">&nbsp;&nbsp;12</option>
		</select>
	</td>
	<td>
	<input type = "text" class="box2" name="date" placeholder="  일" maxlength="2">
	</td>
</tr>
</table>

<br/>

<table>
<tr><td><b><font size ="2">성별</font></b></td></tr>
<tr>
	<td>
		<input type="text" name="gender" class="box" maxlength="15" value="<%=dto.getGender()%>" readonly="readonly">
	</td>
</tr>
</table>

<br/>

<table>
<tr><td><b><font size ="2">본인 확인 이메일</font></b><font size ="1">(선택)</font></td></tr>
<tr>
	<td>
	<input type = "text" name="email" class="box" placeholder="  선택입력" value="<%=dto.getEmail()%>">
	</td>
</tr>
</table>

<br/>

<table>
<tr><td><b><font size ="2">휴대전화</font></b></td></tr>
<tr>
	<td>
	<select class = "box4" name="nationNo">
		<option value = "82">&nbsp;&nbsp;대한민국 +82</option>
		<option value = "45">&nbsp;&nbsp;덴마크 +45</option>
		<option value = "49">&nbsp;&nbsp;독일 +49</option>
		<option value = "52">&nbsp;&nbsp;멕시코 +52</option>
		<option value = "55">&nbsp;&nbsp;브라질 +55</option>
		</select>
	</td>
</tr>
<tr>
	<td>
	<input type = "text" name="tel" class="box3" placeholder="  전화번호 입력" maxlength="11" value="<%=dto.getTel()%>">
	<a href ="">
	<img align ="right" src="./img/naver/인증번호받기.jpg" style="height: 44px">
	</a>
	</td>
</tr>
<tr>
	<td>
	<input type = "text" class="box" placeholder="  인증번호 입력하세요">
	</td>
</tr>
</table>

<br/><br/>

<center>
<a href = "javascript:sendIt();">
<img src="./img/naver/na_2.jpg" style ="width: 400px;">
</a><br/>
</center>

<br/>

<center>
<img src="./img/naver/Corp.jpg">
</center>

</form>



</body>
</html>