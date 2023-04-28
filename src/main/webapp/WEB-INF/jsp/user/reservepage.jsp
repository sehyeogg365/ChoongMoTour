<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>         

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
	
</head>
<body>
	<div id = "wrap">
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="reserve-page">
				<h1 class="text-center">
					ChoongMo Tour Reserve Page
				</h1>
			
			
				<div class="reservepagecontents ">
					
					<div class=""><h2>ㅇㅇ호텔</h2></div><br>
					<div class=""><h3>더블 룸</h3></div>
					
					<div class="d-flex">
						<div class="">체크인 2023-05-01 15:00</div>
						<div class="ml-3">체크아웃 2023-05-01 11:00</div>
						
						
					
					</div>
					
					
					<div class="payselect mt-3">
						<div class=""> 결제수단을 선택하세요. </div>
						<select class="form-control col-5 mt-3" id="paySelector">
							
                            <option value="">결제수단</option>
                            <option value="kakao">카카오페이</option>
                            <option value="naver">네이버페이</option>
                            <option value="samsung">삼성페이</option>
                            <option value="card">카드</option>
                       
                 </select>
					
					</div>
					
					
					
					<div class="check-box">
						<label>전체 선택<input type="checkbox" id="allCheck"></label> <br>
				        <label>개인정보 활용 동의<input type="checkbox" name="check" value="check1"></label><br>
				        <label>서비스 이용 동의<input type="checkbox" name="check" value="check2"></label><br>
				        <label>마케팅 활용 동의<input type="checkbox" name="check" value="check3"></label>
					
					</div>
					
					
					<div class="text-center">
					
						<button id = "payBtn" type="button"  class="btn btn-danger col-8 ">결제하기</button>
					</div>
				</div>
			
			</div>
		
		
		
		
		</section>
	
	
	
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>
	<script>
	$(document).ready(function(){
		
		$("#payBtn").on("click", function(){
			
			
		});
		
		
		
	});
	
	
	</script>


</body>
</html>