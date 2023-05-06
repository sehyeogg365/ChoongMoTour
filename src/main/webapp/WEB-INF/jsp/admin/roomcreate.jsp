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
			     <!-- roomcreate, update 에서 굳이 입력란을 처음부터 숨겨야하는지? 굳이 이점이 없다면 다른 페이지들처럼 처음에는 드러내놓는게 좋을듯 -->
			     
			     <!-- 여기를 라디오버튼이 아닌 셀렉터로 해보면 어떨까? 체인지 이벤트에서 한 밸류값을 그대로 클릭이벤트에도 적용이 가능할텐데??? -->
			     
			     <select class="form-control col-5 mt-3" id="sizeSelector">
							
                            <option value="">사이즈</option>
                            <option value="singleroom">싱글</option>
                            <option value="doubleroom">더블</option>
                            <option value="twinroom">트윈</option>
                       
                 </select>
			     
			     
			     							<!-- id값부여해보기 -->
                 <div id="singleInput" class="">
	                 <label>기본정보 (싱글)</label><br><!-- 마찬가지로 라디오 버튼을 눌렀을때 위의 값이 굳이 바뀌어야 할이윤 없지만 라디오 버튼을 눌렀을때 특정값을 가져오게 할순 있다고함 -->
	                 <i id="imageIcon" class="bi bi-card-image image-icon-size"></i>
	                 <input type="file" name="file" id="singlefileInput"><br>
	                 
	                 <div class="d-flex mt-3">
						<label>가격</label><input type="text" id="singlepriceInput" placeholder="내용을 입력해주세요" class="form-control col-6	">원<br>
					 </div>
	                 
	                 <textarea rows="5" cols="100" id="singlecontentInput" class="mt-4 form-control"></textarea>
                 	 
                 	 <div class="text-center">
						<button id="singlecreateBtn"class="btn btn-primary single-create-btn mt-3" type="button" data-room-id="${room.id }">입력 완료</button>
					 </div>
                 </div>
                 
                 <div id="doubleInput" class="d-none">
	                 <label>기본정보 (더블)</label><br>
	                 <i id="imageIcon" class="bi bi-card-image image-icon-size"></i>
	                 <input type="file" name="file" id="doublefileInput"><br>
	                 
	                 <div class="d-flex mt-3">					<!-- 여기도 사이즈 별로 id값 다르게 구별해야 한다. 그래서 계속 가격입력하라고 뜬것. -->
						<label>가격</label><input type="text" id="doublepriceInput" placeholder="내용을 입력해주세요" class="form-control col-6	">원<br>
					 </div>
	                 
	                 <textarea rows="5" cols="100" id="doublecontentInput" class="mt-4 form-control"></textarea>
                 	 
                 	 <div class="text-center">
						<button id="doublecreateBtn"class="btn btn-primary double-create-btn mt-3" type="button" data-room-id="${room.id }">입력 완료</button>
					 </div>
                 
                 </div>
                 
                 <div id="twinInput" class="d-none">
	                 <label>기본정보 (트윈)</label><br>
	                 <i id="imageIcon" class="bi bi-card-image image-icon-size"></i>
	                 <input type="file" name="file" id="twinfileInput"><br>
	                 
	                 <div class="d-flex mt-3">
						<label>가격</label><input type="text" id="twinpriceInput" placeholder="내용을 입력해주세요" class="form-control col-6	">원<br>
					 </div>
	                 
	                 <textarea rows="5" cols="100" id="twincontentInput" class="mt-4 form-control"></textarea>
                 	 
                 	 <div class="text-center">																			<!-- room.lodgingId 로 하니 alert창에 id 또 안뜸 -->
						<button id="twincreateBtn"class="btn btn-primary twin-create-btn mt-3" type="button" data-room-id="${room.id }">입력 완료</button>
					 </div>
                 
                 </div>
			
			
				
				
			</div>
		</section>
	
	
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>
	<script>
	$(document).ready(function(){
		
		
			//마찬가지로 클래스에 create-btn 값지정 id마다 버튼이 하나씩 달려있으므로.
			
			// 입력란 바꾸기
			$("#sizeSelector").on("change", function(){//체인지 이벤트 밸류값을 밑에 클릭 이벤트에다가도 가져오는 방법? 셀렉터가 답이라고 본다.
				
				let size = $(this).val();
				
				alert(size);//클릭시 경고창
				
				if(size == 'singleroom'){
					$("#singleInput").removeClass("d-none");
					$("#doubleInput").addClass("d-none");
					$("#twinInput").addClass("d-none");
					
				} else if(size == 'doubleroom'){//이거실수로 = 하나만함
					$("#doubleInput").removeClass("d-none");
					$("#singleInput").addClass("d-none");
					$("#twinInput").addClass("d-none");
					
				} else if(size == 'twinroom'){//여기서 트윈눌렀을때도 왜 더블이 나오는진 몰라도 얼추는 해결됨 d
					$("#twinInput").removeClass("d-none");
					$("#singleInput").addClass("d-none");
					$("#doubleInput").addClass("d-none");
				}
				
			});
			
			
			


		
		$("#singlecreateBtn").on("click", function(){//역시나 id별로 버튼이 달려있으므로 class에 create-btn 값주고 진행
			
			//let id = $(this).data("lodging-id");//Required request parameter 'lodgingId' for method parameter type int is not present] 계속뜨는상황	
			//이것도 빼준다.
			let id = $(this).data("room-id");//이거넣으니까 갑자기 추가가 된다. 근데 중복된값 아닌가??
			
			let price = $("#singlepriceInput").val();
			
			//여긴 클릭이벤트 저기위에는 체인지이벤트라서 아무상관없다하고. 이 밸류값 당연히 못가져옴.
			
			let size = $("#sizeSelector").val();
			
			let content = $("#singlecontentInput").val(); 
			
			let file = $("#singlefileInput")[0];//여기도 id값 컨텐트, 파일 다 이렇게 구분해줘야 함.
			
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
			
			//레스트컨트롤러 파라미터 값 다 적어야 하는듯
			
			formData.append("id", id);
			//formData.append("lodgingId", lodgingId);
			formData.append("price", price);
			formData.append("size", size);
			formData.append("content", content);
			formData.append("file", file.files[0]);
			
			// //Required request parameter 'lodgingId' for method parameter type int is not present] 계속뜨는상황	
			alert(id);//O
			alert(price);//O
			alert(size);//O
			alert(content);//O
			alert(file);//O
			
			$.ajax({
				type: "post"
				, url: "/lodging/room/create"
				, data:formData
				, enctype :"multipart/form-data"// 파일 업로드 필수
				, processData:false// 파일 업로드 필수
				, contentType:false// 파일 업로드 필수
				, success:function(data){
					if(data.result == "success"){
						location.reload(); 
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
		
		
		$("#doublecreateBtn").on("click", function(){//역시나 id별로 버튼이 달려있으므로 class에 create-btn 값주고 진행
			 
			let id = $(this).data("room-id");
			//let lodgingId = $(this).data("lodging-id");
			
			let price = $("#doublepriceInput").val();
			
			let size = $("#sizeSelector").val();
			
			let content = $("#doublecontentInput").val(); 
			
			let file = $("#doublefileInput")[0];
			
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
			
			formData.append("id", id);//레스트컨트롤러 파라미터 값 다 적어야 하는듯
			//formData.append("lodgingId", lodgingId);//Required request parameter 'lodgingId' for method parameter type int is not present] 계속뜨는상황						
			formData.append("price", price);
			formData.append("size", size);
			formData.append("content", content);
			formData.append("file", file.files[0]);
			
			alert(id);
			alert(price);//O
			alert(size);//O
			alert(content);//O
			alert(file);//O
			
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
		
		
		$("#twincreateBtn").on("click", function(){//역시나 id별로 버튼이 달려있으므로 class에 create-btn 값주고 진행
			
			//let lodgingId = $(this).data("lodging-id");
			let id = $(this).data("room-id");
			
			let price = $("#twinpriceInput").val();
			
			let size = $("#sizeSelector").val();
			
			let content = $("#twincontentInput").val(); 
			
			let file = $("#twinfileInput")[0];
			
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
			
			//레스트컨트롤러 파라미터 값 다 적어야 하는듯
			
			formData.append("id", id);
			formData.append("price", price);
			formData.append("size", size);
			formData.append("content", content);
			formData.append("file", file.files[0]);
			
			
			//alert(id);//O
			//alert(price);//O
			//alert(size);//O
			//alert(content);//O
			//alert(file);//O
			
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