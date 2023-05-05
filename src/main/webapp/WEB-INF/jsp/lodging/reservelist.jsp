<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>         
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
				<aside class="aside1 col-2 ">
				
					<div>
						<h3><a href="/lodging/dibspage/view?id=${user.id }" class="text-dark">찜목록</a></h3>
					</div><!-- 아직 찜목록 레스트컨트롤러 비오 다오 매퍼 이런거 구현안해서 안 뜨는거니 안심하자. -->
					<div>
						<h3><a href="/lodging/reservelist/view?id=${user.id }" class="text-dark">예약내역</a></h2>
					</div>
					<div>
						<h3><a href="/user/mypage/view?id=${user.id }" class="text-dark">내 정보수정</a></h3>
					</div>
		
					
				
				</aside>
				
				<section class="contents1 col-10 ">
					<!-- 예약리스트 -->
					<label>예약목록</label>
					<div class="reservation-card-list d-flex justify-content-center flex-wrap ml-3 mt-3">
						<!-- 예약 카드 -->
						
						<div class="reservation-card ml-4 mt-3">
							<i class="bi bi-x-square d-flex justify-content-end"></i>
							<div class="reservation-profile">
								<img class="profile" width="" src="https://cdn.pixabay.com/photo/2016/03/28/09/34/bedroom-1285156_960_720.jpg " alt="호텔">
							</div>
							<div class="reservation-card-body">
								<div class="">ㅇㅇ호텔</div>
								<div class="">싱글룸</div>
								<div class="d-flex">
									<div class="">체크인 05.05 </div>
									<div class="">체크아웃 05.05 </div>				
								</div>
								<div class=""><a href="/lodging/room/view?id${lodging.id }">다시예약</a></div>
								
								
								<div class="text-center">
									<button id="commentModalBtn"class="btn btn-primary mt-3 btn-sm comment-btn" type="button">댓글달기</button>
								</div>
							</div>
						</div>
						<div class="reservation-card ml-4 mt-3">
							<i class="bi bi-x-square d-flex justify-content-end"></i>
							<div class="reservation-profile">
								<img class="profile" width="" src="https://cdn.pixabay.com/photo/2016/03/28/09/34/bedroom-1285156_960_720.jpg " alt="호텔">
							</div>							
							<div class="reservation-card-body">
								<div class="">△△호텔</div>
								<div class="">싱글룸</div>
								<div class="d-flex">
									<div class="">체크인 05.05 </div>
									<div class="">체크아웃 05.05 </div>				
								</div>
								<div class=""><a href="/lodging/room/view?id${lodging.id }">다시예약</a></div>
					
								
								<div class="text-center">
									<button id="commentModalBtn"class="btn btn-primary mt-3 btn-sm comment-btn" type="button">댓글달기</button>
								</div>
							</div>
						</div>
						<div class="reservation-card ml-4 mt-3">
							<i class="bi bi-x-square d-flex justify-content-end"></i>
							<div class="reservation-profile">
								<img class="profile" width="" src="https://cdn.pixabay.com/photo/2016/03/28/09/34/bedroom-1285156_960_720.jpg " alt="호텔">
							</div>							
							<div class="reservation-card-body">
								<div class="">xx호텔</div>
								<div class="">더블룸</div>
								<div class="d-flex">
									<div class="">체크인 05.05 </div>
									<div class="">체크아웃 05.05 </div>				
								</div>
								<div class=""><a href="/lodging/room/view?id${lodging.id }">다시예약</a></div>

								<div class="text-center">
									<button id="commentModalBtn"class="btn btn-primary mt-3 btn-sm comment-modal-btn" type="button" data-toggle="modal" data-target="#commentModal${room.id }" data-room-id="${room.id }">댓글달기</button>
								</div>
								
							</div>
						</div>
					
						
					
					</div>
					
				
				</section>
					
			</div>
				
				
				<!-- Button trigger modal -->
		
			<!-- 애초에 모달도 리스팅을 안했기에 당연히 안뜰수밖에.. -->
			<!-- Modal 도 댓글달기-->
			<div class="modal fade" id="moreModal${room.id }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			    	<div class="modal-header">
						<h5 class="modal-title">객실 댓글 달기</h5>
							        
					</div>	
				   <div class="modal-body text-center">
			       	<p></p>
			    	<p id="contentInput${room.id }">${room.content }</p>
			    	<p></p>
			       	
			       	
			      </div><!-- 객체화시켜야 하므로 아이디 부여 --><!-- 속성을 동적으로 추가할려면? -->
			      <div class="modal-footer">
					<a href="#" id="commentBtn">댓글달기</a> <!-- 동떨어진 하나의 태그기때문에 쓸수 있는정보가 암것도 없다. -->	        
					<button type="button" id="closeBtn "class="btn btn-secondary" data-dismiss="modal">닫기</button>
				 </div>
			   
			    </div>
			  </div>
			</div>	
				
				
				
				
				
				
			</div>
			
		
		</section>
	
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
		
	</div>
	
	<script>
	 $(document).ready(function() {
		 
		 //크게 사진위의 삭제버튼, 모달창의 댓글달기 
		 
		 $("#commentBtn").on("click", function(){
			 
		 });
		 
		 
 		$(".comment-modal-btn").on("click", function(){
			 
			 let id = $(this).data("room-id");
			 
			 let content = ("#contentInput" + id).val();
			 
			 
		 });
		 
		 
	 });
	
	</script>

</body>
</html>