<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 관리자 사용자관리</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

	<!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/adminheader.jsp"/>

	    <section class="contents d-flex justify-content-center">
            <div class="my-page">
                <h1 class="text-center pt-3 font-weight-bold">
                    ChoongMo Tour Admin User List
                </h1>

                <div class="mypagecontents d-flex mx-5">
                <aside class="side-nav col-2 ">
                    <ul class="nav flex-column">
                        <li class="nav-item mt-2">

                            <h5><b><a href="/admin/mypage/view?id=${adminId }" class="nav-link text-white">내 정보수정</a></b></h5>
                        </li>

                        <li class="nav-item mt-2">
                            <h5><b><a href="/admin/userAdmin/view" class="nav-link text-primary">사용자 관리</a></b></h5>
                        </li>

                    </ul>
                </aside>

                <section class="contents1 col-10">
                    <div class="info-input-box mx-5">

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


	});
	</script>


</body>
</html>