<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 관리자 객실 추가</title>
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
			
			<div class="roomcreate-page">
				
				<h1 class="text-center pt-3">관리자 객실 추가</h1>
				
			
				
				 <label>사이즈</label> <br><!-- 클릭할때마다 텍스트 입력창이 떠야함 -->
			     
			     <label>싱글<input type="radio" id="single" name="size" value="singleroom"></label>
			     
			     <label>더블<input type="radio" id="double" name="size" value="doubleroom"></label>
			     
			     <label>트윈<input type="radio" id="twin"name="size" value="twinroom"></label><br>
                  								<!-- id값부여해보기 -->
                 <div id="singleInput" class="d-none" >
	                 <label>기본정보 (싱글)</label><br>
	                 <i id="imageIcon" class="bi bi-card-image image-icon-size"></i>
	                 <input type="file" name="file" id="fileInput"><br>
	                 
	                 <div class="d-flex mt-3">
						<label>가격</label><input type="text" id="priceInput" placeholder="내용을 입력해주세요" class="form-control col-6	">원<br>
					 </div>
	                 
	                 <textarea rows="5" cols="100" id="contentInput" class="mt-4 form-control"></textarea>
                 	 
                 	 <div class="text-center">
						<button id="singlecreateBtn"class="btn btn-primary single-create-btn mt-3" type="button" data-lodging-id="${lodging.id }">입력 완료</button>
					 </div>
                 </div>
                 
                 <div id="doubleInput" class="d-none" >
	                 <label>기본정보 (더블)</label><br>
	                 <i id="imageIcon" class="bi bi-card-image image-icon-size"></i>
	                 <input type="file" name="file" id="fileInput"><br>
	                 
	                 <div class="d-flex mt-3">
						<label>가격</label><input type="text" id="priceInput" placeholder="내용을 입력해주세요" class="form-control col-6	">원<br>
					 </div>
	                 
	                 <textarea rows="5" cols="100" id="contentInput" class="mt-4 form-control"></textarea>
                 	 
                 	 <div class="text-center">
						<button id="doublecreateBtn"class="btn btn-primary double-create-btn mt-3" type="button" data-lodging-id="${lodging.id }">입력 완료</button>
					 </div>
                 
                 </div>
                 
                 <div id="twinInput" class="d-none" >
	                 <label>기본정보 (트윈)</label><br>
	                 <i id="imageIcon" class="bi bi-card-image image-icon-size"></i>
	                 <input type="file" name="file" id="fileInput"><br>
	                 
	                 <div class="d-flex mt-3">
						<label>가격</label><input type="text" id="priceInput" placeholder="내용을 입력해주세요" class="form-control col-6	">원<br>
					 </div>
	                 
	                 <textarea rows="5" cols="100" id="contentInput" class="mt-4 form-control"></textarea>
                 	 
                 	 <div class="text-center">
						<button id="twincreateBtn"class="btn btn-primary twin-create-btn mt-3" type="button" data-lodging-id="${lodging.id }">입력 완료</button>
					 </div>
                 
                 </div>
			
			
				
				
			</div>
		</section>
	
	
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>
	<script>
	$(document).ready(function(){
		
		
		$("input[name='size']").on("change", function(){//마찬가지로 클래스에 create-btn 값지정 id마다 버튼이 하나씩 달려있으므로.
			
			let size = $(this).val();
			
			alert(size);//클릭시 경고창
			
			
			
			if($("#single").is(":checked")){
				$("#singleInput").removeClass("d-none");
				
			} else {
				$("#singleInput").addClass("d-none");
			}
			
			if($("#double").is(":checked")){
				$("#doubleInput").removeClass("d-none");
				
			} else {
				$("#doubleInput").addClass("d-none");
			}
			
			if($("#twin").is(":checked")){
				$("#twinInput").removeClass("d-none");
				
			} else {
				$("#twinInput").addClass("d-none");
			}
			
			
			
			
		});
		
		
		
		$(".single-create-btn").on("click", function(){//역시나 id별로 버튼이 달려있으므로 class에 create-btn 값주고 진행
			
			let id = $(this).data("lodging-id");
			
			let price = $("#priceInput").val();
			
			let size = $("#sizeInput").val();
			
			let content = $("#contentInput").val(); 
			
			let file = $("#fileInput")[0];
			
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
			
			if(file.files.length == 0){
				alert("파일을 선택하세요");
				return ;
			}
			
			var formData = new FormData();
			
			formData.append("id", id);
			formData.append("price", price);
			formData.append("size", size);
			formData.append("content", content);
			formData.append("file", file.files[0]);
			
			alert(id);//alert 해보니 아이디 값조차도 제대로 안들어오는 상황 인걸 확인할수 있다.
			alert(price);//O
			alert(size);//X
			alert(content);//O
			alert(file);//X
			
			$.ajax({
				type: "post"
				, url: "/lodging/room/create"
				, data:formData
				, enctype :"multipart/form-data"// 파일 업로드 필수
				, processData:false// 파일 업로드 필수
				, contentType:false// 파일 업로드 필수
				, success:function(data){
					if(data.result == "success"){
						location.reload();//Request method 'GET' not supported로 갑자기 오류메시지가 바뀌는데?? 
						alert("추가 성공");
					} else{
						//또 400에러가뜬다.
						alert("추가 실패");
					}		
					
				}
				, error:function(){
					alert("추가 에러");
				}
				
			});
			
			
			
		});
		
		
		$(".double-create-btn").on("click", function(){//역시나 id별로 버튼이 달려있으므로 class에 create-btn 값주고 진행
			
			let id = $(this).data("lodging-id");
			
			let price = $("#priceInput").val();
			
			let size = $("#sizeInput").val();
			
			let content = $("#contentInput").val(); 
			
			let file = $("#fileInput")[0];
			
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
			
			if(file.files.length == 0){
				alert("파일을 선택하세요");
				return ;
			}
			
			var formData = new FormData();
			
			formData.append("id", id);
			formData.append("price", price);
			formData.append("size", size);
			formData.append("content", content);
			formData.append("file", file.files[0]);
			
			alert(id);//alert 해보니 아이디 값조차도 제대로 안들어오는 상황 인걸 확인할수 있다.
			alert(price);//O
			alert(size);//X
			alert(content);//O
			alert(file);//X
			
			$.ajax({
				type: "post"
				, url: "/lodging/room/create"
				, data:formData
				, enctype :"multipart/form-data"// 파일 업로드 필수
				, processData:false// 파일 업로드 필수
				, contentType:false// 파일 업로드 필수
				, success:function(data){
					if(data.result =="success"){
						location.reload();//Request method 'GET' not supported로 갑자기 오류메시지가 바뀌는데?? 
						alert("추가 성공");
					} else{
						//또 400에러가뜬다.
						alert("추가 실패");
					}		
					
				}
				, error:function(){
					alert("추가 에러");
				}
				
			});
			
			
			
		});
		
		
		$(".twin-create-btn").on("click", function(){//역시나 id별로 버튼이 달려있으므로 class에 create-btn 값주고 진행
			
			let id = $(this).data("lodging-id");
			
			let price = $("#priceInput").val();
			
			let size = $("#sizeInput").val();
			
			let content = $("#contentInput").val(); 
			
			let file = $("#fileInput")[0];
			
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
			
			if(file.files.length == 0){
				alert("파일을 선택하세요");
				return ;
			}
			
			var formData = new FormData();
			
			formData.append("id", id);
			formData.append("price", price);
			formData.append("size", size);
			formData.append("content", content);
			formData.append("file", file.files[0]);
			
			alert(id);//alert 해보니 아이디 값조차도 제대로 안들어오는 상황 인걸 확인할수 있다.
			alert(price);//O
			alert(size);//X
			alert(content);//O
			alert(file);//X
			
			$.ajax({
				type: "post"
				, url: "/lodging/room/create"
				, data:formData
				, enctype :"multipart/form-data"// 파일 업로드 필수
				, processData:false// 파일 업로드 필수
				, contentType:false// 파일 업로드 필수
				, success:function(data){
					if(data.result =="success"){
						location.reload();//Request method 'GET' not supported로 갑자기 오류메시지가 바뀌는데?? 
						alert("추가 성공");
					} else{
						//또 400에러가뜬다.
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