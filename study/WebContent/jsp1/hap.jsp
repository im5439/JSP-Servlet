<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action ="hap_ok.jsp" method="post" name='myForm'>

수1: <input type = "text" name = "su1"/><br/>
수2: <input type = "text" name = "su2"/><br/>
이름: <input type = "text" name = "name"/><br/>

<input type = "submit" value = "결과"/><br/> 
<!-- submit은 무조건 form의 action을 찾아감(form안의 name들을 다가지고 넘어감) 보통 button과 onclick="함수"로 많이씀
form양식은 거의 post로 쓴다 중요한값 유출방지를 위해 
사용자에게 값을 받을떄는 post방식을 쓴다.
get방식은 프로그래머가 쓴다.-->
</form>

<br/><br/>
<!-- get방식은 아래의 방식으로 값을 넘겨줄수있다. 넘기고싶은 값을 임의로 넘길떄 get방식.
 한글은 깨짐 아래와같이 인코딩이되면 잘뜸(%EC%9D%B8%EB%82%98 = 인나) -->
<a href="hap_ok.jsp?su1=100&su2=200&name=%EC%9D%B8%EB%82%98">GET방식</a>

</body>
</html>