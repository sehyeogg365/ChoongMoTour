<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 메인화면</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
</head>
<body>
	<div id ="wrap">

	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			
			<div class="main-page">
				<h1 class="text-center">
					ChoongMo Tour Main Page
				</h1>
				
				<!-- 이미지 서울, 인천, 강원, 전라, 부산, 제주 리스트 -->
				<!-- 그다음 각각 7개의 페이지를 만드는게 아닌 해당 링크를 클릭했을시 특정지역 데이터(숙소)만 보여지게 해야 함 그렇게 하려면 메모게시판 처럼 지역을 파라미터를 사용해서 해볼것.-->
				<div class="box-list d-flex justify-content-center flex-wrap">
					<div class="box ml-3">
						<img class="profile" width = "250" src="https://cdn.pixabay.com/photo/2022/09/16/17/07/namsan-tower-7459173_960_720.jpg" alt="서울">
						
						
					</div>
						<div class=""><a href="/lodging/list/view?area_name=seoul">서울</a></div>
					
					<div class="box ml-3">
						<img class="profile" width = "250" src="https://cdn.pixabay.com/photo/2021/08/21/07/55/south-korea-6562089_960_720.jpg" alt="인천">
						
					</div>
						<div class=""><a href="/lodging/list/view?area_name=incheon">인천</a></div>
					
					<div class="box ml-3">
						<img class="profile" width = "250" src="https://cdn.pixabay.com/photo/2015/09/26/05/07/mt-seoraksan-958643_960_720.jpg" alt="강원">
						
					</div>
						<div class=""><a href="/lodging/list/view?area_name=gangwon">강원</a></div>
					
					<div class="box ml-3">
						<img class="profile" width = "250" src="https://cdn.pixabay.com/photo/2020/05/24/11/56/to-5213925_960_720.jpg" alt="경상">
						
					</div>
					 	<div class=""><a href="/lodging/list/view?area_name=gyeongsang">경상</a></div>
						
					<div class="box ml-3">
						<img class="profile" width = "250" src="https://cdn.pixabay.com/photo/2018/08/23/22/18/jeonju-3626873_960_720.jpg" alt="전라">
						
					</div>
						<div class=""><a href="/lodging/list/view?area_name=jeolla">전라</a></div>
					
					<div class="box ml-3">
						<img class="profile" width = "250" src="https://cdn.pixabay.com/photo/2016/10/17/07/53/busan-night-scene-1747130_960_720.jpg" alt="부산">
						
					</div>
						<div class=""><a href="/lodging/list/view?area_name=busan">부산</a></div>
					
					<div class="box ml-3">
						<img class="profile" width = "250" src="https://cdn.pixabay.com/photo/2017/10/15/13/54/doll-2853763_960_720.jpg" alt="제주">
						
					</div>
						<div class=""><a href="/lodging/list/view?area_name=jeju">제주</a></div>

				</div>
				
				
				<!-- 그외에 메인페이지 추가할 내용? -->
				
			</div>
			
		</section>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>
</body>
</html>