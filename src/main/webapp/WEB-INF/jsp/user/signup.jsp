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
		<header class="d-flex align-items-center justify-content-center">
			<h1 class="ml-3">ChoongMo Tour</h1>
			
			<div class="">
				님
			</div>
		</header>
		<section class="contents d-flex justify-content-center">
			<div class="join-box">
				<h1 class="text-center">회원 가입</h1>
				<div class="d-flex">
					<input type="text" id="loginIdInput" placeholder="로그인 ID" class="form-control mt-4">
					<button type="button" class="btn btn-primary btn-block" id="duplicateBtn">중복확인</button>
				</div>
				<div class="">
				
				</div>
					<input type="password" id="passwordInput" placeholder="비밀번호" class="form-control mt-4">
					<input type="password" id="passwordConfirmInput" placeholder="비밀번호 확인" class="form-control mt-4">
					<input type="text" id="nameInput" placeholder="이름" class="form-control mt-4">
					<input type="text" id="emailInput" placeholder="이메일" class="form-control mt-4">
					<input type="text" id="nicknameInput" placeholder="닉네임" class="form-control mt-4">
					<button type="button" class="btn btn-primary btn-block" id="joinBtn">가입</button>
			</div>
			
		</section>
		<footer class="">
			<div class="text-center pt-3">Copyright © choongmotour 2023</div>
		</footer>
		
	</div>
	
	<script>
		
	$(document).ready(function(){
		
		var isChecked = false;
		
		var isDuplicateId = true;//id중복여부	중복이되야 진행안되니 중복되는걸 기본값	
		
		
		$("#duplicateBtn").on("click", function(){
			let id = $("#loginIdInput").val();
			
			
			
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
		
		$("#joinBtn").on("click", function(){
			
			let id = $("#loginIdInput").val();
			let password = $("#passwordInput").val();
			let name = $("#nameInput").val();
			let email = $("#emailInput").val();
			let nickname = $("#nicknameInput").val();
			

			
			//유효성검사
			if(id == ""){
				alert("아이디를 입력해주세요.");
			}
			
			if(password == ""){
				alert("비밀번호를 입력해주세요.");
			}
			if(name == ""){
				alert("이름을 입력해주세요.");
			}
			if(email == ""){
				alert("이메일을 입력해주세요.");
			}
			if(nickname == ""){
				alert("닉네임을 입력해주세요.");
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