<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">	
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/postcode/cssjs/lib/jquery-1.11.0.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/postcode/cssjs/guide/1587458135315/guide.v2.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
	new daum.Postcode({
  	oncomplete: function(data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var roadAddr = data.roadAddress; // 도로명 주소 변수
      var extraRoadAddr = ''; // 참고 항목 변수

      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
          extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다.
      if(data.buildingName !== '' && data.apartment === 'Y'){
         extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
      }
      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if(extraRoadAddr !== ''){
          extraRoadAddr = ' (' + extraRoadAddr + ')';
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById('sample4_postcode').value = data.zonecode;
      document.getElementById("sample4_roadAddress").value = roadAddr;
      document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
      
      /*
      // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
      if(roadAddr !== ''){
          document.getElementById("sample4_extraAddress").value = extraRoadAddr;
      } else {
          document.getElementById("sample4_extraAddress").value = '';
      }

      var guideTextBox = document.getElementById("guide");
      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
      if(data.autoRoadAddress) {
          var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
          guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
          guideTextBox.style.display = 'block';

      } else if(data.autoJibunAddress) {
          var expJibunAddr = data.autoJibunAddress;
          guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
          guideTextBox.style.display = 'block';
      } else {
          guideTextBox.innerHTML = '';
          guideTextBox.style.display = 'none';
      } */
	}
    		
    	    /* onclose: function(state) {
    	        //state는 우편번호 찾기 화면이 어떻게 닫혔는지에 대한 상태 변수 이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
    	        if(state === 'FORCE_CLOSE'){
    	            //사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 실행될 코드를 작성하는 부분입니다.

    	        } else if(state === 'COMPLETE_CLOSE'){
    	            //사용자가 검색결과를 선택하여 팝업창이 닫혔을 경우, 실행될 코드를 작성하는 부분입니다.
    	            //oncomplete 콜백 함수가 실행 완료된 후에 실행됩니다.
    	        }
    	    }*/
    		
  }).open();
}
</script>
<script type="text/javascript">
    
        var openWin;
    
        function openChild()
        {
            // window.name = "부모창 이름"; 
            window.name = "parentForm";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("/countrypopup",
                    "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
        }
 
</script>
<script type="text/javascript">
	$(function() {
		//수정 버튼 클릭
		$("#btnUpdate").click(function() {
			document.form1.action = "/custom/update.do";
			document.form1.submit();
		});
		//삭제 버튼 클릭
		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "/custom/delete.do";
				document.form1.submit();
			}
		});
	});
