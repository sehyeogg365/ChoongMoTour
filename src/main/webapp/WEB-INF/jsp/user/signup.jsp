<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 회원가입</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="container">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="join-box">
				<h1 class="text-center pt-3">회원 가입</h1>
				<div class="d-flex">
					<input type="text" id="loginIdInput" placeholder="로그인 ID" class="form-control mt-4">
					<button type="button" class="btn btn-primary btn-block" id="duplicateBtn">중복확인</button>
				</div>
				<div class="small d-none" id="duplicateYes"><!-- 중복될시  -->
					중복된 아이디입니다.
				</div>
				<div class="small d-none" id="duplicateNo"><!-- 중복안될시  -->
					사용가능한 아이디입니다.
				</div>
				
				
					<input type="password" id="passwordInput" placeholder="비밀번호" class="form-control mt-4">
					<input type="password" id="passwordConfirmInput" placeholder="비밀번호 확인" class="form-control mt-4">
					<input type="text" id="nameInput" placeholder="이름" class="form-control mt-4">
					<input type="text" id="emailInput" placeholder="이메일" class="form-control mt-4">
					<input type="text" id="nicknameInput" placeholder="닉네임" class="form-control mt-4">
					<button type="button" class="btn btn-primary btn-block mt-3" id="joinBtn">가입</button>
			</div>
			
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
		
	</div>
	
	<script>
		
	$(document).ready(function(){
		
		var isChecked = false;
		
		var isDuplicateId = true;//id중복여부	중복이되야 진행안되니 중복되는걸 기본값	
		
		
		$("#duplicateBtn").on("click", function(){
			let id = $("#loginIdInput").val();
			
			if(id == "") {
				alert("아이디를 입력하세요.")
				return ;
			}
			
			$.ajax({
				type:"get"
				, url: "/user/duplicate_id"
				, data: {"loginId":id}
				, success:function(data){
					
					isChecked = true;
					isDuplicateId = data.is_duplicate;
					
					if(data.is_duplicate){
						$("#duplicateYes").removeClass("d-none");
						$("#duplicateNo").addClass("d-none");
					} else{
						$("#duplicateNo").removeClass("d-none");
						$("#duplicateYes").addClass("d-none");
					}
					
					
					}
				, error:function(){
					alert("중복확인 에러");
				}
					
					
				   
			  
				
			});
			
		});
		
		$("#joinBtn").on("click", function(){
			
			let id = $("#loginIdInput").val();
			let password = $("#passwordInput").val();
			let passwordConfirm = $("#passwordConfirmInput").val();			
			let name = $("#nameInput").val();
			let email = $("#emailInput").val();
			let nickname = $("#nicknameInput").val();
			

			
			//유효성검사
			if(id == ""){
				alert("아이디를 입력해주세요.");
				return ;
			}
			
			if(password == ""){
				alert("비밀번호를 입력해주세요.");
				return ;
			}
			if(password != passwordConfirm){
				alert("비밀번호가 일치 하지 않습니다.");
				return ;
			}
			
			if(name == ""){
				alert("이름을 입력해주세요.");
				return ;
			}
			if(email == ""){
				alert("이메일을 입력해주세요.");
				return ;
			}
			if(nickname == ""){
				alert("닉네임을 입력해주세요.");
				return ;
			}
		
			$.ajax({
				type: "post"
				, url: "/user/signup"
				, data:	{"loginId":id, "password": password, "name":name, "email":email, "nickname":nickname}
				, success:function(data){
						if(data.result="success"){
							alert("회원가입 성공");
							location.href = "/user/signin/view";
						} else{
							alert("회원가입 실패");
						}
					}
				, error:function(){
					alert("회원가입 오류");
				}
					
					
				   
			  
				
			});
			
			
		});
		
	});
	</script>
</body>
</html>