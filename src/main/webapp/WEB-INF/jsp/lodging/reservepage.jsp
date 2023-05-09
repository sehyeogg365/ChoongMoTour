<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>         
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   <!-- 포맷라이브러리 추가 -->     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 예약 페이지</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<!-- datepicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	
	
</head>
<body>
	<div id = "wrap">
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="reserve-page">
				<h1 class="text-center">
					ChoongMo Tour Reserve Page
				</h1>
			
				<form method="post" action="/lodging/reserve"><!-- 여기경로도 뭔가 좀 이상하고?? -->
				<div class="reservepagecontents ">
				
					<div class="">룸아이디:${room.id }</div><!-- 보다시피 룸아이디가 안받아와지고 있는상황 -->
					<div class="">유저아이디:${user.id }</div><!-- 어제와 같은상황 유저아이디가 2인 고트로 접속했는데 1이뜨는상황 그렇다 룸아이디랑 유저아이디가 바뀌어 나오는상황 -->
					<div class=""><h2>${lodging.roomName }</h2></div><br>
					<c:choose>
							<c:when test="${room.size eq 'singleroom' }">
								<h3>싱글룸</h3>
							</c:when>
							<c:when test="${room.size eq 'doubleroom' }">
								<h3>더블룸</h3>
							</c:when>
							<c:when test="${room.size eq 'twinroom' }">
								<h3>트윈룸</h3>
							</c:when>
							<c:otherwise>
								<div class="">${room.size }</div>
							</c:otherwise>
						</c:choose>	
					
					<div class="d-flex mt-3 mx-3 justify-content-center ">
						<label class="mt-3">체크인 </label>
		        		<input type="text" id="startDate" name="startDate" value="" autocomplete="off"><!--각각 객체를 만들어야 하므로 id값 부여.-->
		        		<label class="mt-3">체크아웃 </label>
		        		<input type="text" id="endDate" name="endDate" value= " " autocomplete="off"><br><!-- input type을 텍스트로 해서 저장이안됐나?? -->
				
					
					</div>
					
					<div class = "mx-3">
						<label class="input-lable mt-4">예약자 이름</label><input type="text" id="nameInput" value = "${user.name }" class="form-control ">
					
					
						<label class="input-lable mt-4">전화번호</label><input type="text" id="phoneNumberInput" value = "${user.phoneNumber}" class="form-control ">
					</div>
					<hr>
					
					
					<label class="col-4 mt-4">총 결제 금액 </label> <strong><fmt:formatNumber value= "${room.price }" type="currency" currencySymbol =""/>원</strong><!-- 이것도 fmt활용해보기 -->
					
					
					<hr>
					<div class="payselect mt-4 mx-3">
						<div class=""> 결제수단을 선택하세요. </div>
						<select class="form-control col-5 mt-3" id="paySelector">
							
                            <option value="">결제수단</option>
                            <option value="카카오페이">카카오페이</option>
                            <option value="네이버페이">네이버페이</option>
                            <option value="삼성페이">삼성페이</option>
                            <option value="카드">카드</option>
                       
                 		</select>
					
					</div>
					
					
					
					<div class="check-box mt-4 mx-3">
						<label>전체 선택<input type="checkbox" id="allCheck"></label> <br>
				        <label>개인정보 활용 동의<input type="checkbox" name="check" value="check1" id="check1"></label><br>
				        <label>서비스 이용 동의<input type="checkbox" name="check" value="check2" id="chceck2"></label><br>
				        <label>마케팅 활용 동의<input type="checkbox" name="check" value="check3" id="check3"></label>
					
					</div>
					
					
					<div class="text-center mb-3">
					
						<button id = "payBtn" type="submit"  class="btn btn-danger col-8 mb-3" data-room-id = "${room.id}" >결제하기</button>
					</div>
				</div>
				
			</form>
			
			</div>
		
		
		
		
		</section>
	
	
	
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>
	<script>
	$(document).ready(function(){

		document.getElementById('startDate').value = new Date().toISOString().substring(0, 10);
		
		var now = new Date();
		document.getElementById('endDate').value = new Date(now.setDate(now.getDate()+1)).toISOString().substring(0, 10);
		
		
		
		 $("#startDate").datepicker({//datepicker 요일 한글로 검색
             dateFormat:"yy년 mm월 dd일",
            
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
             currentText: '오늘 날짜' , 
             todayHighlight :true,// 오늘을 표시해줄지. default 가 false
             showButtonPanel:true,
             closeText: 'done',
             minDate: 0,//오늘날짜 부터
             onSelect:function(selectedDate) {
                 
                 $("#endDate").datepicker("option", "minDate", selectedDate);

                 }

         });
		// todayHighlight :true,
       

         $("#endDate").datepicker({//종료일
             dateFormat:"yy년 mm월 dd일",
           
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
             currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
             showButtonPanel:true,//버튼보이기
             closeText: 'done',
             minDate:'+1D',//오늘날짜 다음 부터
             //beforeShow: customRange
              onSelect:function(selectedDate) {
                 
                 $("#startDate").datepicker("option", "maxDate", selectedDate );
                 
             
              }
            

         });
		
         var chkList = $("input[name = check]");
		 $("#allCheck").on("change", function() {
             // 내 자신이 체크 되었는지 안되었는지
             if($(this).is(":checked")) {
                 $("input[name='check']").prop("checked", true);
             } else {
                 $("input[name='check']").prop("checked", false);
             }
             
         
          
             
         });
		
		
	});
	
	
	</script>


</body>
</html>