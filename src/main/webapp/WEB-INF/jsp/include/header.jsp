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
			<h1 class="ml-3 text-white">ChoongMo Tour</h1>
			
			
			<c:choose>
			<c:when test="${not empty userId }">
			<div class="btn-group">
			<!-- 프로필사진이 있을때 없을때 -->
			  <c:choose>
			  <c:when test="${not empty userImagePath }"><!-- 있을때 -->
			  	<img class="userprofile" src="${userImagePath}">
			  </c:when>
			  <c:otherwise><!-- 없을때 -->
			  	<img class="userprofile" width ="40" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png">
			  </c:otherwise>
			  </c:choose>	
			
			  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    Action
			  </button>
			  
			  
			  <div class="dropdown-menu">
				<c:if test ="${not empty userId }">
				<div class="mr-3">
					${userNickname } 님 
				</div>
				</c:if>
				
				
			  	<div class="dropdown-divider"></div>
			    <a class="dropdown-item" href="/user/mypage/view">MyPage</a>
			    <a class="dropdown-item" href="#">ReservePage</a>
			    <a class="dropdown-item" href="/user/signout/">로그아웃</a>
			    
			   
			  </div>
			</div>
			</c:when>
			<c:otherwise><!-- 로그인 했을시 위에 드롭다운 버튼이 로그인 안됐을시 로그인 글씨가 -->
				<h4> <a href="/user/signin/view">로그인</a></h4>
			</c:otherwise>
			
			</c:choose>
			
			<!-- 헤더도 실제 여기어때 처럼 이쁘게 구상해볼것 -->
		</header>

</body>
</html>