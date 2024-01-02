<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 예약목록</title>
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
	<div id = "wrap">
	
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="reservelist-page">
				<h1 class="text-center pt-3 font-weight-bold">
					ChoongMo Tour ReserveList
				</h1>
				
				<div class="reservelistcontents d-flex mx-5">
					<aside class="side-nav col-2 ">
					
					<ul class="nav flex-column">
						<li class="nav-item mt-2">
							<h5><b><a href="/lodging/dibspage/view?id=${user.id }" class="nav-link text-white">찜목록</a></b></h5>
						</li>
						<li class="nav-item mt-2">
							<h5><b><a href="/lodging/reservelist/view?id=${user.id }" class="nav-link text-primrary">예약내역</a></b></h5>
						</li>
						<li class="nav-item mt-2">
							<h5><b><a href="/user/mypage/view?id=${user.id }" class="nav-link text-white">내 정보수정</a></b></h5>
						</li>		
					</ul>
			
						
					
					</aside>
				
				<section class="contents1 col-10 ">
					<!-- 예약리스트 -->
					
					<div class="reservation-card-list d-flex justify-content-center flex-wrap ml-3 mt-3">
						<!-- 예약 카드 -->			
						
						<c:forEach var="reserve" items="${reserveDetailList }">
						<div class="reservation-card ml-3 mt-3">
						
							<div class="">
							
								<div class="x mr-3">
									<i class="x-btn bi bi-x-circle mt-2 ml-2" style="font-size :20px;" data-room-id ="${reserve.roomId }" ></i>
								</div>
								
								<a href="/lodging/room/view?id=${reserve.lodgingId }" class="reservation-profile">
									
									<img class="profile" width="" src="${reserve.imagePath } " alt="호텔">
								</a>		
							</div>
												
							<div class="reservation-card-body">
								<div class="d-flex justify-content-center mt-2"><strong>${reserve.roomName }</strong>
								<c:choose>
									<c:when test="${reserve.size eq 'singleroom' }">
										<div class="text-secondary ml-2"><strong>싱글룸</strong></div>
									</c:when>
									<c:when test="${reserve.size eq 'doubleroom' }">
										<div class="text-secondary ml-2"><strong>더블룸</strong></div>
									</c:when>
									<c:when test="${reserve.size eq 'twinroom' }">
										<div class="text-secondary ml-2"><strong>트윈룸</strong></div>
									</c:when>
									<c:otherwise>
										<div class="text-secondary ml-2">${reserve.size }</div>
									</c:otherwise>
								</c:choose>	
								</div>
								<div class="d-flex justify-content-center mt-2">
									<div class="">
										<div class="text-secondary">체크인  </div>
										<div class=""><fmt:formatDate value= "${reserve.startDate }" pattern ="yyyy년 MM월 dd일"/></div>
									</div>
									
									<div class="mx-2">
										<br>
										<div class="">~</div>
									</div>
									<div class="">
										<div class="text-secondary">체크아웃 </div>	
										<div class=""> <fmt:formatDate value= "${reserve.endDate }" pattern ="yyyy년 MM월 dd일"/></div>			
									</div>
								</div>
								<div class="text-center mt-2"><a href="/lodging/room/view?id=${reserve.lodgingId }" class="text-dark">다시예약</a></div>
					
								
								<div class="text-center my-2">
									<a href="/lodging/commentwrite/view?lodgingId=${reserve.lodgingId }&roomId=${reserve.roomId}" class="btn btn-sm btn-primary" onclick="window.open('/lodging/commentwrite/view?lodgingId=${reserve.lodgingId }&roomId=${reserve.roomId}','new','scrollbars=yes,resizable=no width=600 height=600, left=0,top=0');return false">댓글달기</a>
									<!-- <button id="commentmodalBtn"class="btn btn-primary mt-2 btn-sm comment-btn" type="button" data-toggle="modal" data-target="#commentModal${reserve.roomId }" data-room-id="${reserve.roomId }">댓글달기</button> -->
								</div>
							</div>
						</div>

						</c:forEach>	
					
					</div>
					
				
				</section>
					
			</div>
				
		
			</div>
			
		
		</section>
	
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
		
	</div>
	<style>
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	</style>
	<script>
	 $(document).ready(function() {
		//css 클릭시 색변화
		
		
		 //크게 사진위의 삭제버튼, 모달창의 댓글달기 
		 
		 /*
		 $(".comment-modal-btn").on("click", function(){
			 let id = $(this).data("lodging-id");	
			 let size = $("#sizeInput").val();//굳이 객체화 안해도 댓글은 저장이된다.
			 let file = $("#fileInput")[0];
			 let content = $("#contentInput").val();
			 let starpoint = $("#starpointSelector").val();
			 
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
			 
			 alert(id); //O
			 alert(size);//X 그냥 상관없이 맨앞에값만 불러와짐 
			 alert(file); //X
			 alert(content); //X
			 alert(starpoint); //X 
			 
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
						location.reload();
					} else {
						alert("댓글 입력 실패");
						
					}
					
				} 
				, error:function(){
					alert("댓글 입력 에러");
					
				}
				
				
			 });
			 
			 
			 
		 });
		 
		 */

 		
 		$(".x-btn").on("click", function(){
 			
 			let id = $(this).data("room-id");
 			
 			var result = confirm("예약취소 하시겠습니까?");
			
			if(result){
				//alert(""); 아무것도 안쓰면 바로 추가성공이 뜬다.
			} else {
				return ;
			}
 			
 			
 			
 			$.ajax({
 				type: "get"
 				, url : "/lodging/deletereserve"
 				, data:{"roomId" : id}
 				, success:function(data){
 					if(data.result =="success"){
						alert("예약 취소 성공");
						location.reload();
					} else {
						alert("예약 취소 실패");
					}
 				}
 				, error:function(){
					alert("예약 취소 오류");
					
				}
 				
 				
 			});
 			
 			
 			
 		});
		 
		 
	 });
	
	</script>

</body>
</html>