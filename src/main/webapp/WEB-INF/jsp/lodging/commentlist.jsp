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
		<section class="contents d-flex justify-content-center">
			<div class="comment-page">
			<h1 class="text-center">
				ChoongMo Tour Comment Page
			</h1>
		
			<div class="d-flex  mt-4">
					<div class="lodging-profile2">
						<img class="profile" width="" src="${lodging.imagePath } " alt="호텔">
					</div>
						
					
						<div class="ml-3">
							<div class="d-flex">
								<c:choose>
									<c:when test = "${lodging.level eq '5성급' }">
										<h3 class="text-warning">${lodging.level }</h3><!-- 성급도 for문써서 해보기 -->
									</c:when>
									<c:when test = "${lodging.level eq '4성급' }">
										<h3 class="text-danger">${lodging.level }</h3><!-- 성급도 for문써서 해보기 -->
									</c:when>
									<c:when test = "${lodging.level eq '3성급' }">
										<h3 class="text-secondary">${lodging.level }</h3><!-- 성급도 for문써서 해보기 -->
									</c:when>
									<c:when test = "${lodging.level eq '2성급' }">
										<h3 class="text-success">${lodging.level }</h3><!-- 성급도 for문써서 해보기 -->
									</c:when>
									<c:when test = "${lodging.level eq '1성급' }">
										<h3 class="text-primary">${lodging.level }</h3><!-- 성급도 for문써서 해보기 -->
									</c:when>
								</c:choose>
								<div class="ml-3">
									<h2 class="font-weight-bold">${lodging.roomName }</h2>
								</div>
							
							</div>
							<br>
							<div class="">
								<c:choose>
									<c:when test ="${lodging.areaName eq 'seoul'}">
										<h4 class="text-secondary">서울</h4>
									</c:when>
									<c:when test ="${lodging.areaName eq 'incheon'}">
										<h4 class="text-secondary">인천</h4>
									</c:when>
									<c:when test ="${lodging.areaName eq 'gangwon'}">
										<h4 class="text-secondary">강원</h4>
									</c:when>
									<c:when test ="${lodging.areaName eq 'gyeongsang'}">
										<h4 class="text-secondary">경상</h4>
									</c:when>
									<c:when test ="${lodging.areaName eq 'jeolla'}">
										<h4 class="text-secondary">전라</h4>
									</c:when>
									<c:when test ="${lodging.areaName eq 'busan'}">
										<h4 class="text-secondary">부산</h4>
									</c:when>
									<c:when test ="${lodging.areaName eq 'jeju'}">
										<h4 class="text-secondary">제주</h4>
									</c:when>
								</c:choose>
							
							</div>
						
						</div>
						
					
							
		
					
				</div><br>
				
				<br>
		
				
				<ul class="nav nav-tabs"><!-- div class tab도가능 -->
				  <li class="nav-item">
				    <a class="nav-link active" aria-current="page" href="/lodging/room/view?id=${lodging.id }">객실리스트</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">리뷰</a>
				  </li>
			
			
				</ul>
				
			
		
		<div class="comment-list">
		
			<c:forEach var="comment"  items = "${commentDetailList }">
			<div class="comment-box mt-3">
				
				<div class="comment">
				
				<div class="mr-3"><!-- 로그인한 사용자의 댓글일때만 보여주기  -->
					
				<c:choose>
					<c:when test="${userId eq comment.userId }">
						<div class="comment-delete">
							<i class="delete-btn bi bi-x-circle" data-room-id ="${comment.roomId }"></i>
						</div>
					</c:when>
					<c:otherwise>
						
					</c:otherwise>	
				</c:choose>	
					
				</div>
				
				
					<div class="comment-profile d-flex">
						<img class="userprofile mt-3 ml-3" width ="40" height="40"src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png">
						<div class="mt-4 ml-3">${comment.nickname }</div>
					</div>
					<div class="comment-content  ml-5 ">
						<div class="ml-3">${comment.roomId }</div>
						<div class="ml-3">${comment.userId }</div>
						
						<c:choose>
						
						<c:when test = "${comment.starpoint eq 1.0}">
							<div class="ml-3"><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/>(1.0)</div>
						</c:when>
						<c:when test = "${comment.starpoint eq 2.0}">
							<div class="ml-3"><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/>(2.0)</div>
						</c:when>
						<c:when test = "${comment.starpoint eq 3.0}">
							<div class="ml-3"><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/>(3.0)</div>
						</c:when>
						<c:when test = "${comment.starpoint eq 4.0}">
							<div class="ml-3"><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/>(4.0)</div>
						</c:when>
						<c:when test = "${comment.starpoint eq 5.0}">
							<div class="ml-3"><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/>(5.0)</div>
						</c:when>
						
						</c:choose>
						<div class="mt-3 ml-3 small text-secondary">${comment.size } 이용자</div>
						<div class="ml-3">${comment.content }</div>
						
						
						<c:choose>
							<c:when test= "${not empty comment.imagePath }">
								<div class="comment-image ml-3"><img width="400" height ="300"src="${comment.imagePath }"/></div>
							</c:when>
							<c:otherwise>
								<div class=""></div>
							</c:otherwise>
							
						</c:choose>
						
						<div class="ml-3 small"><fmt:formatDate value ="${comment.createdAt }" pattern ="yyyy년 MM월 dd일"/></div>
					</div>
			
				</div>
			
			</div>
			</c:forEach>

	
		
		</div>
		
		
		</div>
		</section>
	</div>

	
	
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>

	<style>
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	</style>
	<script>
	//근데 댓글삭제도 아마 예약화면에서만 가능할텐데 잘모르겠다 이건.
	$(document).ready(function(){
		$(".delete-btn").on("click", function(){
			
			let id = $(this).data("room-id");
			
			$.ajax({
				type:"get"
				, url:"/lodging/comment/delete"
				, data:{"roomId": id}
				, success:function(data){
					if(data.result == "success"){
						alert("댓글 삭제 성공");
						location.reload();
					} else {
						alert("댓글 삭제 실패");
					}
				}	
				, error:function(){
					alert("댓글 삭제 오류");
				}
				
				
			});
			
			
			
		});
		
		
	});
	
	</script>

</body>
</html>