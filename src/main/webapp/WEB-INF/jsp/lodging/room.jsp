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
						<img class="lodging-profile" width="500" src="https://cdn.pixabay.com/photo/2016/03/28/09/34/bedroom-1285156_960_720.jpg " alt="호텔">
					</div>
				<div class="" >
				
				4월 26일
				
				</div>
				
				<div class="room-card-list">
				
					
					
					
			
					<div class="room-card  ml-3 mt-3">
							<img class="room-profile" width="250" src="https://cdn.pixabay.com/photo/2016/03/28/09/34/bedroom-1285156_960_720.jpg " alt="호텔">
							
							
							<div class="room-card-body">
								<div class="">싱글룸</div>
								<div class="">71,250원</div>
								<div class="">3성급</div>
								<a href="/user/reservepage/view" class="btn btn-primary ">예약하기</a>
							</div>
					</div>
					
					
					<div class="room-card  ml-3 mt-3">
							<img class="room-profile" width="250" src="https://cdn.pixabay.com/photo/2016/03/28/09/34/bedroom-1285156_960_720.jpg " alt="호텔">
							
							
							<div class="room-card-body">
								<div class="">더블룸</div>
								<div class="">71,250원</div>
								<div class="">3성급</div>
								<button id="reserveBtn" class="btn btn-primary mt-3" type="button" data-lodging-id="${lodging.id }">예약하기</button>
							</div>
					</div>
					<div class="room-card  ml-3 mt-3">
							<img class=""room-profile" width="250" src="https://cdn.pixabay.com/photo/2016/03/28/09/34/bedroom-1285156_960_720.jpg " alt="호텔">
							
							
							<div class="room-card-body">
								<div class="">트윈룸</div>
								<div class="">71,250원</div>
								<div class="">3성급</div>
								<button id="reserveBtn" class="btn btn-primary mt-3" type="button" data-lodging-id="${lodging.id }">예약하기</button>
							</div>
					</div>
					
					
					
					</div>
				
				
				
				
			
			</div>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
		
	</div>


</body>
</html>