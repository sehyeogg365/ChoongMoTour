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
				<h1 class="text-center">
					ChoongMo Tour ReserveList
				</h1>
				
				<div class="reservelistcontents d-flex mx-3">
				<aside class="side-nav col-2 ">
				
				<ul class="nav">
						<li class="mt-3">
							<h4><a href="/lodging/dibspage/view?id=${user.id }" class="nav-list">찜목록</a></h4>
						</li >
						<li class="mt-3">
							<h4><a href="/lodging/reservelist/view?id=${user.id }" class="nav-list">예약내역</a></h4>
						</li>
						<li class="mt-3">
							<h4><a href="/user/mypage/view?id=${user.id }" class="nav-list">내 정보수정</a></h4>
						</li>
					
				</ul>
		
					
				
				</aside>
				
				<section class="contents1 col-10 ">
					<!-- 예약리스트 -->
					
					<div class="reservation-card-list d-flex justify-content-center flex-wrap ml-3 mt-3">
						<!-- 예약 카드 -->
						
						
						
						<c:forEach var="reserve" items="${reserveDetailList }">
						<div class="reservation-card ml-4 mt-4">
						
							<div class="">
							
									<div class="x mr-3">
										<i class="x-btn bi bi-x-circle " style="font-size :20px;" data-room-id ="${reserve.roomId }" ></i>
									</div>
								
								<a href="/lodging/room/view?id=${reserve.lodgingId }" class="reservation-profile">
									
									<img class="profile" width="" src="${reserve.imagePath } " alt="호텔">
								</a>		
							</div>
												
							<div class="reservation-card-body">
								<div class=""><strong>${reserve.roomName }</strong></div>
								<c:choose>
									<c:when test="${reserve.size eq 'singleroom' }">
										<div class=""><strong>싱글룸</strong></div>
									</c:when>
									<c:when test="${reserve.size eq 'doubleroom' }">
										<div class=""><strong>더블룸</strong></div>
									</c:when>
									<c:when test="${reserve.size eq 'twinroom' }">
										<div class=""><strong>트윈룸</strong></div>
									</c:when>
									<c:otherwise>
										<div class="">${reserve.size }</div>
									</c:otherwise>
								</c:choose>	
								<div class="d-flex justify-content-between mt-2">
									<div class="">
										<div class="">체크인  </div>
										<div class=""><fmt:formatDate value= "${reserve.startDate }" pattern ="yyyy년 MM월 dd일"/></div>
									</div>
									
									<div class="">
										<div class=""></div><br>
										<div class="">~</div>
									</div>
									<div class="">
										<div class="">체크아웃 </div>	
										<div class=""> <fmt:formatDate value= "${reserve.endDate }" pattern ="yyyy년 MM월 dd일"/></div>			
									</div>
								</div>
								<div class="text-center mt-2"><a href="/lodging/room/view?id=${reserve.lodgingId }">다시예약</a></div>
					
								
								<div class="text-center">
									<button id="commentmodalBtn"class="btn btn-primary mt-2 btn-sm comment-btn" type="button" data-toggle="modal" data-target="#commentModal${reserve.lodgingId }" data-room-id="${reserve.roomId }">댓글달기</button>
								</div>
							</div>
						</div>
						
							
					<!-- Button trigger modal -->
			
				<!-- 애초에 모달도 리스팅을 안했기에 당연히 안뜰수밖에.. -->
				<!-- Modal 도 댓글달기-->
			
			 
				<div class="modal fade" id="commentModal${reserve.lodgingId }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document">
				    <div class="modal-content">
				    	<div class="modal-header">
							<h5 class="modal-title">객실 댓글 달기</h5>
							<h4>${reserve.roomName }</h4>
							<h4>${reserve.size }</h4>
							
						</div>	
					   <div class="modal-body text-center">
				       	<div class="imageInput">
				       		<i id="imageIcon" class="bi bi-card-image image-icon-size"></i>
					
							<input type="file" name="file" id="fileInput${reserve.lodgingId }" class="" >
				       	</div>
				       	
				       	<input type="text" id="sizeInput${reserve.lodgingId }" value="${reserve.size }" class="form-control" readonly>
				       
				       	
				    	<div class="mt-3">
				    		<textarea rows="5" cols="100" id="contentInput${reserve.lodgingId }" class="form-control content-input"></textarea>
				    	</div>
				    	
				    	<div>
					    	<select style="width:200px;" class="form-control mt-3" id ="starpointSelector${reserve.lodgingId }">
					    		<option>별점 선택</option>
					    		<option value="1.0" title ="https://icons.iconarchive.com/icons/github/octicons/256/star-16-icon.png">★☆☆☆☆</option>
					    		<option value="2.0" title="">★★☆☆☆</option>
					    		<option value="3.0" title="">★★★☆☆</option>
					    		<option value="4.0" title="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FKineh%2FbtqKbVIlGVb%2F3cd1u2698gFFlAHqztlhk1%2Fimg.jpg">★★★★☆</option>
					    		<option value="5.0" title="">★★★★★</option>
					    		
					    	</select>
				       	</div>
				       	
				      </div><!-- 객체화시켜야 하므로 아이디 부여 --><!-- 속성을 동적으로 추가할려면? -->
				      <div class="modal-footer d-flex justify-content-between">
						<button type="button" id="commentBtn" class="comment-modal-btn btn btn-primary" data-lodging-id="${reserve.lodgingId }">댓글달기</button> <!-- 동떨어진 하나의 태그기때문에 쓸수 있는정보가 암것도 없다. -->	        
						<button type="button" id="closeBtn" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					 </div>
				   
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
		// $("body select").msDropDown();
		 //크게 사진위의 삭제버튼, 모달창의 댓글달기 
		 
		 $(".comment-modal-btn").on("click", function(){
			 let id = $(this).data("lodging-id");	
			 let size = $("#sizeInput" + id).val();
			 let file = $("#fileInput" + id)[0];
			 let content = $("#contentInput" + id).val();
			 let starpoint = $("#starpointSelector" + id).val();
			 
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
			 
			 alert(id); 
			 alert(size);
			 alert(file); 
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
		 

 		
 		$(".x-btn").on("click", function(){
 			
 			let id = $(this).data("room-id");
 			
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