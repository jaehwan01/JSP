<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>거래처 조회</h2>
<input type="button" value="신규 거래처 등록" onclick="location.href='/custom/customwrite.do'">
	<form method="get" action="/custom/customlistinquiry.do">
		사업자번호 <input type="text" placeholder="사업자번호" name="BUSI_NUM" maxlength="20"><br>
		거래처명 <input type="text" placeholder="거래처명" name="CUSTOM" maxlength="20">
	<input type="submit" class="btn btn-primary form-control" value="조회">
	</form>
<c:forEach var="row" items="${items}">
	<table border="1" width="300px">
	<tr>
		<td>사업자번호</td>
		<td>거래처명</td>
	</tr>
	<tr>
		<td><a href="/custom/view.do?BUSI_NUM=${row.BUSI_NUM}">${row.BUSI_NUM}</a></td>
		<td>${row.CUSTOM}</td>
	</tr>
	</table>
</c:forEach>
</body>
</html>