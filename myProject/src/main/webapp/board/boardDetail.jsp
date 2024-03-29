<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- JSTL에서 바꿀수 있다는 것을 알려주기 위한 구문 -->
<% pageContext.setAttribute("newline","\n"); %>
<c:set var="content" value="${fn:replace(boardVO.content, newline,'<br>')}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 화면</title>

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

		if ($.trim($("#title").val()) == "") {
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}

		$("#title").val($.trim($("#title").val()));

		if ($.trim($("#pass").val()) == "") {
			alert("암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}

		$("#pass").val($.trim($("#pass").val()));

		var formData = $("#frm").serialize();

		// ajax : 비동기 전송방식을 가지고 있는 jquery 함수임
		$.ajax({
			type : "POST",
			data : formData,
			url : "boardWriteSave.do",
			dataType : "text", // dataType : 리턴타입을 의미함
			success : function(data) { //controller에서 넘어오는 값 -> "ok" 가 data로 넘겨 받는다 // controller → "ok","fail"
				if (data == "ok") {
					alert("저장완료");
					location ="boardList.do";
				} else {
					alert("저장실패");
				} 
			},
			error : function() { // error부분은 시스템 장애 발생시 발생
				alert("오류발생");
			}

		});

		/* 	if(document.frm.title.value == ""){
			alert("제목을 입력해주세요!");
			document.frm.title.focus();
			return false;
		}
		
		if(document.frm.pass.value == ""){
			alert("암호를 입력해주세요!");
			document.frm.pass.focus();
			return false;
		} */

		// document.frm.submit(); // 동기전송방식
	}
</script>

<body>
	<form id="frm">
		<table>
			<caption>게시판 상세</caption>
			<tr>
				<th width="20%">제목></th>
				<td width="80%">${boardVO.title }</td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td><c:out value="${boardVO.name }"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td height ="50"> <!-- 구독축하해요 \n → <br>로 바꿔줘야 줄바꿈 됨 -->
					${boardVO.content }
				</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${boardVO.rdate }</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" onclick="location='boardList.do'">목록</button>
					<button type="button" onclick="location='boardModifyWrite.do?unq=${boardVO.unq}'">수정</button>
					<button type="button" onclick="location='passWrite.do?unq=${boardVO.unq}'">삭제</button>
				</th>
			</tr>
		</table>
	</form>
</body>
</html>