<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>
$(function(){
	
	$("#btn_submit").click(function(){
		
		var userid = $.trim($("#userid").val());
		var pass = $.trim($("#pass").val());
		
		if( userid == "" ){
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
			return false;
		}
		
		if( pass == "" ){
			alert("암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		
		$.ajax({
			
			type : "POST",
			data : "userid="+userid+"&pass="+pass,  // json(전송)타입
			url : "loginWriteSub.do",
			dataType : "text", // dataType : 리턴타입을 의미함
			
			/* 전송 후 세팅 */ 
			success : function(result) { 
				if (result == "ok") {
					alert(userid+"님 로그인 되셨습니다.");
					location ="boardList.do";
				} else {
					alert("로그인 정보를 다시 확인해주세요.");
				} 
			},
			error : function() { // error부분은 시스템 장애 발생시 발생
				alert("오류발생");
			}
			
		});
		
	});
	
	
});
	
</script>

</head>

<style>
body{
	font-size:9pt;
	font-color:#333333;
	font-family:맑은 고딕;
}
a{
	text-decoration:none;
}
table{
	width:600px;
	border-collapse:collapse;
}
th, td{
	border:1px solid #cccccc;
	padding:3px;
	line-height:2;
}
caption{
	font-size:15px;
	font-weight:bold;
	margin-top:10px;
    padding-bottom:5px;
}

.div_button{
	width:600px;
	text-align:center; 
	margin-top:5px;
}

</style>

<body>

<%@ include file="../include/topmenu.jsp" %>

<form name = "frm" id ="frm">

<table>
	<caption>로그인</caption>
	<tr>
		<th><label for="userid">아이디</label></th>
		<td><input type="text" name="userid" id="userid" placeholder="아이디입력">
		</td>
	</tr>
	
	<tr>
		<th><label for="pass">암호</label></th>
		<td><input type="password" name="pass" id="pass">
		</td>
	</tr>
</table>

<div class="div_button">
	<button type="button" id="btn_submit" onclick=>로그인</button>
	<button type="reset">취소</button>
</div>

</form>

</body>
</html>