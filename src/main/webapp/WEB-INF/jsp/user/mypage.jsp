<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 마이페이지</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id = "wrap">
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="my-page">
				<h1 class="text-center">
					ChoongMo Tour My Page
				</h1>
				
				
				<div class="mypagecontents d-flex">
				<aside class="aside1 col-3 ">
				
			
					<div>
						<h3><a href="/user/dibspage/view?id=${user.id }" class="text-dark">찜목록</a></h3>
					</div>
					<div>
						<h3><a href="/user/reservelist/view?id=${user.id }" class="text-dark">예약내역</a></h2>
					</div>
					<div>
						<h3><a href="/user/mypage/view?id=${user.id }" class="text-dark">내 정보수정</a></h3>
					</div>
					
				
				</aside>
				
				<section class="contents1 col-9">
					
					<div class="info-input-box">
					
						<label>프로필 사진 변경</label><br>
						<i id="imageIcon" class="bi bi-card-image image-icon-size"></i>
					
						<input type="file" name="file" id="fileInput">
						
						
						
						<c:choose>
						  <c:when test="${not empty user.imagePath }"><!-- 있을때 이거를 user.imagePath로 바꾸면 어떨까? 헤더야 항상 불러와야 하니 세션을 썼지만.. 프사가 뜬다.-->
						  	<img class="userprofile" width ="40" height="40" src="${user.imagePath}"><!--이렇게 했을땐 저장은됐다. 근데 사진이안뜸  -->
						  </c:when>
						  <c:otherwise><!-- 없을때 -->
						  	<img class="userprofile" width ="40" height="40" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png">
						  </c:otherwise>
				 		 </c:choose>	
						
							
						<div class="d-flex">
							<label class="col-4 mt-4">비밀번호</label><input type="password" id="passwordInput"value= "${user.password }" class="form-control mt-4">
						</div>
						<div class="d-flex">
							<label class="col-4 mt-4">비밀번호 확인</label><input type="password" id="passwordConfirmInput" value= "${user.password }"  class="form-control mt-4">
						</div>
						<div class="d-flex">
							<label class="col-4 mt-4">이름</label><input type="text" id="nameInput" value="${user.name }" class="form-control mt-4">
						</div>	
						<div class="d-flex">							<!-- 왜자꾸 이메일, 이메일 이렇게 뜨는지 모르겠다. 분명 프론트엔드 영역 문제고 그럴거같은데 -->
							<label class="col-4 mt-4">이메일</label><input type="text" id="emailInput" value="${user.email }" class="form-control mt-4">
						</div>		
						<div class="d-flex">
							<label class="col-4 mt-4">닉네임</label><input type="text" id="nicknameInput" value="${user.nickname }" class="form-control mt-4">
						</div>
						<div class="d-flex">	
							<label class="col-4 mt-4">전화번호</label><input type="text" id="phoneNumberInput" value= "${user.phoneNumber }"  class="form-control mt-4">
						</div>
						<!-- ajax아직 안해서 에러 400에러 뜨나봄 -->
						<div class="text-center">
							<button id="updateBtn"class="btn btn-primary mt-3" type="button" data-user-id="${user.id }">수정 완료</button>
						</div>
					
					
					</div>
				</section>
					
			</div>
			
			</div>
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
		
	</div>
	<script>
	$(document).ready(function(){
		//var ths = $(ths);
		
		//ths.parents("");
		
		//var id = "id";
		
		$("#updateBtn").on("click", function(){
			
			let id = $(this).data("user-id");
			let password = $("#passwordInput").val();//이것도 틀림
			let passwordConfirm = $("#passwordConfirmInput").val();			
			let name = $("#nameInput").val();
			//닉네임이 파라미터가 없었다..
			let nickname = $("#nicknameInput").val();
			let email = $("#emailInput").val();
			let phoneNumber = $("#phoneNumberInput").val();
			let file = $("#fileInput")[0];
			
			if(password != passwordConfirm){
				alert("비밀번호가 다릅니다.");
				return ;
			}
			if(name == ""){		
				alert("이름을 입력하세요.");
				return ;
			}
			if(nickname == ""){		
				alert("닉네임을 입력하세요.");
				return ;
			}
			if(email == ""){		
				alert("이메일을 입력하세요.");
				return ;
			}
			
			if(phoneNumber == ""){
				alert("전화번호를 입력하세요.");
				return ;
			}
			
			//파일은 필수사항이아님 전화번호는 회원가입할땐 필수사항이 아니지만, 전화번호를 쓰게끔하는게 속편할듯.
			
			alert(id);//보아하니 여기 데이터가 안들어오는 현상 디버깅은 안되서 매퍼 확인, api 확인후 api 값을 받아오는 쪽(아작스)도 확인
			alert(email);				//그나저나 저기 위에선 loginId는 들어오는 상황인데 왜 안들어오는지??
			alert(file);
			var formData = new FormData();
			
			formData.append("id", id);//여기도 로그인id 그냥 id 로 수정
			formData.append("password", password);			
			formData.append("name", name);
			formData.append("nickname", nickname);
			formData.append("email", email);
			formData.append("phoneNumber", phoneNumber);
			formData.append("file", file.files[0]);
			
			$.ajax({
				type:"post"
				, url:"/user/mypage"
				, data:formData//파일이 포함되어있는경우 일반적인 형태:{}로는 전달안된다고 함. 위의 formData.append("file", file.files[0]);이 전달안되서.
				, enctype :"multipart/form-data"// 파일 업로드 필수
				, processData:false// 파일 업로드 필수(근데 여기선 필수로 하면안됨)
				, contentType:false// 파일 업로드 필수
				, success:function(data){
					if(data.result == "success"){
						alert("수정 성공");
						location.reload();
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