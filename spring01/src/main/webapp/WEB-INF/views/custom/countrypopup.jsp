<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
 <script type="text/javascript">
        function setParentText1(){
             opener.document.getElementById("COUNTRY_ENG").value = document.getElementById("kor").value
             opener.document.getElementById("COUNTRY_KOR").value = document.getElementById("kor2").value
        }
        function setParentText2(){
            opener.document.getElementById("COUNTRY_ENG").value = document.getElementById("eng").value
            opener.document.getElementById("COUNTRY_KOR").value = document.getElementById("eng2").value
       }
        function setParentText3(){
             opener.document.getElementById("COUNTRY_ENG").value = document.getElementById("jpn").value
             opener.document.getElementById("COUNTRY_KOR").value = document.getElementById("jpn2").value
        }
   </script>
</head>
<body>
<input type="hidden" id="kor" name="kor" value="KOR">
<input type="hidden" id="eng" name="eng" value="ENG">
<input type="hidden" id="jpn" name="jpn" value="JPN">
<input type="button" id="kor2" name="kor2" value="대한민국" onclick="setParentText1()"/>
<input type="button" id="eng2" name="eng2" value="미국" onclick="setParentText2()"/>
<input type="button" id="jpn2" name="jpn2" value="일본"onclick="setParentText3()"/>
<br/>
<input type="button" value="창닫기" onclick="window.close()">
</body>
</html>