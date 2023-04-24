<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 예약목록</title>
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
			<div class="reservelist-page">
				<h1 class="text-center">
					ChoongMo Tour ReserveList
				</h1>
				
				<div class="mypagecontents d-flex">
				<aside class="aside1 col-4 bg-success">
				
					<div>
						<h2><a href="/user/dibspage/view" class="text-dark">찜목록</a></h2>
					</div>
					<div>
						<h2><a href="/user/reservelist/view" class="text-dark">예약내역</a></h2>
					</div>
					<div>
						<h2><a href="/user/mypage/view" class="text-dark">내 정보수정</a></h2>
					</div>
		
					
				
				</aside>
				
				<section class="contents1 col-8 bg-warning">
					<!-- 예약리스트 -->
					<div class="d-flex justify-content-center flex-wrap">
						<!-- 예약 카드 -->
						
						<div class="reservation-card">
							<img class="" width="" src="">
							<button type="button" class="btn btn-primary btn-block mt-3" id="reviewBtn">리뷰쓰기</button>
						</div>
						
						<div class="reservation-card">
							<img class="" width="" src="">
							<button type="button" class="btn btn-primary btn-block mt-3" id="reviewBtn">리뷰쓰기</button>
						</div>
						
						<div class="reservation-card">
							<img class="" width="" src="">
							<button type="button" class="btn btn-primary btn-block mt-3" id="reviewBtn">리뷰쓰기</button>
						</div>
						
						<div class="reservation-card">
							<img class="" width="" src="">
							<button type="button" class="btn btn-primary btn-block mt-3" id="reviewBtn">리뷰쓰기</button>
						</div>
					
						
					
					</div>
					
				
				</section>
					
			</div>
				
				
				
				
				
				
				
				
				
			</div>
			
		
		</section>
	
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
		
	</div>

</body>
</html>