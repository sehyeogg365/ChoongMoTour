<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
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
	
</head>
<body>
	<div id = "wrap">
	
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="room-page">
				<h1 class="text-center">
					ChoongMo Tour Room Page
				</h1>
				
				
				
				<div class="text-center">
						<img class="lodging-profile" width="500" src="${lodging.imagePath } " alt="호텔">
				</div><br>
				
				<div class="text-center">
					<h2>${lodging.roomName }</h2>
				</div><br>
				<label class="mt-3">시작 일 </label>
		        <input type="text" id="startDate" autocomplete="off"><!--각각 객체를 만들어야 하므로 id값 부여.-->
		        <label class="mt-3">종료 일 </label>
		        <input type="text" id="endDate" autocomplete="off"><br>
				
				
				
				<!-- 객실리스트 시작 -->
				<div class="room-card-list">
					<!-- 객실 카드 -->
					
					
					<c:forEach var="room" items = "${roomList } ">
					<div class="room-card  ml-3 mt-3">
							<img class="room-profile" width="250" src="${room.imagePath }" alt="호텔">
							
							
							<div class="room-card-body">
								<div class="">${room.size }</div>
								<div class="">${room.price }</div>
								<div class="">${lodging.level }</div>
								<a href="/user/reservepage/view?id=${room.id }" class="btn btn-primary" type="button">예약하기</a>
							</div>
					</div>
					
					</c:forEach>

					
					</div>
	
			</div>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
		
	</div>
	<script>
	 $(document).ready(function() {
		 
		 
		 
		 
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
                 
                 $("#startDate").datepicker( "option", "maxDate", selectedDate );
                 
             
              }
            

         });
		 
		 
	 });
	</script>


</body>
</html>