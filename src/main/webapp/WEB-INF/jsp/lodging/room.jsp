<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   <!-- 포맷라이브러리 추가 -->      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 객실화면</title>
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
			<div class="room-page">
				<h1 class="text-center">
					ChoongMo Tour Room Page
				</h1>
				
				
				
				<div class="lodging-profile2 align-items-center">
					<img class="profile" width="" src="${lodging.imagePath } " alt="호텔">
				
					<h3>${lodging.level }</h3><!-- 성급도 for문써서 해보기 -->
				</div><br>
				
				<div class="text-center">
					<h2>${lodging.roomName }</h2>
				</div><br>
				
				<ul class="nav nav-tabs"><!-- div class tab도가능 -->
				  <li class="nav-item">
				    <a class="nav-link active" aria-current="page" href="#">객실리스트</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">리뷰</a>
				  </li>
			
			
				</ul>
				
				<label class="mt-3">체크인 </label>
		        <input type="text" id="startDate" autocomplete="off"><!--각각 객체를 만들어야 하므로 id값 부여.-->
		        <label class="mt-3">체크아웃 </label>
		        <input type="text" id="endDate" autocomplete="off"><br>
				
				
				
				<!-- 객실리스트 시작 -->
				<div class="room-card-list">
					<!-- 객실 카드 -->
	
					<c:forEach var="room" items="${roomList }">
					<div class="room-card d-flex ml-3 mt-3">
						<div class="room-profile ml-3 mt-3">
							<img class="profile" width="" src="${room.imagePath }" alt="호텔">
						</div>
							
						<div class="room-card-body ml-3 mt-3">
						<c:choose>
							<c:when test="${room.size eq 'singleroom' }">
								<div class="ml-4">싱글룸</div>
							</c:when>
							<c:when test="${room.size eq 'doubleroom' }">
								<div class="ml-4">더블룸</div>
							</c:when>
							<c:when test="${room.size eq 'twinroom' }">
								<div class="ml-4">트윈룸</div>
							</c:when>
							<c:otherwise>
								<div class="ml-4">${room.size }</div>
							</c:otherwise>
						</c:choose>	
							<div class="mt-3 ml-4"><fmt:formatNumber value= "${room.price }" type="currency" currencySymbol =""/>원</div>
							
							<div class = "buttonlist text-center">											<!-- data-toggle="modal"을 부여하면 modal을 띄울 준비가 되고 data-target="DOM선택자"를 입력하면 지정된 내용을 modal로 띄울 수 있다 -->
							<button id = "infomodalBtn${room.id }" type="button"  class="btn btn-primary info-modal-btn btn-sm col-11"  data-toggle="modal" data-target="#moreModal" data-room-id="${room.id }">상세정보</button><br>
							<a href="/lodging/reservation/view?id=${room.id }" class="btn btn-primary reserve-btn btn-sm mt-3 col-11" type="button" data-room-id="${room.id }">예약하기</a>
							</div>
						</div>
					</div>
					
					
					
					
					
					<!-- Button trigger modal -->
		
					<!-- Modal 도 댓글달기-->		<!-- class에 info-modal 이렇게 해서 안지워지는 오류가 생긴거였음 -->		<!-- 모달사이즈 -->
					
					
					<div class="modal fade " id="moreModal" tabindex="-1" aria-labelledby="myLargeModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					       <div class="modal-header">
					        <h5 class="modal-title">객실 이용 안내</h5>
					        
			     			 </div>	
					
					      <div class="modal-body text-center">
					       <p id="contentInput${room.id }">${room.content }</p> <!-- 동떨어진 하나의 태그기때문에 쓸수 있는정보가 암것도 없다. -->
					      
					     	<p>예약날짜(선택사항) </p>
					      </div><!-- 객체화시켜야 하므로 아이디 부여 --><!-- 속성을 동적으로 추가할려면? -->
					      <div class="modal-footer">
			        
			        		<button type="button" id="closeBtn "class="btn btn-secondary" data-dismiss="modal">닫기</button>
			      		  </div>
					   
					    </div>
					  </div>
					</div>	
					
					
			</c:forEach> 
					
					
					

					<!-- 객실리스트 끝 -->
				</div>
	
			</div>
			
		</section>
		
		
		
		
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
		
	</div>
	<script>
	 $(document).ready(function() {
		 
		 
		 
		 $(".info-modal-btn").on("click", function(){
			 
			 let id = $(this).data("room-id");
			 
			 
		 });
		 
		 
		 $("#startDate").datepicker({//datepicker 요일 한글로 검색
             dateFormat:"yy-mm-dd",
            
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
             currentText: '오늘 날짜' , 
            
             showButtonPanel:true,
             closeText: 'done',
             minDate: 0,//오늘날짜 부터
             onSelect:function(selectedDate) {
                 
                 $("#endDate").datepicker("option", "minDate", selectedDate);

                 }

         });

       

         $("#endDate").datepicker({//종료일
             dateFormat:"yy-mm-dd",
           
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
		 
		 
	 });
	</script>


</body>
</html>