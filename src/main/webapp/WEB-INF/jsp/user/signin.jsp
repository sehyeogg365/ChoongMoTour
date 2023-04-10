<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>            
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 로그인</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
</head>
<body>
	<div id ="wrap" class="container">
	<header class="d-flex align-items-center justify-content-center">
			<h1 class="ml-3">ChoongMo Tour</h1>
			
			<div class="">
			
			</div>
		</header>
		<section class="contents bg-secondary d-flex justify-content-center">
			<div class="join-box">
				<h1 class="text-center">로그인</h1>
				<div class="d-flex">
					<input type="text" id="loginIdInput" placeholder="로그인 ID" class="form-control mt-4">
				</div>
			
				
			
					<input type="password" id="passwordInput" placeholder="비밀번호" class="form-control mt-4">
					
					<button type="button" class="btn btn-primary btn-block" id="joinBtn">가입</button>
			</div>
			
		</section>
	
	
	
		<footer class="">
			<div class="text-center pt-3">Copyright © choongmotour 2023</div>
		</footer>
	
	</div>
	<script>
	
	</script>
</body>
</html>