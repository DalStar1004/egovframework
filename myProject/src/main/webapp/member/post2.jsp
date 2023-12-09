<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>

<script>
$(function(){
	$("#btn_send").click(function(){
		var addr = $("#address").val();
		// var addr = "[02408] 서울특별시 동대문구 한천로]";
		var addr_array = addr.split(" ");
		var zipcode = addr_array[0].substring(1,addr_array[0].length-1); 
		var address = addr.replace(addr_array[0],"");
		address = $.trim(address);
			
	   // opener는 뒤에 화면을 의미함 ↓ frm은 memberWrite name = "frm" name값으로 적어줘야 한다
  		opener.document.frm.zipcode.value = zipcode;
  		opener.document.frm.address.value = address;
  		
  		self.close();
	});	
});
</script>

<body>
<div style="width:100%; text-align:center;">
<select name = "address" id = "address">

	<c:forEach var ="result" items="${resultList }">
	
	<option value="${result.addr}">${result.addr}</option>
	
	</c:forEach>

</select>

<br><br>
<button type="button" id ="btn_send">적용하기</button>
</div>

</body>
</html>