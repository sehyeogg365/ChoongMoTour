<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 관리자 숙소 추가</title>
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
			<div class="lodgingcreate-page">
				<h1 class="text-center pt-3 font-weight-bold">ChoongMo Tour Lodging Create Page</h1><!-- pt-3제거 -->
				
				<div class="lodgingcreate-page-contents">
					<i id="imageIcon" class="bi bi-card-image image-icon-size ml-3 mt-3"></i>
					
					<input type="file" name="file" id="fileInput" class="mt-3"><br>
					
					<div class="mx-3">
						<label class="mt-4">이름</label><input type="text" id="roomNameInput" placeholder="내용을 입력해주세요" class="form-control mt-4"><br>
					</div>
				
					<select class="form-control col-5 mt-3 ml-3" id="areaSelector">
                        <option value="">지역</option>
                        <option value="seoul">서울</option>
                        <option value="incheon">인천</option>
                        <option value="gangwon">강원</option>
                        <option value="gyeongsang">경상</option>
                        <option value="jeolla">전라</option>
                        <option value="busan">부산</option>
                        <option value="jeju">제주</option>
	                 </select>
	                 
					<select class="form-control col-5 mt-3 ml-3" id="levelSelector">
                        <option value="">등급</option>
                        <option value="1성급">1성급</option>
                        <option value="2성급">2성급</option>
                        <option value="3성급">3성급</option>
                        <option value="4성급">4성급</option>
                        <option value="5성급">5성급</option>
	                 </select>

					<div class="text-center my-3">
						<button id="createBtn"class="btn btn-primary col-12" type="button" >입력 완료</button>
					</div>										<!-- data-lodging-id="${lodging.id }" 이거 안넣어도 되는모습 -->
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
		//셀렉터에 대한 체인지 이벤트는 사실상 필요없다고 함 왜냐면 어떤걸 선택했는지만 확인하면 되기 때문에 이안에서 바꾸거나 그러지 않으므로

		$("#createBtn").on("click", function(){
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

			//alert(roomName);
			//alert(areaName);
			//alert(level);
			//alert(file);
			
			var formData = new FormData();
			
			//딱 여기서 넣는값만
			//formData.append("adminId", adminId);
			formData.append("roomName", roomName);
			formData.append("areaName", areaName);//이것까지 areaName 으로 바꿔주니 추가 성공했다.
			formData.append("level", level);
			formData.append("file", file.files[0]);//400에러면 api호출하는곳에가봐야 함 비오다오 볼필요도 없고 레스트컨트롤러에서 조차도 아예 안들어가고 튕기는 현상임 바로 여기임 여기는 폼데이터로 데이터를 호출하는데 여기선 파일밖에 안불러옴. 이게원인이였음
		
			$.ajax({
				type:"post"
				, url:"/lodging/create"
				, data:formData//파일이 포함되어있는경우 일반적인 형태:{}로는 전달안된다고 함. 위의 formData.append("file", file.files[0]);이 전달안되서.
				, enctype :"multipart/form-data"// 파일 업로드 필수
				, processData:false// 파일 업로드 필수
				, contentType:false// 파일 업로드 필수
				, success:function(data){		
					if(data.result == "success") {
						location.href="/admin/main/view";//Request method 'GET' not supported로 갑자기 오류메시지가 바뀌는데?? 
						alert("추가 성공");	// Required request parameter 'roomName' for method parameter type String is not present한마디로 roomName이 안들어오고있다 이런뜻같다. controller(알고보니아님) or ajax 찾아보기
					} else {
						alert("추가 실패");
					}
				}
				, error:function(){
					alert("추가 에러");
				}
			});
		});
	});
	</script>
</body>
</html>