</script>
</head>
<body>
	<h2>거래처 상세정보</h2>
	<form name="form1" method="post">
		<table border="1" width="400px">
			<tr>
				<td>사업자번호</td>
				<td><input type="text" placeholder="사업자번호" name="BUSI_NUM" maxlength="20" value="${dto.BUSI_NUM}" readonly></td>
			</tr>
			<tr>
				<td>거래처명</td>
				<td><input type="text" placeholder="거래처명" name="CUSTOM" size="40" maxlength="20" value="${dto.CUSTOM}"></td>
			</tr>
			<tr>
				<td>약칭</td>
				<td><input type="text" placeholder="약칭" name="SHORT" maxlength="20" value="${dto.SHORT}"></td>
			</tr>
			<tr>
				<td>대표자</td>
				<td><input type="text" placeholder="대표자" name="CEO" maxlength="20" value="${dto.CEO}"></td>
			</tr>
			<tr>
				<td>담당자</td>
				<td><input type="text" placeholder="담당자" name="CHARGE_PERSON" maxlength="20" value="${dto.CHARGE_PERSON}"></td>
			</tr>
			<tr>
				<td>업 태</td>
				<td><input type="text" placeholder="업태" name="BUSI_CONDITION" maxlength="20" value="${dto.BUSI_CONDITION}"></td>
			</tr>
			<tr>
				<td>종 목</td>
				<td><input type="text" placeholder="종목" name="ITEM" maxlength="20" value="${dto.ITEM}"></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><input type="text" id="sample4_postcode" placeholder="우편번호" name="POST_NUM" maxlength="20" value="${dto.POST_NUM}"></td>
				<td><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="d_btn"></td><br>
			</tr>
			<tr>
				<td>주소1</td>
				<td><input type="text" id="sample4_roadAddress" name="ADDR1" size="30" placeholder="주소1" maxlength="80" value="${dto.ADDR1}"></td>
			</tr>
			<tr>
				<td>주소2</td>
				<td><input type="text" id="sample4_jibunAddress" name="ADDR2" size="40" placeholder="주소2" maxlength="80" value="${dto.ADDR2}"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" placeholder="전화번호" name="TEL" maxlength="20" value="${dto.TEL}"></td>
			</tr>
			<tr>
				<td>팩스번호</td>
				<td><input type="text" placeholder="팩스번호" name="FAX" maxlength="20" value="${dto.FAX}"></td>
			</tr>
			<tr>
				<td>홈페이지</td>
				<td><input type="text" size="40" placeholder="홈페이지" name="HOMEPAGE" maxlength="20" value="${dto.HOMEPAGE}"></td>
			</tr>
			<tr>
				<td>법인여부</td>
				<td>
					<div class="btn-group" data-toggle="buttons">
						<c:if test="${dto.CO_YN == '개인'}">
							법인 :	<input type="radio" name="CO_YN" id="CO_YN" value="법인" >
							개인 :	<input type="radio" name="CO_YN" id="CO_YN" value="개인" checked >
						</c:if>
						<c:if test="${dto.CO_YN == '법인'}">
							법인 :	<input type="radio" name="CO_YN" id="CO_YN" value="법인" checked>
							개인 : 	<input type="radio" name="CO_YN" id="CO_YN" value="개인" >
						</c:if>
					</div>
				</td>
			</tr>
			<tr>
				<td>해외여부</td>
				<td>
					<div class="btn-group" data-toggle="buttons">
						<c:if test="${dto.FOREIGN_YN == '국내'}">
							국내 :	<input type="radio" name="FOREIGN_YN" id="FOREIGN_YN" value="국내" checked>
							해외 :	<input type="radio" name="FOREIGN_YN" id="FOREIGN_YN" value="해외" >
						</c:if>
						<c:if test="${dto.FOREIGN_YN == '해외'}">
							국내 :	<input type="radio" name="FOREIGN_YN" id="FOREIGN_YN" value="국내" >
							해외 : 	<input type="radio" name="FOREIGN_YN" id="FOREIGN_YN" value="해외" checked>
						</c:if>
					</div>
				</td>
			</tr>
			<tr>
				<td>과세구분</td>
				<td>
				 	<c:if test="${dto.TAX_YN == '과세'}">
						<select name="TAX_YN">
							<option value="과세" selected>과세</option>
							<option value="면세">면세</option>
						</select>
					</c:if>
					<c:if test="${dto.TAX_YN == '면세'}">
						<select name="TAX_YN">
							<option value="과세">과세</option>
							<option value="면세" selected>면세</option>
						</select>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>국가</td>
				<td><input type="text" name="COUNTRY_ENG" id="COUNTRY_ENG" value="${dto.COUNTRY_ENG}" /></td>
				<td><input type="text" name="COUNTRY_KOR" id="COUNTRY_KOR" value="${dto.COUNTRY_KOR}" /></td>
				<td><input type="button" name="searchK" id="searchK" value="검색" onclick="openChild()"/></td>
			</tr>
			<tr>
				<td>특수관계자</td>
				<td>
					<c:if test="${dto.SPECIAL_RELATION == 'on'}">
					<input type="checkbox" name="SPECIAL_RELATION" maxlength="20" checked>
					</c:if>
					<c:if test="${dto.SPECIAL_RELATION != 'on'}">
					<input type="checkbox" name="SPECIAL_RELATION" maxlength="20">
					</c:if>
				</td>
			</tr>
			<tr>
				<td>거래중지</td>
				<td>
					<c:if test="${dto.TRADE_STOP == 'on'}">
					<input type="checkbox" name="TRADE_STOP" maxlength="20" checked>
					</c:if>
					<c:if test="${dto.TRADE_STOP != 'on'}">
					<input type="checkbox" name="TRADE_STOP" maxlength="20">
					</c:if>
				</td>
			</tr>
			<tr>
				<td>계약기간</td>
				<td><input type="date" placeholder="시작일자" name="CONTRACT_PERIOD_S" maxlength="10" value="${dto.CONTRACT_PERIOD_S}">~</td>
				<td><input type="date" placeholder="종료일자" name="CONTRACT_PERIOD_E" maxlength="10" value="${dto.CONTRACT_PERIOD_E}"></td>
			</tr>
			<tr>
				<td>등록정보</td>
				<td><input type="text" placeholder="등록인" name="REGI_INFO_MAN" id="REGI_INFO_MAN" maxlength="10" value="${dto.REGI_INFO_MAN}" readonly="readonly"></td>
				<td><input type="datetime-local" placeholder="등록일" name="REGI_INFO_DATE" id="REGI_INFO_DATE" maxlength="10" value="${dto.REGI_INFO_DATE}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>변경정보</td>
				<td><input type="text" placeholder="변경인" name="MODI_INFO_MAN" maxlength="10" value="${dto.MODI_INFO_MAN}"></td>
				<td><input type="datetime-local" placeholder="변경일" name="MODI_INFO_DATE" id="MODI_INFO_DATE" maxlength="10" value="${dto.MODI_INFO_DATE}" readonly="readonly"></td>
			</tr>
		</table>
		<h3 style="text-align: left;">거래처 계좌정보</h3>
			<table border="1">
			<tr>
				<td>사무소</td>
				<td>은행</td>
				<td>계좌번호</td>
			</tr>
			<tr>
				<td><input type="text" placeholder="사무소" name="FACTORY" maxlength="20" value="${dto.FACTORY}"></td>
				<td><input type="text" placeholder="거래은행" name="TRADE_BANK" maxlength="20" value="${dto.TRADE_BANK}"></td>
				<td><input type="text" size="40" placeholder="계좌번호" name="ACCOUNT_NUM" maxlength="20" value="${dto.ACCOUNT_NUM}"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정" id="btnUpdate">
					<input type="button" value="삭제" id="btnDelete">
				</td>
			</tr>
			</table>
	</form>
</body>
<script>
const offset = new Date().getTimezoneOffset() * 60000;
document.getElementById('MODI_INFO_DATE').value = new Date(Date.now() - offset).toISOString().slice(0,16);
</script>
</html>