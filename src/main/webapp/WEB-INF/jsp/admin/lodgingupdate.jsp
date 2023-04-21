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
	
</head>
<body>
	<div id = "wrap">
	<c:import url="/WEB-INF/jsp/include/adminheader.jsp"/>
		<section class="contents d-flex justify-content-center">
			
			<div class="lodgingupdate-page">
			
				<h1 class="text-center pt-3">관리자 숙소 수정</h1>
				
				
				<i id="imageIcon" class="bi bi-card-image image-icon-size"></i>
				
				<input type="file" name="file" id="fileInput"><br>
				
				<label>이름</label><input type="text" id="roomNameInput" placeholder="내용을 입력해주세요" class="form-control mt-4"><br>

			
				<select class="form-control col-5 mt-3" id="areaSelector">
							
                            <option value="">지역</option>
                            <option value="seoul">서울</option>
                            <option value="inchecon">인천</option>
                            <option value="gangwon">강원</option>
                            <option value="gyeongsang">경상</option>
                            <option value="jeolla">전라</option>
                            <option value="busan">부산</option>
                            <option value="jeju">제주</option>
                 </select>
                 
				<select class="form-control col-5 mt-3" id="levelSelector">
							
                            <option value="">등급</option>
                            <option value="1성급">1성급</option>
                            <option value="2성급">2성급</option>
                            <option value="3성급">3성급</option>
                            <option value="4성급">4성급</option>
                            <option value="5성급">5성급</option>   
                 </select>
                 
                 
                 
				
				<div class="text-center">
					<button id="updateBtn"class="btn btn-primary" type="submit">수정 완료</button>
				</div>
			
			
			
			</div>
		
		
		</section>
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script>
	$(document).ready(function(){
		
		$("#updateBtn").on("click", function(){
			
			let roomName = $("#roomNameInput").val();
			
			let areaName = $("#areaSelector").val();
				
			let	level = $("#levelSelector").val();
			
			let file = $("#fileInput")[0];
			
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
			
			//파일선택 
			if(file.files.length == 0){
				alert("파일을 선택하세요");
				return ;
			}
		
			var formData = new FormData();
			formData.append("lodgingId", lodgingId);
			formData.append("roomName", roomName);
			formData.append("areaName", areaName);//이것가지 areaName 으로 바꿔주니 추가 성공했다.
			formData.append("level", level);
			formData.append("file", file.files[0]);
			
			$.ajax({
				type:"post"
				, url:"/lodging/update"
				, data:formData//파일이 포함되어있는경우 일반적인 형태:{}로는 전달안된다고 함. 위의 formData.append("file", file.files[0]);이 전달안되서.
				, enctype :"multipart/form-data"// 파일 업로드 필수
				, processData:false// 파일 업로드 필수
				, contentType:false
				, success:function(data){
					if(data.result == "success") {
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