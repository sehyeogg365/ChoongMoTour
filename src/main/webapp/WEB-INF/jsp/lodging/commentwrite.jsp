<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 댓글 작성 창</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
</head>
<body>
	<div id = "">
		<section class="contents d-flex justify-content-center ">
			<div class="commentwrite-page ">
				<h1 class="text-center pt-3 font-weight-bold ">
					ChoongMo Tour Comment Write Page
				</h1>
				<div class="commentwritepagecontents ">
					 <div class="modal-content">
				    	<div class="modal-header d-flex justify-content-between align-items-center">
							<h5 class="modal-title">객실 댓글 달기</h5>
							<h4>${lodging.roomName }</h4>
							<h4 id="sizeInput">${room.size }</h4>
						</div>	
					   <div class="modal-body text-center">
				       	<div class="imageInput d-flex justify-content-start">
				       		<i id="imageIcon" class="bi bi-card-image image-icon-size"></i>
							<input type="file" name="file" id="fileInput" class="" >
				       	</div>
				       	<!-- 2024-02-04 수정 내용 .text()로해보기 -->
				       	<!--  
				       	<input type="text" id="sizeInput" value="${room.size }" class="form-control mt-3 d-none" readonly>
				       -->
				    	<div class="mt-3">
				    		<textarea rows="5" cols="100" id="contentInput" class="form-control content-input"></textarea>
				    	</div>
				    	<div>
					    	<select style="width:200px;" class="form-control mt-3" id ="starpointSelector">
					    		<option>별점 선택</option>
					    		<option value="1.0" title="">★☆☆☆☆</option>
					    		<option value="2.0" title="">★★☆☆☆</option>
					    		<option value="3.0" title="">★★★☆☆</option>
					    		<option value="4.0" title="">★★★★☆</option>
					    		<option value="5.0" title="">★★★★★</option>
					    	</select>
				       	</div>
				      </div><!-- 객체화시켜야 하므로 아이디 부여 --><!-- 속성을 동적으로 추가할려면? -->
				      <div class="modal-footer d-flex justify-content-center">
						<button type="button" id="commentBtn" class="btn btn-primary" data-lodging-id="${lodging.id }">댓글달기</button> <!-- 동떨어진 하나의 태그기때문에 쓸수 있는정보가 암것도 없다. -->
					  </div>
				    </div>
				</div>
			</div>
		</section>
	</div>
	<style>
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	</style>

	<script>
	$(document).ready(function(){
		$("#commentBtn").on("click", function(){
			 let id = $(this).data("lodging-id");	
			 let size = $("#sizeInput").text();//굳이 객체화 안해도 댓글은 저장이된다. 2024-02-04 수정 내용 .text()적용
			 let file = $("#fileInput")[0];
			 let content = $("#contentInput").val();
			 let starpoint = $("#starpointSelector").val();
			 
			 var result = confirm("댓글 작성 하시겠습니까?");
	       	 
		     if(result){
				//alert(""); 아무것도 안쓰면 바로 추가성공이 뜬다.
			 } else {
				return ;
			 }

			 if(content == ""){
				 alert("댓글을 입력하세요");
				 return ;				 
			 }
			 
			 if(size == ""){
				 alert("사이즈를 입력하세요");
				 return ;
			 }
			 
			 if(starpoint == ""){
				 alert("별점을 입력하세요");
				 return ;
			 }
			 
			 //alert(id); //O
			 //alert(size);//O 그냥 상관없이 맨앞에값만 불러와짐 
			 //alert(file); //O
			 //alert(content); //O
			 //alert(starpoint); //O 
			 
			 var formData = new FormData();
			 
			 formData.append("lodgingId", id);
			 formData.append("size", size);			 
			 formData.append("file", file.files[0]);
			 formData.append("content", content);
			 formData.append("starpoint", starpoint);

			 $.ajax({
				type:"post"
				, url : "/lodging/comment/create"
				, data: formData//파일이 포함되어있는경우 일반적인 형태:{}로는 전달안된다고 함. 위의 formData.append("file", file.files[0]);이 전달안되서.
				, enctype :"multipart/form-data"// 파일 업로드 필수
				, processData:false// 파일 업로드 필수
				, contentType:false// 파일 업로드 필수
				, success:function(data){
					if(data.result == "success"){
						alert("댓글 입력 성공");
						location.href="/lodging/reservelist/view";
						window.close();
					} else {
						alert("댓글 입력 실패");
					}
				} 
				, error:function(){
					alert("댓글 입력 에러");
				}
			 });
		 });
	});
	</script>
</body>
</html>