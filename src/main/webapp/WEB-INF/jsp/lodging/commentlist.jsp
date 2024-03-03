<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 댓글화면</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<!-- datepicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

	<!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<!-- 네이버 지도 api -->
	<script type="text/javascript" 
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wfkavb5t6s&submodules=geocoder"></script>
	
	<!-- 2024-02-04 수정내용 tui-pagination -->
	<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />

	<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
	
	<!-- 2024-02-16 추가내용 페이지네이션 -->
	<link rel="stylesheet" type="text/css" media="screen" href="/resources/css/tui-grid/tui-pagination.css">
	
	<style>
	
	</style>
</head>
<body>
	<div id = "wrap">
	
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="comment-page">
			<h1 class="text-center pt-3">
				<b>ChoongMo Tour Comment Page</b>
			</h1>
		
			<div class="d-flex  mt-4">
					<div class="lodging-profile2">
						<img class="profile" width="" src="${lodging.imagePath } " alt="호텔">
					</div>
						
					
						<div class="ml-3">
							<div class="d-flex">
								<c:choose>
									<c:when test = "${lodging.level eq '5성급' }">
										<h3 class="text-warning">${lodging.level }</h3><!-- 성급도 for문써서 해보기 -->
									</c:when>
									<c:when test = "${lodging.level eq '4성급' }">
										<h3 class="text-danger">${lodging.level }</h3><!-- 성급도 for문써서 해보기 -->
									</c:when>
									<c:when test = "${lodging.level eq '3성급' }">
										<h3 class="text-secondary">${lodging.level }</h3><!-- 성급도 for문써서 해보기 -->
									</c:when>
									<c:when test = "${lodging.level eq '2성급' }">
										<h3 class="text-success">${lodging.level }</h3><!-- 성급도 for문써서 해보기 -->
									</c:when>
									<c:when test = "${lodging.level eq '1성급' }">
										<h3 class="text-primary">${lodging.level }</h3><!-- 성급도 for문써서 해보기 -->
									</c:when>
								</c:choose>
								<div class="ml-3">
									<h3 class="font-weight-bold">${lodging.roomName }</h3>
								</div>
							
							</div>
							
							<div class="">
								<c:choose>
									<c:when test ="${lodging.areaName eq 'seoul'}">
										<h4 class="text-secondary">서울</h4>
									</c:when>
									<c:when test ="${lodging.areaName eq 'incheon'}">
										<h4 class="text-secondary">인천</h4>
									</c:when>
									<c:when test ="${lodging.areaName eq 'gangwon'}">
										<h4 class="text-secondary">강원</h4>
									</c:when>
									<c:when test ="${lodging.areaName eq 'gyeongsang'}">
										<h4 class="text-secondary">경상</h4>
									</c:when>
									<c:when test ="${lodging.areaName eq 'jeolla'}">
										<h4 class="text-secondary">전라</h4>
									</c:when>
									<c:when test ="${lodging.areaName eq 'busan'}">
										<h4 class="text-secondary">부산</h4>
									</c:when>
									<c:when test ="${lodging.areaName eq 'jeju'}">
										<h4 class="text-secondary">제주</h4>
									</c:when>
								</c:choose>
								<div class="search d-flex">
									<input id ="address" type ="text" class="form-control"placeholder="검색할 주소">
									<input id ="submit" type="button" class="btn btn-sm btn-primary" value="주소검색">
								</div>
								
								<div id="map" style="width:360px; height:290px;"></div>
							
							</div>
						
						</div>
					
				</div><br>
				
				<br>
		
				
				<ul class="nav nav-tabs"><!-- div class tab도가능 -->
				  <li class="nav-item">
				    <a class="nav-link text-dark" aria-current="page" href="/lodging/room/view?id=${lodging.id }"><b>객실리스트</b></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#"><b>리뷰</b></a>
				  </li>
				</ul>
				
			
		
		<div class="comment-list">
			<!-- 한 페이지당 표시 댓글 개수 셀렉터 연습해보기-->
			<select class="form-control col-5 mt-3" id="pageUnit" name="pageUnit">
							
                   <option value="">x개씩 표시</option>
                   <option value="10">10개씩 표시</option>
                   <option value="20">20개씩 표시</option>
                   <option value="50">50개씩 표시</option>
                   <option value="100">100개씩 표시</option>
                       
              </select>
			<c:forEach var="comment"  items = "${commentDetailList }">
			<div class="comment-box mt-3">
				
				<div class="comment">
				
				<div class=""><!-- 로그인한 사용자의 댓글일때만 보여주기  -->
					
					<c:choose>
						<c:when test="${userId eq comment.userId }">
							<div class="comment-delete mr-3">
								<i class="delete-btn bi bi-x-circle mt-2 ml-2" style="font-size :20px;" data-comment-id ="${comment.id }"></i>
							</div>
						</c:when>
						<c:otherwise>
							
						</c:otherwise>	
					</c:choose>	
					
				</div>
	
					<div class="comment-profile d-flex">
						<img class="userprofile mt-3 ml-3" width ="40" height="40"src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png">
						<div class="ml-3 mt-4"><b>${comment.nickname }</b></div>
					</div>
					<div class="comment-content ml-5 mt-2">
					<!--  
						<div class="ml-4">로징아이디${comment.lodgingId }</div>
						<div class="ml-4">유저아이디${comment.userId }</div>
					-->	
						<c:choose>
						
						<c:when test = "${comment.starpoint eq 1.0}">
							<div class="ml-4"><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/>&nbsp1.0</div>
						</c:when>
						<c:when test = "${comment.starpoint eq 2.0}">
							<div class="ml-4"><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/>&nbsp2.0</div>
						</c:when>
						<c:when test = "${comment.starpoint eq 3.0}">
							<div class="ml-4"><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/>&nbsp3.0</div>
						</c:when>
						<c:when test = "${comment.starpoint eq 4.0}">
							<div class="ml-4"><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="20"/>&nbsp4.0</div>
						</c:when>
						<c:when test = "${comment.starpoint eq 5.0}">
							<div class="ml-4"><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/><img src= "http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20"/>&nbsp5.0</div>
						</c:when>
						
						</c:choose>
						<div class="ml-4 mt-2 small text-secondary">${comment.size } 이용자</div>
						<div class="ml-4 mt-2">${comment.content }</div>
						
						
						<c:choose>
							<c:when test= "${not empty comment.imagePath }">
								<div class="comment-image ml-4 mt-2"><img width="400" height ="300"src="${comment.imagePath }"/></div>
							</c:when>
							<c:otherwise>
								<div class=""></div>
							</c:otherwise>
							
						</c:choose>
						
						<div class="ml-4 my-2 small text-secondary"><fmt:formatDate value ="${comment.createdAt }" pattern ="yyyy년 MM월 dd일"/></div>
					</div>
			
				</div>
			
			</div>
			</c:forEach>

	
		
		</div>
		<!--2024-02-03 수정 내용  tui-pagination 추가 -->
		<div id="pagination" class="tui-pagination"></div>
		
		</div>
		</section>
	</div>

	
	
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>

	<style>
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	</style>
	<script>
	
	
	
	
	
	//근데 댓글삭제도 아마 예약화면에서만 가능할텐데 잘모르겠다 이건.
	$(document).ready(function(){
		
	
	
	//한 화면에 댓글 갯수 표시	
	$("#pageUnit").on("click", function(){
		
		let list_size = $(this).val();
		
		console.log("한 화면에 x 개씩 댓글 조회" + list_size);
		
		//alert(number);
	});
		
		
	$(".delete-btn").on("click", function(){
			
			let id = $(this).data("comment-id");
			
			//alert(id);
			
			
			$.ajax({
				type:"get"
				, url:"/lodging/comment/delete"
				, data:{"id": id}
				, success:function(data){
					if(data.result == "success"){
						alert("댓글 삭제 성공");
						location.reload();
					} else {
						alert("댓글 삭제 실패");
					}
				}	
				, error:function(){
					alert("댓글 삭제 오류");
				}
				
				
			});
			
			
			
		});
		
		
		//지도를 그려주는 함수 실행
		 selectMapList();

		 //검색한 주소의 정보를 insertAddress 함수로 넘겨준다.
		 function searchAddressToCoordinate(address) {
		     naver.maps.Service.geocode({
		         query: address
		     }, function(status, response) {
		         if (status === naver.maps.Service.Status.ERROR) {
		             return alert('Something Wrong!');
		         }
		         if (response.v2.meta.totalCount === 0) {
		             return alert('올바른 주소를 입력해주세요.');
		         }
		         var htmlAddresses = [],
		             item = response.v2.addresses[0],
		             point = new naver.maps.Point(item.x, item.y);
		         if (item.roadAddress) {
		             htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
		         }
		         if (item.jibunAddress) {
		             htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
		         }
		         if (item.englishAddress) {
		             htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
		         }

		         insertAddress(item.roadAddress, item.x, item.y);
		         
		     });
		 }

		 // 주소 검색의 이벤트
		 $('#address').on('keydown', function(e) {
		     var keyCode = e.which;
		     if (keyCode === 13) { // Enter Key
		         searchAddressToCoordinate($('#address').val());
		     }
		 });
		 $('#submit').on('click', function(e) {
		     e.preventDefault();
		     searchAddressToCoordinate($('#address').val());
		 });
		 naver.maps.Event.once(map, 'init_stylemap', initGeocoder);


		     
		 //검색정보를 테이블로 작성해주고, 지도에 마커를 찍어준다.
		 function insertAddress(address, latitude, longitude) {
		 	var mapList = "";
		 	mapList += "<tr>"
		 	mapList += "	<td>" + address + "</td>"
		 	mapList += "	<td>" + latitude + "</td>"
		 	mapList += "	<td>" + longitude + "</td>"
		 	mapList += "</tr>"

		 	$('#mapList').append(mapList);	

		 	var map = new naver.maps.Map('map', {
		 	    center: new naver.maps.LatLng(longitude, latitude),
		 	    zoom: 14
		 	});
		     var marker = new naver.maps.Marker({
		         map: map,
		         position: new naver.maps.LatLng(longitude, latitude),
		     });
		 }

		 //지도를 그려주는 함수
		 function selectMapList() {
		 	
		 	var map = new naver.maps.Map('map', {
		 	    center: new naver.maps.LatLng(37.3595704, 127.105399),
		 	    zoom: 10,
		 	    scaleControl: false,
		        logoControl: false,//지도 축소 확대바
		        mapDataControl: false,
		        zoomControl: true,
		 	});
		 }


		 // 지도를 이동하게 해주는 함수
		 function moveMap(len, lat) {
		 	var mapOptions = {
		 		    center: new naver.maps.LatLng(len, lat),
		 		    zoom: 15,
		 		    mapTypeControl: true
		 		};
		     var map = new naver.maps.Map('map', mapOptions);
		     var marker = new naver.maps.Marker({
		         position: new naver.maps.LatLng(len, lat),
		         map: map
		     });
		 }
		
		 
		 // 2024-03-03 list_size
		 $("#page_unit").on("input", function(){
			
			 list_size = $(this).val();//페이지당 몇명씩 보여줄 것인지
			 //셀렉터를 클릭과동시에 새로고침 되어야 함.
		 });
		 
		//페이지네이션  2024-02-03 수정 내용 
		const Pagination = require('tui-pagination');
		
		const dataSource = {
				  contentType: 'application/json',
				  api: {
				    readData: { url: '/api/readData', method: 'GET'}
				  }
				};
		
		function setPagination(id, obj){
			var _pagination = new tui.Pagination(id, {
			       totalItems : obj.totalData,
			       itemsPerPage : list_size,// pageSize->list_size를 넣으면 셀렉터에서 선택한 밸류값에 따른 전체 페이지수 10개일때 1368페이지, 20개일때 684페이지 50개일때 274페이지
			       visiblePages : 10, // 하단에 보여지는 페이지수
			       page : 1,
			       centerAlign : true 
			    });
			 _pagination.on('beforeMove', function(eventData){//클릭전값
					showPage = eventData.page;
					getDatatInfo();
					/*
					console.log(eventData);//{page: 1368}  현재 페이지가 뜬다.

					console.log(showPage);//1368이라고 뜬다. 현재 페이지가 뜬다.
					console.log(list_size);//한 화면에 표시될 갯수


					console.log(obj.totalData);//전체 데이터

					//현재 페이지가 마지막 페이지 일때 나머지 갯수 만큼 보여줘라. 13678데이터 일때 list_size 20일경우 마지막 페이지에서 18개가 나와야 함 50일때 28개 이렇게
					if(showPage == Math.ceil(obj.totalData / list_size)){
						console.log("마지막페이지");
					}
					*/
		});
	    
	    _pagination.on('afterMove', function(eventData) {//클릭후값
	            //alert('The current page is ' + eventData.page);

	    });
			
		}
		
	});
	
	</script>

</body>
</html>