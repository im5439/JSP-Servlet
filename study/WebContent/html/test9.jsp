<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function checkAll(){
		
		var clen = document.myForm["sul"].length;
		
		for(var i = 0; i < clen; i++){
			document.myForm["sul"][i].checked = true; // 전체선택
		}
		
	}

	function checkDel(){
		
		var clen = document.myForm["sul"].length;
		
		for(var i = 0; i < clen; i++){
			document.myForm["sul"][i].checked = false; // 전체선택
		}
		
	}
	
	function bestsul(){
		
		var clen = document.myForm1.sul.length; //var clen = document.myForm["sul"].length; 똑같은 코딩
		
		for(var i = 0; i < clen; i++){
			
			if(document.myForm1.sul[i].checked == true){
				
				alert(document.myForm1.sul[i].value + "를 좋아하는 구나?")
				return;
				
			}
			
		}
		
		alert("술 싫어하냐?");
		
	}
	
	
	

</script>

</head>
<body>

좋아하는 술 종류<br/>
<form action="" name ="myForm">
<a href="javascript:checkAll();">전체선택</a>
<a href="javascript:checkDel();">전체해제</a><br/>
<input type="checkbox" name="sul">위스키<br/>
<input type="checkbox" name="sul">보드카<br/>
<input type="checkbox" name="sul">생맥주<br/>
<input type="checkbox" name="sul">소주<br/>
<input type="checkbox" name="sul">막걸리<br/>
<input type="checkbox" name="sul">와인<br/>
<input type="checkbox" name="sul">칵테일<br/>
<input type="checkbox" name="sul">꼬냑<br/>

</form>

<br/><br/><br/><br/>

가장 좋아하는 술<br/>
<form action="" name ="myForm1">
<input type="radio" name="sul" value="위스키">위스키<br/>
<input type="radio" name="sul" value="보드카">보드카<br/>
<input type="radio" name="sul" value="생맥주">생맥주<br/>
<input type="radio" name="sul" value="소주">소주<br/>
<input type="radio" name="sul" value="막걸리">막걸리<br/>
<input type="radio" name="sul" value="와인">와인<br/>
<input type="radio" name="sul" value="칵테일">칵테일<br/>
<input type="radio" name="sul" value="꼬냑">꼬냑<br/>

<a href="javascript:bestsul();"><img src="./img/btn_poll01.gif"/></a>

</form>

</body>
</html>