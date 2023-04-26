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
</head>
<body>
	<div id = "wrap">
	<c:import url="/WEB-INF/jsp/include/adminheader.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="roomupdate-page">
			
				<h1 class="text-center pt-3">관리자 객실 수정</h1>
				
				
				<select class="form-control col-5 mt-3" id="sizeSelector">
							
                            <option value=""></option>
                            <option value="singleroom">싱글</option>
                            <option value="doubleroom">더블</option>
                            <option value="twinroom">트윈</option>
                       
                 </select>
				<label>로징아이디 : ${room.lodgingId }</label>

                 <div id="singleInput" class="">
	                 <label>기본정보 (싱글)</label><br>
	                 
	                 <div class="d-flex mt-3">
						<label>가격</label><input type="text" id="singlepriceInput" placeholder="${room.price }원" class="form-control col-6"><br>
					 </div>
					 
	                 <textarea rows="5" cols="100" id="singlecontentInput" class="mt-4 form-control">${room.content }</textarea>
                 	 
                 	 <div class="text-center">
						<button id="singleupdateBtn"class="btn btn-primary single-update-btn mt-3" type="button" data-room-id="${room.id }">수정 완료</button>
					 </div>
                 </div>
                 
                 <div id="doubleInput" class="d-none">
	                 <label>기본정보 (더블)</label><br>
	                 <!-- 각각 c태그로 넣기 -->
	                 <div class="d-flex mt-3">
						<label>가격</label><input type="text" id="doublepriceInput" placeholder="${room.price }원" class="form-control col-6"><br>
					 </div>
					 
	                 <textarea rows="5" cols="100" id="doublecontentInput" class="mt-4 form-control">${room.content }</textarea>
                 	  
                 	 <div class="text-center">
						<button id="doubleupdateBtn"class="btn btn-primary double-update-btn mt-3" type="button" data-room-id="${room.id }">수정 완료</button>
					 </div>
                 </div>
                 
                 <div id="twinInput" class="d-none">
	                 <label>기본정보 (트윈)</label><br>
	                 <div class="d-flex mt-3">
						<label>가격</label><input type="text" id="twinpriceInput" placeholder="${room.price }원" class="form-control col-6"><br>
					 </div>
					 
	                 <textarea rows="5" cols="100" id="twincontentInput" class="mt-4 form-control">${room.content }</textarea>
                 	
                 	<div class="text-center">
						<button id="twinupdateBtn"class="btn btn-primary twin-update-btn mt-3" type="button" data-room-id="${room.id }">수정 완료</button>
					</div>
                 	
                 </div>
                 
                 
                 
				
			</div>
		</section>
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>


	<script>
	$(document).ready(function(){
		
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
		
		
		
		$("#singleupdateBtn").on("click", function(){
			
			let id = $(this).data("room-id");
	
			let price = $("#singlepriceInput").val();
			
			let size = $("#sizeSelector").val();
			
			let content = $("#singlecontentInput").val(); 
			
			//let file = $("#fileInput")[0];
			
			
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
			
	
			
			$.ajax({
				type:"post"
				, url:"/lodging/update"
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
	
		$("#doubleupdateBtn").on("click", function(){
			
			let id = $(this).data("room-id");
	
			let price = $("#singlepriceInput").val();
			
			let size = $("#sizeSelector").val();
			
			let content = $("#singlecontentInput").val(); 
			
			
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
			
	
			
			$.ajax({
				type:"post"
				, url:"/lodging/update"
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
		
		$("#twinupdateBtn").on("click", function(){
			
			let id = $(this).data("room-id");

			let price = $("#singlepriceInput").val();
			
			let size = $("#sizeSelector").val();
			
			let content = $("#singlecontentInput").val(); 
			
			
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
			
	
			
			$.ajax({
				type:"post"
				, url:"/lodging/update"
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