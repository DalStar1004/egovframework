<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<body>
<!-- 번호, 제목, 글쓴이, 등록일, 조회수 -->
<table>
	<caption>
		<div>일반게시판 목록</div>
		<div>Total : ${total }</div>
	</caption>
	<tr>
		<th width="15%">번호</th>
		<th width ="40%">제목</th>
		<th width ="15%">글쓴이</th>
		<th width ="15%">등록일</th>
		<th width ="15%">조회수</th>
	</tr>
	
	<c:set var = "cnt" value = "1" />
	
	<!-- var : 내부변수 세팅, items : 외부데이터 세팅 -->
	<c:forEach var="result" items="${resultList }">
	
	<tr align = "center">
		<td><c:out value="${cnt }"/></td>
		<td  align="left"><c:out value="${result.title }"/></td>
		<td><c:out value="${result.name }"/></td>
		<td><c:out value="${result.rdate }"/></td>
		<td><c:out value="${result.hits }"/></td>
	</tr>
	
	<c:set var = "cnt" value = "${cnt+1 }"/>

	</c:forEach>

</table>

<div style="width:600px; margin-top:5px; text-align:center;">
	<c:forEach var="i" begin="1" end ="${totalPage }">
		${i } 
	</c:forEach>
</div>
<div style="width:600px; margin-top:5px; text-align:right;">
	<button type="button" onclick="location='boardWrite.do'">글쓰기</button>
</div>

</body>
</html>