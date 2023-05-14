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
	
	<!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<style>
	a{
		color:#646477;
	
	}
	
	
	</style>

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
				<aside class="side-nav col-2 ">
				
				<ul class="nav d-flex justify-content-center">
					<li class="mt-3">
						<h4><a href="/lodging/dibspage/view?id=${user.id }" class="">찜목록</a></h4>
					</li>
					<li class="mt-3">
						<h4><a href="/lodging/reservelist/view?id=${user.id }" class="">예약내역</a></h4>
					</li>
					<li class="mt-3">
						<h4><a href="/user/mypage/view?id=${user.id }" class="">내 정보수정</a></h4>
					</li>
					
				</ul>
				</aside>
				
				<section class="contents1 col-10">
					
					<div class="info-input-box mx-4">
					
						<label class="mt-3">프로필 사진 변경</label><br>
						
						<i id="imageIcon" class="bi bi-card-image image-icon-size"></i>
					
						<input type="file" name="file" id="fileInput" class="">
						
						<c:choose>
						  <c:when test="${not empty user.imagePath }"><!-- 있을때 이거를 user.imagePath로 바꾸면 어떨까?  프사가 뜬다.-->
						  	
							<!-- 우선 굳이 이미지아이콘 이용해야하는지도 의문이긴한지만, 있을때는 사진변경/ 사진삭제 버튼 -->
							<!-- 없을때는 사진 업로드 버튼 이렇게만 있게하는걸로,  -->
							<!-- 그리고 음.. 사진변경을 안하고 수정을 누르면 아예 사라져버리는데 프로필변경과 따로해야하나 싶다. -->
							
						  	<img class="userprofile" width ="40" height="40" src="${user.imagePath}" value="${user.imagePath}"><!--이렇게 했을땐 저장은됐다. 헤더야 항상 불러와야 하니 세션을 썼지만.. -->
						  
						  	<!-- 파일인풋이 없을때 수정이 안되게끔 그렇게 예외처리를 진행해보도록 한다. 파일 인풋은 말그대로 다른 인풋과는 다른것. 그냥 처음부터 없는 상태서 인서트 한다고 보면됨. 입력을 안했으니 당연히 수정 눌렀으니 저 밑에게 나옴 -->
						  </c:when>
						  <c:otherwise><!-- 없을때 -->
						  	<img class="userprofile" width ="40" height="40" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"> 
						  </c:otherwise>
				 		 </c:choose>	
						
							
						<div class="d-flex">
							<label class="col-4 mt-4">비밀번호</label><input type="password" id="passwordInput"value= "" class="form-control mt-4 mr-3">
						</div><!-- 보아하니 암호화된 값이 그대로 비밀번호 창에 들어가서 길게 뜨나봄 -->
						<div class="d-flex">
							<label class="col-4 mt-4">비밀번호 확인</label><input type="password" id="passwordConfirmInput" value= ""  class="form-control mt-4 mr-3">
						</div>
						<div class="d-flex">
							<label class="col-4 mt-4">이름</label><input type="text" id="nameInput" value="${user.name }" class="form-control mt-4 mr-3">
						</div>	
						<div class="d-flex">							<!-- 왜자꾸 이메일, 이메일 이렇게 뜨는지 모르겠다. 분명 프론트엔드 영역 문제고 그럴거같은데 -->
							<label class="col-4 mt-4">이메일</label><input type="text" id="emailInput" value="${user.email }" class="form-control mt-4 mr-3">
						</div>		
						<div class="d-flex">
							<label class="col-4 mt-4">닉네임</label><input type="text" id="nicknameInput" value="${user.nickname }" class="form-control mt-4 mr-3">
						</div>
						<div class="d-flex">	
							<label class="col-4 mt-4">전화번호</label><input type="text" id="phoneNumberInput" value= "${user.phoneNumber }"  class="form-control mt-4 mr-3">
						</div>
						<!-- ajax아직 안해서 에러 400에러 뜨나봄 -->
						<div class="text-center">
							<button id="updateBtn"class="btn btn-primary mt-3 mb-3" type="button" data-user-id="${user.id }">수정 완료</button>
						</div>
					
					
					</div>
				</section>
					
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
			
			if(password == ""){
				alert("비밀번호를 입력해주세요.");
				return ;
			}
			
			if(passwordConfirm == ""){//근데 비밀번호가 로그인했던 그 비밀번호와 일치하는거 그거는 그냥 막바지에가서 하기 지금은 너무 바쁘다.
				alert("비밀번호를 재확인해주세요.");
				return ;
			}
			
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
			
			//alert(id);//보아하니 여기 데이터가 안들어오는 현상 디버깅은 안되서 매퍼 확인, api 확인후 api 값을 받아오는 쪽(아작스)도 확인
			//alert(email);				//그나저나 저기 위에선 loginId는 들어오는 상황인데 왜 안들어오는지??
			//alert(file);
			var formData = new FormData();
			
			formData.append("id", id);//여기도 로그인id 그냥 id 로 수정
			formData.append("password", password);			
			formData.append("name", name);
			formData.append("nickname", nickname);
			formData.append("email", email);
			formData.append("phoneNumber", phoneNumber);
			formData.append("file", file.files[0]);//??아마 여기가 문제인거같은데?
			
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