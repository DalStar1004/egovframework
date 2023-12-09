<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정 화면</title>

<script src="/myProject/script/jquery.js"></script>
<script src="/myProject/script/jquery-ui.js"></script>

</head>

<style>
body {
	font-size: 9px;
}

button {
	font-size: 9px;
}

table {
	width: 600px;
	boarder-collapse: collapse;
}

th, td {
	border: 1px solid #cccccc;
	padding: 3px;
}

.input1 {
	width: 98%;
}

.textarea {
	width: 98%;
	height: 70px;
}
</style>



<script>
	/* $(function(){
	
	 $("#title").val("제목입력");
	
	 }) */

	function fn_submit() {
		
		// trim() -> 앞뒤 공백 제거, java, jsp
		
		// document.frm.title.value == "" (javascript 방식)
		// $("#title").val() == "" (jquery 방식)
		// $.trim("  aabbcc   ")  ==> $.trim($("#title").val()) ==  ""
		
		if ($.trim($("#title").val()) == "") {
			alert("제목을 입력해주세요.");
			// document.frm.title.focus();  같은표현 → $("#title").focus();
			$("#title").focus();
			return false;
		}

		$("#title").val($.trim($("#title").val()))

		if ($.trim($("#pass").val()) == "") {
			alert("암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}

		$("#pass").val($.trim($("#pass").val()))

		var formData = $("#frm").serialize();

		// ajax : 비동기 전송방식을 가지고 있는 jquery 함수임
		$.ajax({
			/* 전송 전 세팅 */
			type : "POST",
			data : formData,
			url : "boardModifySave.do",
			dataType : "text", // dataType : 리턴타입을 의미함
			
			/* 전송 후 세팅 */
			success : function(result) { //controller에서 넘어오는 값 -> "ok" 가 data로 넘겨 받는다 // controller → "ok","fail"
				if (result == "1") {
					alert("저장완료");
					location ="boardList.do";
				} else {
					alert("관리자에게 연락해주세요.\n저장실패");
				} 
			},
			error : function() { // error부분은 시스템 장애 발생시 발생
				alert("오류발생");
			}

		});

	}
</script>

<body>
	<form id="frm">
	<input type="hidden" name="unq" value="${boardVO.unq }">
		<table>
			<caption>게시판 수정 화면</caption>
			<tr>
				<th width="20%"><label for="title" >제목</label></th>
				<td width="80%"><input type="text" name="title" id="title" 
					class="input1" value="${boardVO.title }"></td>
			</tr>
			<tr>
				<th><label for="pass">암호</label></th>
				<td><input type="password" name="pass" id="pass"></td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content" class="textarea">${boardVO.content }</textarea></td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="submit" onclick="fn_submit(); return false;">저장</button>
					<button type="reset">취소</button>
				</th>
			</tr>
		</table>
	</form>
</body>
</html>