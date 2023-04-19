<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 관리자 객실 추가</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id = "wrap">
	<c:import url="/WEB-INF/jsp/include/adminheader.jsp"/>
		<section class="contents d-flex justify-content-center">
			
			<div class="roomcreate-page">
				<i id="imageIcon" class="bi bi-card-image image-icon-size"></i>
				
				<input type="file" name="file" id="fileInput"><br>
			
			
				<label>가격</label><input type="text" id="priceInput" placeholder="내용을 입력해주세요" class="form-control mt-4">원<br>
				
				 <label>사이즈</label> <br><!-- 클릭할때마다 텍스트 입력창이 떠야함 -->
			     <label>싱글<input type="checkbox" name="check" value="size1"></label><br>
			     <label>더블<input type="checkbox" name="check" value="size2"></label><br>
			     <label>트윈<input type="checkbox" name="check" value="size3"></label><br>
                 
                 <div class="d-none">
	                 <label>기본정보 (싱글)</label><br>
	                 <textarea rows="5" cols="100" id="contentInput" class="mt-4 form-control"></textarea>
                 </div>
                 
                 <div class="d-none">
	                 <label>기본정보 (더블)</label><br>
	                 <textarea rows="5" cols="100" id="contentInput" class="mt-4 form-control"></textarea>
                 </div>
                 
                 <div class="d-none">
	                 <label>기본정보 (트윈)</label><br>
	                 <textarea rows="5" cols="100" id="contentInput" class="mt-4 form-control"></textarea>
                 </div>
			
			
				<div class="text-center">
					<button id="createBtn"class="btn btn-primary" type="submit">입력 완료</button>
				</div>
				
			</div>
		</section>
	
	
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>
	<script>
	$(document).ready(function(){
		
		$("#createBtn").on("click", function(){
			
			let content = $("#contentInput").val(); 
			let file = $("#fileInput")[0];
			
			if(priceInput == ""){		
				alert("가격을 입력하세요.");
				return ;
			}
			if(content == "") {
				alert("내용을 입력하세요");
				return;
			}
			
		});
		
		
	});
	
	</script>

</body>
</html>