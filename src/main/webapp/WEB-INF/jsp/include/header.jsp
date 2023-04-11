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
			
			<c:if test ="${not empty userId }">
			<div class="mr-3">
				${userNickname } 님 <a href="/user/signout/">로그아웃</a>
			</div>
			</c:if>
			<!-- 헤더도 실제 여기어때 처럼 이쁘게 구상해볼것 -->
		</header>

</body>
</html>