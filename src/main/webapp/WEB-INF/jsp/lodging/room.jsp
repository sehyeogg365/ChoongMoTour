<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   <!-- 포맷라이브러리 추가 -->      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 객실화면</title>
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
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wfkavb5t6s"></script>
</head>
<body>
	<div id = "wrap">
	
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="room-page">
				<h1 class="text-center">
					ChoongMo Tour Room Page
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
									<h2 class="font-weight-bold">${lodging.roomName }</h2>
								</div>
							
							</div>
							<br>
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
								<div id="map" style="width:400px; height:300px;"></div>
							</div>
						
						</div>
						
					
		
					
					
				</div><br>
				
				<br>
				
				<ul class="nav nav-tabs"><!-- div class tab도가능 -->
				  <li class="nav-item">
				    <a class="nav-link active" aria-current="page" href="/lodging/room/view?id=${lodging.id }">객실리스트</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link " href="/lodging/commentlist/view?lodgingId=${lodging.id }">리뷰</a>
				  </li>
			
			
				</ul>
				
				<label class="mt-3">체크인 </label>
		        <input type="text" id="startDate" class="" name="startDate" value="" autocomplete="off"><!--각각 객체를 만들어야 하므로 id값 부여.-->
		        <label class="mt-3">체크아웃 </label>
		        <input type="text" id="endDate" class="" name="endDate" value= " " autocomplete="off"><br><!-- input type을 텍스트로 해서 저장이안됐나?? -->
				<!-- 여기서 폼태그 활용해보기 객실페이지서 예약페이지 넘어갈때 원래 딱 버튼눌렀을때 그다음 페이지 들어갈게 없을때 api쓰는게 좋다고 함(?) 그래서 폼태그였다가 api로 바꾼건데.. -->
				
				
				<!-- 객실리스트 시작 -->
				<div class="room-card-list">
					<!-- 객실 카드 -->
	
					<c:forEach var="room" items="${roomList }">
					<div class="room-card d-flex mt-3 mx-3">
						<div class="room-profile ml-3 mt-3">
							<img class="profile" width="" src="${room.imagePath }" alt="호텔">
						</div>
							
						<div class="room-card-body ml-3 mt-3">
							<div class="d-flex justify-content-between">
								<c:choose>
									<c:when test="${room.size eq 'singleroom' }">
										<div class="ml-4"><strong>싱글룸</strong></div>
									</c:when>
									<c:when test="${room.size eq 'doubleroom' }">
										<div class="ml-4"><strong>더블룸</strong></div>
									</c:when>
									<c:when test="${room.size eq 'twinroom' }">
										<div class="ml-4"><strong>트윈룸</strong></div>
									</c:when>
									<c:otherwise>
										<div class="ml-4">${room.size }</div>
									</c:otherwise>
								</c:choose>	
								<p class="ml-4"><strong><fmt:formatNumber value= "${room.price }" type="currency" currencySymbol =""/>원</strong></p>
							</div>	
							<div class = "buttonlist text-center mt-5">											<!-- data-toggle="modal"을 부여하면 modal을 띄울 준비가 되고 data-target="DOM선택자"를 입력하면 지정된 내용을 modal로 띄울 수 있다 -->
								<button id = "infomodalBtn" type="button"  class="btn btn-primary info-modal-btn btn-sm col-11"  data-toggle="modal" data-target="#moreModal${room.id }" data-room-id="${room.id }">상세정보</button><br>
								<a href="/lodging/reservation/view?roomId=${room.id }&lodgingId=${lodging.id}" class="btn btn-primary reserve-btn btn-sm mt-3 col-11" type="button" data-room-id="${room.id }">예약하기</a>
							</div>																				<!-- 우선 모달을위해 들어가는 값들 이렇게 두개가 있다고 함 data-toggle="modal" data-target="#moreModal" 타겟은 그 id가 들어가는 모달인데 id마다 각각버튼마다 각각 다른 모달들이 1:1 매칭이 되어야 한다. 이값과 밑에 값 수정해보기 -->				
						</div>
					</div>
					
					
					<!-- Button trigger modal -->
		
					<!-- Modal -->		<!-- class에 info-modal 이렇게 해서 안지워지는 오류가 생긴거였음 -->		<!-- 모달사이즈 -->
					
					<!-- 객실 사이즈 별로 다른 모달을 띄워버리자 차라리 -->
				
						
							<div class="modal fade" id="moreModal${room.id }" tabindex="-1" aria-labelledby="myLargeModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered" role="document">
							    <div class="modal-content">
							       <div class="modal-header">
							        <h5 class="modal-title">객실 이용 안내</h5>
							        
					     			 </div>	
							
							      <div class="modal-body text-center">
							       <p id="contentInput${room.id }" class="modalcontent">${room.content }</p> <!-- 동떨어진 하나의 태그기때문에 쓸수 있는정보가 암것도 없다. -->
							      
							     	
							      </div><!-- 객체화시켜야 하므로 아이디 부여 --><!-- 속성을 동적으로 추가할려면? -->
							      <div class="modal-footer">
					        
					        		<button type="button" id="closeBtn "class="btn btn-secondary" data-dismiss="modal">닫기</button>
					      		  </div>
							   
							    </div>
							  </div>
							</div>	
						
	
					
					
					</c:forEach> 
			<!-- 객실리스트 끝 -->
				
				
				
					
					
					
					
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
	 $(document).ready(function() {
		 
		 var map = new naver.maps.Map("map", {
			    center: new naver.maps.LatLng(37.3595316, 127.1052133),
			    zoom: 15,
			    mapTypeControl: true, 
			    scaleControl: false,//컨트롤러
		        logoControl: false,//컨트롤러
		        mapDataControl: false,//컨트롤러
		        zoomControl: true,//컨트롤러
			});
			
			var infoWindow = new naver.maps.InfoWindow({
			    anchorSkew: true
			});

			map.setCursor('pointer');

			function searchCoordinateToAddress(latlng) {

			    infoWindow.close();

			    naver.maps.Service.reverseGeocode({
			        coords: latlng,
			        orders: [
			            naver.maps.Service.OrderType.ADDR,
			            naver.maps.Service.OrderType.ROAD_ADDR
			        ].join(',')
			    }, function(status, response) {
			        if (status === naver.maps.Service.Status.ERROR) {
			            return alert('Something Wrong!');
			        }

			        var items = response.v2.results,
			            address = '',
			            htmlAddresses = [];

			        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
			            item = items[i];
			            address = makeAddress(item) || '';
			            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

			            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
			        }

			        infoWindow.setContent([
			            '<div style="padding:10px;min-width:200px;line-height:150%;">',
			            '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
			            htmlAddresses.join('<br />'),
			            '</div>'
			        ].join('\n'));

			        infoWindow.open(map, latlng);
			    });
			}

			function searchAddressToCoordinate(address) {
			    naver.maps.Service.geocode({
			        query: address
			    }, function(status, response) {
			        if (status === naver.maps.Service.Status.ERROR) {
			            return alert('Something Wrong!');
			        }

			        if (response.v2.meta.totalCount === 0) {
			            return alert('totalCount' + response.v2.meta.totalCount);
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

			        infoWindow.setContent([
			            '<div style="padding:10px;min-width:200px;line-height:150%;">',
			            '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4><br />',
			            htmlAddresses.join('<br />'),
			            '</div>'
			        ].join('\n'));

			        map.setCenter(point);
			        infoWindow.open(map, point);
			    });
			}

			function initGeocoder() {
			    map.addListener('click', function(e) {
			        searchCoordinateToAddress(e.coord);
			    });

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

			    searchAddressToCoordinate('정자동 178-1');
			}

			function makeAddress(item) {
			    if (!item) {
			        return;
			    }

			    var name = item.name,
			        region = item.region,
			        land = item.land,
			        isRoadAddress = name === 'roadaddr';

			    var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

			    if (hasArea(region.area1)) {
			        sido = region.area1.name;
			    }

			    if (hasArea(region.area2)) {
			        sigugun = region.area2.name;
			    }

			    if (hasArea(region.area3)) {
			        dongmyun = region.area3.name;
			    }

			    if (hasArea(region.area4)) {
			        ri = region.area4.name;
			    }

			    if (land) {
			        if (hasData(land.number1)) {
			            if (hasData(land.type) && land.type === '2') {
			                rest += '산';
			            }

			            rest += land.number1;

			            if (hasData(land.number2)) {
			                rest += ('-' + land.number2);
			            }
			        }

			        if (isRoadAddress === true) {
			            if (checkLastString(dongmyun, '면')) {
			                ri = land.name;
			            } else {
			                dongmyun = land.name;
			                ri = '';
			            }

			            if (hasAddition(land.addition0)) {
			                rest += ' ' + land.addition0.value;
			            }
			        }
			    }

			    return [sido, sigugun, dongmyun, ri, rest].join(' ');
			}

			function hasArea(area) {
			    return !!(area && area.name && area.name !== '');
			}

			function hasData(data) {
			    return !!(data && data !== '');
			}

			function checkLastString (word, lastString) {
			    return new RegExp(lastString + '$').test(word);
			}

			function hasAddition (addition) {
			    return !!(addition && addition.value);
			}

		 
		document.getElementById('startDate').value = new Date().toISOString().substring(0, 10);
		
		var now = new Date();
		document.getElementById('endDate').value = new Date(now.setDate(now.getDate()+1)).toISOString().substring(0, 10);
		
		 
		 //document.getElementById('endDate').value = new Date(startDate.setDate(startDate.getDate()+1)).toISOString().substring(0, 10);
		 
		 //newDate거는 시간 날자를 구한담에 10까지 잘라내라 이런뜻임 newDate안의 객체에서+1하는거를 찾아보기.
		
		 
		 
		 //예약버튼 
		 $(".reserve-btn").on("click", function(){
			
			 let startDate = $(this).val();
			 let endDate = $(this).val();
			 
		 });
		
		// $(".info-modal-btn").on("click", function(){
		//	 
		//	 let id = $(this).data("room-id");
		//	 
		//	 let content = ("#contentInput" + id).val();
		//	 
		//	 
		// });
 
		 $("#startDate").datepicker({//datepicker 요일 한글로 검색
             dateFormat:"yy년 mm월 dd일",
            
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
             currentText: '오늘 날짜' , 
             todayHighlight :true,// 오늘을 표시해줄지. default 가 false
             showButtonPanel:true,
             closeText: 'done',
             minDate: 0,//오늘날짜 부터
             language: 'ko',
             onSelect:function(selectedDate) {
                 
                 $("#endDate").datepicker("option", "minDate", selectedDate);

                 }

         });
		// todayHighlight :true,
       

         $("#endDate").datepicker({//종료일
             dateFormat:"yy년 mm월 dd일",
           
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
             currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
             showButtonPanel:true,//버튼보이기
             closeText: 'done',
             minDate:'+1D',//오늘날짜 다음 부터
             language: 'ko',
             //beforeShow: customRange
              onSelect:function(selectedDate) {
                 
                 $("#startDate").datepicker("option", "maxDate", selectedDate );
                 
             
              }
            

         });
		 
		 
	 });
	</script>


</body>
</html>