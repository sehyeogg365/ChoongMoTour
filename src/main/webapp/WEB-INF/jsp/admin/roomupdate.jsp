<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 관리자 객실 수정</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

	<!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
</head>
<body>
	<div id = "wrap">
	<c:import url="/WEB-INF/jsp/include/adminheader.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="roomupdate-page">
			
				<h1 class="text-center pt-3">관리자 객실 수정</h1>
				
				<!-- 생각해보니 여기도 어드민 메인페이지처럼 roomList를 리스팅해서 불러오는게 맞는거 같긴하다.  -->
				<!-- 굳이 셀렉터가 아닌 다른 양상으로. -->
				
				<div class="roomupdate-page-contents">
				<div class="">${lodging.roomName }</div>
				<table class="table">
					<thead>
						<tr>
						
							<th>사이즈</th>
							<th>가격</th>
							<th>정보</th>
							<th></th>
						</tr>
					</thead>
					
					<tbody>
					
					<c:forEach var="room" items="${roomList }">
						<tr>
							
							<td><select class="form-control size-selector" id="sizeSelector${room.id }">
							
		                            <option value="${room.size }">"${room.size }"</option><!-- 알고보니 꺾새 안에 안써서 안뜬거였다. ㅡㅡ -->
		                            <option value="singleroom">싱글</option>
		                            <option value="doubleroom">더블</option>
		                            <option value="twinroom">트윈</option>
                       
                 				</select>
                 			</td>
							<td><input type="text" id="priceInput${room.id }" value="${room.price }" class="form-control price-input"></td>
							<td><textarea rows="5" cols="100" id="contentInput${room.id }" class="form-control content-input">${room.content }</textarea></td>
							<td><button id = "updateBtn" type="button"  class="btn btn-primary update-btn btn-sm" data-room-id="${room.id }">수정하기</button></td>
						</tr>
						
					</c:forEach>
					</tbody>
				
				
				</table>
                 
                 
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
		
		//var ths = $(ths);
		
		//ths.parents("");
		
		//var id = "id"; // 이거굳이 넣어야하나?
		
		
		
		$(".update-btn").on("click", function(){
			
			let id = $(this).data("room-id");
			
			let price = $("#priceInput" + id).val();
			
			let size = $("#sizeSelector" + id).val();
			
			let content = $("#contentInput" + id).val(); 
				
			
			
			if(price == ""){		
				alert("가격을 입력하세요.");
				return ;
			}
			if(size == ""){		
				alert("사이즈를 선택하세요.");
				return ;
			}
			if(content == ""){		
				alert("내용설명을 입력하세요.");
				return ;
			}		
			
			//alert(id);//O
			//alert(price);//O
			//alert(size);//O
			//alert(content);//O
	
			$.ajax({
				type:"post"
				, url:"/lodging/room/update"//404에러 여기앞에다가 또 /lodging을 안써서 404error
				, data:{"id": id, "price":price, "size":size, "content":content}
				, success:function(data){
					if(data.result == "success"){
						location.reload();
						alert("수정 성공");
					} else{
						alert("수정 실패")
					}
					
				}
				, error:function(){
					alert("수정 에러");
				}
				
				
				
			});
			
			
		});

		
		
	});
	
	</script>
</body>
</html>