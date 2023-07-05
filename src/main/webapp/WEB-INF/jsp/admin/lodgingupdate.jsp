<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 관리자 숙소 수정</title>
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
			
			<div class="lodgingupdate-page">
			
				<h1 class="text-center">ChoongMo Tour Lodging Update Page</h1><!-- pt-3제거 -->
				
				<!-- 그냥 파일업로드는 수정 넣지말기 -->
				<!--  
				<i id="imageIcon" class="bi bi-card-image image-icon-size"></i>
				
				<input type="file" name="file" id="fileInput"><br>
				-->
				
					<!-- 프론트엔드 영역 부분 피드백은 딱 처음 들어왔을때 값들이 미리 입력 된상태에서 수정이되어야 함 메모게시판 처럼 그게 일반적인 경우 -->
					<div class="lodgingupdate-page-contents">
					<label class="ml-2 mt-2">이름</label>
					<input type="text" id="roomNameInput" value="${lodging.roomName }" placeholder="내용을 입력해주세요" class="form-control ml-2 mt-2 col-11" >
	
					<!-- c태그 넣으니  아예 안들어온다. 왜안될까 -->
					<select class="form-control col-5 ml-2 mt-4" id="areaSelector">
								
	                            <option value="${lodging.areaName }">${lodging.areaName }</option><!-- 굳이 여기부분은 중복안되게끔 나오게 하는거 수정안해도 되지만 옵션으로 해보기. -->
	                            <option value="seoul">서울</option>
	                            <option value="incheon">인천</option>
	                            <option value="gangwon">강원</option>
	                            <option value="gyeongsang">경상</option>
	                            <option value="jeolla">전라</option>
	                            <option value="busan">부산</option>
	                            <option value="jeju">제주</option>
	                 </select>
	                 
					<select class="form-control col-5 ml-2 mt-4" id="levelSelector">
								
	                            <option value="${lodging.level }">${lodging.level }</option>
	                            <option value="1성급">1성급</option>
	                            <option value="2성급">2성급</option>
	                            <option value="3성급">3성급</option>
	                            <option value="4성급">4성급</option>
	                            <option value="5성급">5성급</option>   
	                 </select>
	                 
					
					<div class="text-center my-3">
						<button id="updateBtn"class="btn btn-primary col-12 update-btn" type="button" data-lodging-id="${lodging.id }">수정 완료</button>
					</div>
				
				
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
		
		$(".update-btn").on("click", function(){//아마 class가아닌 id값을 받아와서 500에러가 뜨는건가?? 업데이트 버튼이 여러개이므로
			
			let id = $(this).data("lodging-id"); 
			
			let roomName = $("#roomNameInput").val();
			
			let areaName = $("#areaSelector").val();
				
			let	level = $("#levelSelector").val();
			
			if(roomName == ""){		
				alert("이름을 입력하세요.");
				return ;
			}
			if(areaName == ""){		
				alert("지역을 선택하세요.");
				return ;
			}
			if(level == ""){		
				alert("성급을 선택하세요.");
				return ;
			}
			
			//alert(id);//alert 해보니 아이디 값조차도 제대로 안들어오는 상황 인걸 확인할수 있다.
			//alert(roomName);//보아하니 id만 제대로 안들어오고있는상황
			//alert(areaName);
			//alert(level);
		
			$.ajax({
				type:"post"
				, url:"/lodging/update"
				, data:{"id":id,"roomName":roomName, "areaName":areaName, "level":level } //여기까지 바꾸니 이제 에러가 바뀌어서 나온다. Required request parameter 'id' for method parameter type int is not present 에서 Failed to convert value of type 'java.lang.String' to required type 'int';로
				, success:function(data){ //400에러면 요청문제(아작스영역) 스타벅스서 커피를 시켰는데 뜨거운 아이스아메리카노요 하는거를 연상해서 엉뚱한게 나온것. 
					if(data.result == "success") {// 어떤 거를 수행하고 있었는지, 어떤거를 봐서 어떤 오류가 생겼다고 알게되었는지. 등등을 잘 설명할것.
						location.href="/admin/main/view";
						alert("수정 성공");	
					} else {
						alert("수정 실패");
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