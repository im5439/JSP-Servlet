<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function textCopy(){
		
		var cvalue;
		cvalue = window.document.myForm.check1.checked;
		
		if(cvalue){ // cvalue가 true이면
			document.myForm.client2.value = document.myForm.client1.value
		} else{
			document.myForm.client2.value = "";
		}
		
	}

</script>

</head>
<body>
<form action="" name ="myForm">
주문고객정보 - 주소 <input type ="text" size="40" name ="client1"/>
<input type ="checkbox" name = "check1" onclick ="textCopy();"/>배송장소가 위와 동일<br/>

주문고객정보 - 주소 <input type ="text" size="40" name ="client2"/><br/>
</form>

</body>
</html>