<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 관리자 마이페이지</title>
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
	<c:import url="/WEB-INF/jsp/include/adminheader.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="my-page">
				<h1 class="text-center">
					ChoongMo Tour Admin My Page
				</h1>
				
				
				<div class="mypagecontents d-flex">
				<aside class="aside1 col-3 ">
				
			
					
					<div>
						<h3><a href="/admin/mypage/view" class="text-dark">내 정보수정</a></h3>
					</div>
					<div>
						<h3><a href="#" class="text-dark">사용자 삭제</a></h3>
					</div>
					
				
				</aside>
				
				<section class="contents1 col-9">
					
					<div class="info-input-box">
					
						<label>프로필 사진 변경</label><br>
						<i id="imageIcon" class="bi bi-card-image image-icon-size"></i>
					
						<input type="file" name="file" id="fileInput">
						
						
						
						<c:choose>
						  <c:when test="${not empty userImagePath }"><!-- 있을때 -->
						  	<img class="userprofile" src="${userImagePath}">
						  </c:when>
						  <c:otherwise><!-- 없을때 -->
						  	<img class="userprofile" width ="40" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png">
						  </c:otherwise>
				 		 </c:choose>	
						
						<input type="password" id="passwordInput" placeholder="비밀번호" class="form-control mt-4">
						<input type="password" id="passwordConfirmInput" placeholder="비밀번호 확인" class="form-control mt-4">
						
						
							<input type="text" id="nameInput" placeholder="이름" class="form-control mt-4">
							<input type="text" id="emailInput" placeholder="이메일" class="form-control mt-4">
							<input type="text" id="nicknameInput" placeholder="닉네임" class="form-control mt-4">
							<input type="text" id="phoneNumberInput" placeholder="전화번호" class="form-control mt-4">
						<!-- ajax아직 안해서 에러 400에러 뜨나봄 -->
						<div class="text-center">
						<button id="updateBtn"class="btn btn-primary mt-3" type="button">수정 완료</button>
						</div>
					
					
					</div>
				</section>
					
			</div>
			
			</div>
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
		
	</div>
	<script>
	$(document).ready(function(){
		
		$("#updateBtn").on("click", function(){
			
			let password = $("#password").val();
			let passwordInput = $("#passwordInput").val();			
			let name = $("#nameInput").val();
			let email = $("#emailInput").val();
			let phoneNumber = $("#phoneNumberInput").val();
			
			if(password != passwordInput){
				alert("비밀번호가 다릅니다.");
				return ;
			}
			
			$.ajax({
				type:
				, url:
				, data:
				, success:function(data){
					
				}
				
				, error:function(){
					
				}
				
			});
			
			
			
			
		});
		
		
	});
	
	</script>
</body>
</html>