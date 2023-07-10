<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 찜목록</title>
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
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
			<section class="contents d-flex justify-content-center">
				<div class="dibs-page">
					<h1 class="text-center pt-3 font-weight-bold">
						ChoongMo Tour Dibs Page
					</h1>
					
					<div class="dibspagecontents d-flex mx-5">
					<aside class="side-nav col-2 ">
						
					<ul class="nav flex-column">
						<li class="mt-3">
							<h4><a href="/lodging/dibspage/view?id=${user.id }" class="nav-list">찜목록</a></h4>
						</li>
						<li class="mt-3">
							<h4><a href="/lodging/reservelist/view?id=${user.id }" class="nav-list">예약내역</a></h4>
						</li>
						<li class="mt-3">
							<h4><a href="/user/mypage/view?id=${user.id }" class="nav-list">내 정보수정</a></h4>
						</li>
					
					</ul>
					
					
					</aside>
					<section class="contents1 col-10 ">
					
						
						
						<div class="dibs-card-list d-flex justify-content-center flex-wrap ml-3 mt-3">
					
					
							<c:forEach var="dibs" items="${dibsDetailList }">
							<div class="dibs-card  mt-3 ml-3 ">
								
								<div class="">
									
									<div class="dibspage-heart mr-3">														<!-- 근데 희안하게 여기  -->		
										<i class="undib-icon bi bi-heart-fill text-danger mt-2 ml-2" style="font-size :20px;" data-lodging-id= "${dibs.lodgingId}"></i>
									</div>
									<a href="/lodging/room/view?id=${dibs.lodgingId }" class="d-block dibs-profile">			                 <!-- 생각해보니 여기 lodgingId라 하는게 맞다. 왜냐면 숙소리스트서 추가할때 로징아이디로 추가한거니 -->							
														
										<img class="profile" width="" src="${dibs.imagePath }" alt="호텔">												
									</a>
								</div>
								
								<div class="dibs-card-body">
								<!--  	<div class="">로징아이디:${dibs.lodgingId }</div>-->
								<!--	<div class="">딥스아이디:${dibs.id }</div>	--><!-- 아예 딥스아이디는 안들어오는상황 -->
									<div class=""><a href="/lodging/room/view?id=${dibs.lodgingId }" class="text-dark"><b>${dibs.roomName }</b></a></div>
									<div class="text-secondary">${dibs.areaName }</div>
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
	$(document).ready(function(){
		
		//찜 해제 
		$(".undib-icon").on("click", function(){
			
			let id = $(this).data("lodging-id");
			
			//alert(id);//아까 삭제할떄 14 가 뜨고 삭제됐다.그말인즉슨 이제 딥스아이디도 잘들어오고있꼬 삭제할떄 lodgingId로 삭제하는게 또 맞다. 왜냐면 lodgingId로 추가했으니.
			
			$.ajax({
				
				type: "get"
				, url :"/lodging/undib"
				, data:{"lodgingId": id} // 여기선 id 가 맞다. 왜냐면 해당하는 딥스id를 의미하니
				, success:function(data){
					if(data.result =="success"){
						alert("찜 취소 성공");
						location.reload();
					} else {
						alert("찜 취소 실패");
					}
					
				}
				, error:function(){
					alert("찜 취소 오류");
					
				}
				
			});
			
		});
		
		
		
		
	});
	
	
	</script>
</body>
</html>