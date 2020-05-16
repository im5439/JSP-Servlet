<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CSS</title>

<style type="text/css">

body { 
	font-size : 11pt;
}

span.c1 {
	color: blue;
}

.c2 {
	color: red;
}

input.box {
	border: 1px solid #c8c8c8; width: 87px; height: 19px; 
}

table {
	font-size: 10pt; font-family: 돋움;
}

</style>

<link rel="stylesheet" type="text/css" href="style.css"/>

</head>
<body>

 나 11pt 이냐?<br/>

<!-- CSS (Cascade Style Sheet) -->

<font size="1">font 크기 : 1</font><br/>
<font size="2">font 크기 : 2</font><br/>
<font size="3">font 크기 : 3</font><br/>
<font size="4">font 크기 : 4</font><br/>
<font size="5">font 크기 : 5</font><br/>
<font size="6">font 크기 : 6</font><br/>
<font size="7">font 크기 : 7</font><br/>

<br/>

<font style ="font-size: 9pt;">font 크기 : 9</font><br/>
<font style ="font-size: 12pt;">font 크기 : 12</font><br/>
<font style ="font-size: 14pt;">font 크기 : 14</font><br/>
<font style ="font-size: 20pt;">font 크기 : 20</font><br/>
<font style ="font-size: 30pt;">font 크기 : 30</font><br/>
<font style ="font-size: 40pt;">font 크기 : 40</font><br/>
<font style ="font-size: 60pt;">font 크기 : 60</font><br/>

<br/><br/><br/><br/>

<table border ="1">
<tr align ="center">
	<td width ="300">
	<font  color ="blue" size ="2">
	블루투스(Bluetooth)는 휴대폰, 노트북, 이어폰·헤드폰 등의 휴대기기를 
서로 연결해 정보를 교환하는 근거리 무선 기술 표준을 뜻한다. 
주로 10미터 안팎의 초단거리에서 저전력 무선 연결이 필요할 때 쓰인다. 
예를 들어 블루투스 헤드셋을 사용하면 거추장스러운 케이블 없이도 주머니 속의 MP3플레이어의 음악을 들을 수 있다.
	</font> 
	</td>
	<td width ="300">
	<font  color ="blue" size = "2">
	블루투스(Bluetooth)는 휴대폰, 노트북, 이어폰·헤드폰 등의 휴대기기를 
서로 연결해 정보를 교환하는 근거리 무선 기술 표준을 뜻한다. 
주로 10미터 안팎의 초단거리에서 저전력 무선 연결이 필요할 때 쓰인다. 
예를 들어 블루투스 헤드셋을 사용하면 거추장스러운 케이블 없이도 주머니 속의 MP3플레이어의 음악을 들을 수 있다.
	</font> 
	</td>
</tr>
</table>

<br/>

<table border ="1" style="font-size: 10pt; color: blue;">
<tr align ="center">
	<td width ="300">
	블루투스(Bluetooth)는 휴대폰, 노트북, 이어폰·헤드폰 등의 휴대기기를 
서로 연결해 정보를 교환하는 근거리 무선 기술 표준을 뜻한다. 
주로 10미터 안팎의 초단거리에서 저전력 무선 연결이 필요할 때 쓰인다. 
예를 들어 블루투스 헤드셋을 사용하면 거추장스러운 케이블 없이도 주머니 속의 MP3플레이어의 음악을 들을 수 있다.
	</td>
	<td width ="300">
	블루투스(Bluetooth)는 휴대폰, 노트북, 이어폰·헤드폰 등의 휴대기기를 
서로 연결해 정보를 교환하는 근거리 무선 기술 표준을 뜻한다. 
주로 10미터 안팎의 초단거리에서 저전력 무선 연결이 필요할 때 쓰인다. 
예를 들어 블루투스 헤드셋을 사용하면 거추장스러운 케이블 없이도 주머니 속의 MP3플레이어의 음악을 들을 수 있다.
	</td>
</tr>
</table>

<br/><br/><br/><br/>

<span style ="color: blue">블루투스</span>(Bluetooth)는 휴대폰, 노트북, 이어폰·<span style ="color: red">헤드셋</span> 등의 휴대기기를 
서로 연결해 정보를 교환하는 근거리 무선 기술 표준을 뜻한다. 
주로 10미터 안팎의 초단거리에서 저전력 무선 연결이 필요할 때 쓰인다. 
예를 들어 <span style ="color: blue">블루투스</span> <span style ="color: red">헤드셋</span>을 사용하면 거추장스러운 케이블 없이도 주머니 속의 MP3플레이어의 음악을 들을 수 있다.

<br/><br/><br/><br/>

<span class="c1">블루투스</span>(Bluetooth)는 휴대폰, 노트북, 이어폰·<span class="c2">헤드셋</span> 등의 휴대기기를 
서로 연결해 정보를 교환하는 근거리 무선 기술 표준을 뜻한다. 
주로 10미터 안팎의 초단거리에서 저전력 무선 연결이 필요할 때 쓰인다. 
예를 들어 <span class="c1">블루투스</span> <span class="c2">헤드셋</span>을 사용하면 거추장스러운 케이블 없이도 주머니 속의 MP3플레이어의 음악을 들을 수 있다.

<br/><br/><br/><br/>

<span class="c3">블루투스</span>(Bluetooth)는 휴대폰, 노트북, 이어폰·<span class="c4">헤드셋</span> 등의 휴대기기를 
서로 연결해 정보를 교환하는 근거리 무선 기술 표준을 뜻한다. 
주로 10미터 안팎의 초단거리에서 저전력 무선 연결이 필요할 때 쓰인다. 
예를 들어 <span class="c3">블루투스</span> <span class="c4">헤드셋</span>을 사용하면 거추장스러운 케이블 없이도 주머니 속의 MP3플레이어의 음악을 들을 수 있다.

<br/><br/><br/><br/>


<table style ="font-size: 10pt; font-style: 돋움;" cellpadding ="3">
<tr>
	<td><input type ="text" class="box" style="background: url('./img/bg_log_id.gif') no-repeat 5px 3px #ffffff;"
	onfocus ="this.style.backgroundImage='';"> <!-- no-repeat 반복x onfocus 마우스를 클릭하면 배경이미지를 '' = null로 바꿔라 -->
	</td>
	<td></td>
</tr>

<tr>
	<td><input type ="password" class="box" style="background: url('./img/bg_log_pw.gif') no-repeat 5px 3px #ffffff;"
	onfocus ="this.style.backgroundImage='';">
	<td><img src ="./img/btn_login.gif"></td>
</tr>
<tr>
	<td colspan ="3" align ="center">
	<input type ="checkbox">아이디 저장
	<input type ="checkbox" checked ="checked">보안 접속
	</td>
</tr>

<tr height ="1">
	<td colspan ="3" bgcolor ="#dad6d6"></td>
</tr>

</table>


</body>
</html>