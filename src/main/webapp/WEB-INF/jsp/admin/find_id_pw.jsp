<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>            
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 관리자 아이디/비번 찾기</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id = "wrap">
	
	<c:import url="/WEB-INF/jsp/include/adminheader.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="find-id-pw-page">
				<h1 class="text-center">
					ChoongMo Tour Admin Find Id/Pw
				</h1>
				<div class="findidpwcontents">
				
				<div class="d-flex justify-content-center align-items-end">
				 	<label>아이디찾기<input type="radio" name="type" value="findId" checked></label>
                         	
                    <label class="ml-3">비밀번호 찾기<input type="radio" name="type" value="findPassword"></label>
  
				</div>
				<div class="find-id " id="findIdInput">
					<label>아이디 찾기</label>
					<input type="text" id="emailInput" placeholder="이메일" class="form-control mt-4">
					<input type="text" id="nameInput" placeholder="이름" class="form-control mt-4">
				
					<button type="button" class="btn btn-primary btn-block mt-3" id="findIdBtn" data-admin-id="${user.loginId }" >Next</button>
				</div>																		
				
				<div class="find-pw d-none" id="findPasswordInput">			
					<label>비밀번호 찾기</label>
					<input type="text" id="loginIdInput" placeholder="로그인 ID" class="form-control mt-4">
					<input type="text" id="email2Input" placeholder="이메일" class="form-control mt-4">
				
					<button type="button" class="btn btn-primary btn-block mt-3" id="findPwBtn" data-admin-password="${user.password }">Next</button>
				
				</div>
				
				
				
				</div>
				
			</div>
		
		
		</section>
	
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script>
	$(document).ready(function(){
	
		
		
		// 라디오 버튼 선택에 따른 인풋 변경
		$("input[name=type]").on('change', function() {
			 if($(this).val() == 'findId') {
				 $("#findIdInput").removeClass("d-none");
                 $("#findPasswordInput").addClass("d-none");
				 
			 } else {
				 $("#findPasswordInput").removeClass("d-none");
				 $("#findIdInput").addClass("d-none");
                 
			 }
			
			
		});	
		
		$("#findIdBtn").on("click", function(){
			
			
			let id = $(this).data("admin-id");
			let name = $("#nameInput").val();
			let email = $("#emailInput").val();
			
			if(name == ""){
				alert("이름을 입력하세요.");
				return;
				
			}
			
			if(email == ""){
				alert("이메일을 입력하세요.");
				return;
				
			}

			alert(name);
			alert(email);
	
			
			$.ajax({
				type:"get"
				, url:"/admin/find_id"
				, data:{"loginId":id, "name": name, "email" : email }//여기실수 뒤에 하나, 찍음				
				, success:function(data){
					if(data.result == "success"){
						alert("아이디는 : " + data.info.loginId);
						location.reload();
					} else {
						alert("이름/이메일이 일치하지 않습니다.");
					
					}		
				}
				, error:function(){
					alert("아이디 찾기 에러");
				}
			
			});
		});
		
		
		$("#findPwBtn").on("click", function(){
			let password =  $(this).data("admin-password");
			let id = $("#loginIdInput").val();
			let email = $("#email2Input").val();
			
			
			if(id == ""){
				alert("아이디를 입력하세요.");
				return;
				
			}
			
			if(email == ""){
				alert("이메일을 입력하세요.");
				return;
				
			}
			
			alert(id);
			alert(email);
			
			
				$.ajax({
					type:"post"
					, url:"/admin/temppassword"
					, data:{"loginId":id, "email":email, "password":password}
					, success:function(data){
						
						if(data.result == "success"){
							console.log(data.info);
							//alert("임시비밀번호는 :"+ data.info + "입니다." );
							//location.reload();
						}else{
							alert("아이디/이메일이 일치하지 않습니다.");
						}
					}
					, error:function(){
						alert("비밀번호 찾기 에러");
					}
				
				});
		
		
		});
	});
	
	</script>

</body>
</html>