<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    <!-- 웬만하면 써주는게 맞다고 함 헤더여도 -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="d-flex align-items-center justify-content-between">
			<!--<h1 class="ml-3 text-white"><a href="/lodging/main/view" class="text-white">ChoongMo Tour</a></h1>-->
			<a href="/lodging/main/view">
				<img class="logo" width="90" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbleWvU%2Fbtsml4maMFA%2Fb13BMYGtp2GnvY5xpbYS1k%2Fimg.png" alt="로고">
			</a>
			
			<c:choose>
			
			<c:when test="${not empty userId }">
			<div class="btn-group">
			<!-- 프로필사진이 있을때 없을때 -->
			  <c:choose>
				  <c:when test="${not empty userImagePath }"><!-- 헤더에선 세션값을 불러와야 함 이것만기억하자-->
				  	<img class="userprofile" width ="40" height="40" src="${userImagePath}"><!--이렇게 했을땐 저장은됐다. 근데 사진이안뜸 -->
				  </c:when>
				  <c:otherwise><!-- 없을때 --><!-- 분명히 디비엔 저장이된다. 왜안될까?  그리고 로그아웃 되었을때도 계속 뜨는 모습 -->
				  	<img class="userprofile" width ="40" height="40"src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png">
				  </c:otherwise>
			  </c:choose>	
			 
			  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    
			  </button> 
			  
			  <div class="dropdown-menu">
				<c:if test ="${not empty userId }">
					<div class="mr-3">
						<b>${userNickname } 님 </b>
					</div>
				</c:if>
				
				
			  	<div class="dropdown-divider"></div>
			    <a class="dropdown-item" href="/user/mypage/view?id=${userId}" data-toggle="modal" data-target="#infoModal${userId }">MyPage</a>
			    <a class="dropdown-item" href="/lodging/reservelist/view?id=${userId}">ReservePage</a>
			    <a class="dropdown-item" href="/user/signout/">로그아웃</a>
			    
			   
			  </div>
			</div>
			</c:when>
			
			<c:otherwise><!-- 로그인 했을시 위에 드롭다운 버튼이 로그인 안됐을시 로그인 글씨가 -->
				<h3> <a href="/user/signin/view" class="text-white">로그인</a></h3>
			</c:otherwise>
			
			</c:choose>
			
			<!-- 헤더도 실제 여기어때 처럼 이쁘게 구상해볼것 -->



		</header>

        <!--2024-03-31 비밀번호 확인 모달
        <div class="modal fade" id="infoModal{userId}" tabindex="-1" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">비밀번호 확인</h5>
                    </div>
                    <div class="modal-body text-center">
                        <p id="contentInput" class="modalcontent">아이디: ${loginId}</p>
                        <input type="password" id="passwordInput" placeholder="비밀번호" class="form-control mt-4">
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="confirmBtn" class="btn btn-primary" data-dismiss="modal">확인</button>
                        <button type="button" id="closeBtn" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function() {
                $("#confirmBtn").on("click", function() {
                    let id = "${userId}"; // JSP 태그를 이용하여 userId 값을 가져옴
                    let password = $("#passwordInput").val();

                    $.ajax({
                        type: "get",
                        url: "/user/pw_check",
                        data: {"id": id, "password": password},
                        success: function(data) {
                            console.log(data);
                            if (data.result === "success") {
                                alert("비밀번호 확인 성공");
                                location.href = "/user/mypage/view?id=" + id;
                            } else {
                                alert("비밀번호 확인 실패");
                            }
                        },
                        error: function() {
                            alert("비밀번호 확인 오류");
                        }
                    });
                });
            });
        </script>
        -->

</body>
</html>