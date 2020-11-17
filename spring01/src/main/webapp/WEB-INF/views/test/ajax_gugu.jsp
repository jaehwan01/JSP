<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(function(){ //페이지가 로딩되면 자동 실행
	// id가 btnLogin인 버튼을 누르면
	$("#button1").click(function(){
		// 태그에 입력한 값
		dan=$("#dan").val();
		param={"dan":dan};
		//비동기식 호출
		$.ajax({
			type: "post",
			url: "ajax_gugu_result.do",
			data: param,
			success: function(result){ //콜백함수
				$("#result").html(result);
			}
		});
	});
});
</script>
</head>
<body>
	<h2>구구단 계산</h2>
	단을 입력하세요 
	<input type="number" id="dan" value="3">
	<input type="button" id="button1" value="확인">
	<div id="result"></div>
</body>
</html>