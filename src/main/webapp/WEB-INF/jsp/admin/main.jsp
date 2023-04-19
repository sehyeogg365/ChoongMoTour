<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 관리자 메인화면</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id = "wrap">
	<c:import url="/WEB-INF/jsp/include/adminheader.jsp"/>
		<section class="contents d-flex justify-content-center">
		
			<div class="main-page">
				<h1 class="text-center">
					ChoongMo Tour Admin Main Page
				</h1>
			
			<div class="text-center">
				<a href="/admin/lodging/create/view" class="btn btn-primary col-8">추가하기</a>
			</div>
			
			<!-- 게시글 카드 리스트 -->
				<!-- c태그 반복문 활용   -->
			<div class="card-list d-flex justify-content-center flex-wrap mt-3">
				<!-- 게시글 카드 -->
				<div class="card ml-3 mt-3">
					<img class="profile" width = "400" src="https://cdn.pixabay.com/photo/2016/03/28/09/34/bedroom-1285156_960_720.jpg" alt="호텔">
					
					<div class="">ㅇㅇ호텔</div>
					
					<div class="">1성급</div>
					
					<div class="d-flex justify-content-between">
						<a href="/admin/lodging/update/view" class="btn btn-primary">수정하기</a>
						<a href="/admin/room/create/view" class="btn btn-primary">객실추가하기</a>					
						<a href="/admin/lodging/delete/view" class="btn btn-danger">삭제하기</a>
					</div>
										
				</div>
				
				<div class="card ml-3 mt-3">
					<img class="profile" width = "400" src="https://cdn.pixabay.com/photo/2016/03/28/09/34/bedroom-1285156_960_720.jpg" alt="호텔">
					
					<div class="">ㅇㅇ호텔</div>
					
					<div class="">2성급</div>
					
					<div class="d-flex justify-content-between">
						<a href="/admin/lodging/update/view?room_name" class="btn btn-primary">수정하기</a>
						<a href="/admin/room/create/view?room_name" class="btn btn-primary">객실추가하기</a>
						<a href="/admin/lodging/delete/view?room_name" class="btn btn-danger">삭제하기</a>
					</div>
										
				</div>
				
				<div class="card ml-3 mt-3">
					<img class="profile" width = "400" src="https://cdn.pixabay.com/photo/2016/03/28/09/34/bedroom-1285156_960_720.jpg" alt="호텔">
					
					<div class="">△△호텔</div>
					
					<div class="">3성급</div>
					
					<div class="d-flex justify-content-between">
						<a href="/admin/lodging/update/view?room_name" class="btn btn-primary">수정하기</a>
						<a href="/admin/room/create/view?room_name" class="btn btn-primary">객실추가하기</a>
						<a href="/admin/lodging/delete/view?room_name" class="btn btn-danger">삭제하기</a>
					</div>
										
				</div>
				
				<div class="card ml-3 mt-3">
					<img class="profile" width = "400" src="https://cdn.pixabay.com/photo/2016/03/28/09/34/bedroom-1285156_960_720.jpg" alt="호텔">
					
					<div class="">ㅇㅇ호텔</div>
					
					<div class="">4성급</div>
					
					<div class="d-flex justify-content-between">
						<a href="/admin/lodging/update/view?room_name" class="btn btn-primary">수정하기</a>
						<a href="/admin/room/create/view?room_name" class="btn btn-primary">객실추가하기</a>
						<a href="/admin/lodging/delete/view?room_name" class="btn btn-danger">삭제하기</a>
					</div>
										
				</div>
				
			
				
				
			
			
			
			</div>
			
			</div>
		
		
		</section>

	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
</body>
</html>