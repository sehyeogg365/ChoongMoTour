<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 댓글화면</title>
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

	<!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	

</head>
<body>
	<div id = "wrap">
	
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<div class="comment-page">
			<h1 class="text-center">
				ChoongMo Tour Comment Page
			</h1>
		
		
			<div class="lodging-profile2 align-items-center">
					<img class="profile" width="" src="${lodging.imagePath } " alt="호텔">
					<c:choose>
						<c:when test = "${lodging.level eq '5성급' }">
							<h3 class="text-warning">${lodging.level }</h3><!-- 성급도 for문써서 해보기 -->
						</c:when>
						<c:when test = "${lodging.level eq '4성급' }">
							<h3 class="text-danger">${lodging.level }</h3><!-- 성급도 for문써서 해보기 -->
						</c:when>
						<c:when test = "${lodging.level eq '3성급' }">
							<h3 class="text-second">${lodging.level }</h3><!-- 성급도 for문써서 해보기 -->
						</c:when>
						<c:when test = "${lodging.level eq '2성급' }">
							<h3 class="text-success">${lodging.level }</h3><!-- 성급도 for문써서 해보기 -->
						</c:when>
						<c:when test = "${lodging.level eq '1성급' }">
							<h3 class="text-primary">${lodging.level }</h3><!-- 성급도 for문써서 해보기 -->
						</c:when>
					</c:choose>
				
				</div>
				<div class="text-center">
					<h2>${lodging.roomName }</h2>
				</div><br>
				
				<ul class="nav nav-tabs"><!-- div class tab도가능 -->
				  <li class="nav-item">
				    <a class="nav-link active" aria-current="page" href="/lodging/room/view?id=${lodging.id }">객실리스트</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="/lodging/commentlist/view?id=${lodging.id }">리뷰</a>
				  </li>
			
			
				</ul>
				
			
		
		<div class="comment-list">
		
			<div class="comment-box mt-3">
				
				<div class="comment">
					<div class="comment-profile">
						<img class="userprofile mt-3" width ="40" height="40"src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png">
					</div>
					<div class="comment-content ml-5">
						<div class="ml-3">재재재방문가능</div>
						<div class="ml-3 small text-secondary">트윈룸 이용자</div>
						<div class="ml-3 small">경치가 좋습니다.</div>
					</div>
			
				</div>
			
			</div>
			<div class="comment-box mt-3">
				
				<div class="comment">
					<div class="comment-profile">
						<img class="userprofile mt-3" width ="40" height="40"src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png">
					</div>
					<div class="comment-content ml-5">
						<div class="ml-3">재재재방문가능</div>
						<div class="ml-3 small text-secondary">트윈룸 이용자</div>
						<div class="ml-3 small">방이 넓어서 좋습니다..</div>
					</div>
				</div>
			
			</div>
			<div class="comment-box mt-3">
				
				<div class="comment">
					<div class="comment-profile">
						<img class="userprofile mt-3" width ="40" height="40"src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png">
					</div>
					<div class="comment-content ml-5">
						<div class="ml-3">재재재방문가능</div>
						<div class="ml-3 small text-secondary">더블룸 이용자</div>
						<div class="ml-3 small">방이꺠끗해서 좋습니다.</div>
					</div>
				</div>
			
			</div>
			<div class="comment-box mt-3">
				
				<div class="comment">
					<div class="comment-profile">
						<img class="userprofile mt-3" width ="40" height="40"src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png">
					</div>
					<div class="comment-content ml-5">
						<div class="ml-3">재재재방문가능</div>
						<div class="ml-3 small text-secondary">싱글룸 이용자</div>
						<div class="ml-3 small">직원들이 친절해서 좋습니다.</div>
					</div>
				</div>
			
			</div>
		
		</div>
		
		
		</div>
	
	
	
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<style>
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	</style>
	<script>
	//근데 댓글삭제도 아마 예약화면에서만 가능할텐데 잘모르겠다 이건.
	</script>

</body>
</html>