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
	
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
			<section class="contents d-flex justify-content-center">
				<div class="dibs-page">
					<h1 class="text-center">
						ChoongMo Tour Dibs Page
					</h1>
					
					<div class="dibspagecontents d-flex mx-3">
					<aside class="aside1 col-2 ">
						
					<div>				
						<h3><a href="/lodging/dibspage/view?id=${user.id }" class="text-dark">찜목록</a></h3>
					</div>
					<div>
						<h3><a href="/lodging/reservelist/view?id=${user.id }" class="text-dark">예약내역</a></h2>
					</div>
					<div>
						<h3><a href="/user/mypage/view?id=${user.id }" class="text-dark">내 정보수정</a></h3>
					</div>
					
					
					</aside>
					<section class="contents1 col-10 ">
					
						<label>찜목록</label><br>
						
						<div class="dibs-card-list d-flex justify-content-center flex-wrap ml-3 mt-3">
					
					
							<c:forEach var="dibs" items="${dibsList }">
							<div class="dibs-card  ml-4 mt-3">
								
								<div class="dibs-profile">
									<i class="undib-icon bi bi-heart-fill text-danger d-flex justify-content-end " data-dibs-id= "${dibs.id	 }"></i>
									<img class="profile" width="" src="${dibs.imagePath }" alt="호텔">												
								</div>
								
								<div class="dibs-card-body">
									<div class=""><a href="/lodging/room/view?id=${dibs.lodgingId }" >${dibs.roomName }</a></div>
									
									<div class="">${dibs.price }</div>
						
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
	<script>
	$(document).ready(function(){
		
		//찜 해제 
		$(".undib-icon").on("click", function(){
			
			let id = $(this).data("dibs-id");
			
			alert(id);//undefined되는상황 역시나 lodgingId가 안불러와지고 있다.
			
			$.ajax({
				
				type: "get"
				, url :"/lodging/undibbasket"
				, data:{"id":id}
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