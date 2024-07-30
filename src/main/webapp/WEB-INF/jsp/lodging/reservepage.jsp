<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>         
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   <!-- 포맷라이브러리 추가 -->     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 예약 페이지</title>
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
	
</head>
<body>
	<div id = "wrap">
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="reserve-page">
				<h1 class="text-center pt-3">
					<b>ChoongMo Tour Reserve Page</b>
				</h1>
			
				
				<div class="reservepagecontents ">
				
					<!-- 보다시피 룸아이디가 안받아와지고 있는상황 -->
					<!-- 어제와 같은상황 유저아이디가 2인 고트로 접속했는데 1이뜨는상황 그렇다 룸아이디랑 유저아이디가 바뀌어 나오는상황 -->
					<div class="mt-3 ml-3 "><h2 class=""><strong>${lodging.roomName }</strong></h2></div><br>
						<c:choose>
							<c:when test="${room.size eq 'singleroom' }">
								<h3 class="ml-3"><strong>싱글룸</strong></h3>
							</c:when>
							<c:when test="${room.size eq 'doubleroom' }">
								<h3 class="ml-3"><strong>더블룸</strong></h3>
							</c:when>
							<c:when test="${room.size eq 'twinroom' }">
								<h3 class="ml-3"><strong>트윈룸</strong></h3>
							</c:when>
							<c:otherwise>
								<div class="ml-3"><h3><strong>${room.size }</strong></h3></div>
							</c:otherwise>
						</c:choose>	
					
					<div class="d-flex  mx-3 justify-content-center align-items-center">
						<label class="mt-4 text-secondary">체크인 </label>
		        		<input type="text" id="startDate" name="startDate" class="mt-4 col-4" value="" autocomplete="off"><!--각각 객체를 만들어야 하므로 id값 부여.-->
		        		<div class="mt-4 mx-3">
		        		~
		        		</div>
		        		
		        		
		        		<label class="mt-4 text-secondary">체크아웃 </label>
		        		<input type="text" id="endDate" name="endDate" class="mt-4 col-4"value= " " autocomplete="off"><br><!-- input type을 텍스트로 해서 저장이안됐나?? -->
					</div>
					
					<div class = "mx-3 ">
						<label class="input-lable mt-4 text-secondary">예약자 이름</label><input type="text" id="nameInput" class="form-control text-secondary" value = "${user.name }" class="form-control ">
					
					
						<label class="input-lable mt-4 text-secondary">전화번호</label><input type="text" id="phoneNumberInput" class="form-control text-secondary" value = "${user.phoneNumber}" class="form-control ">
					</div>
					<hr>
					
					<div class="col-5 d-flex">
						<label class="mt-3 mr-3 text-secondary">총 결제 금액 <strong class="text-dark"><fmt:formatNumber value= "${room.price }" type="currency" currencySymbol =""/>원</strong></label> <!-- 이것도 fmt활용해보기 -->
					</div>
					
					<hr>
					<div class="payselect mt-4 mx-3">
						<div class=""> <b style="font-size: 20px">결제수단을 선택하세요.</b> </div>
						<select class="form-control col-5 mt-3" id="paySelector">
							
                            <option value="">결제수단</option>
                            <option value="카카오페이">카카오페이</option>
                            <option value="네이버페이">네이버페이</option>
                            <option value="삼성페이">삼성페이</option>
                            <option value="카드">카드</option>
                       
                 		</select>
					
					</div>
					
					<div class="check-box form-control mt-4">
						<input type="checkbox" id="allCheck" s><label class="ml-2"><b>전체 선택</b></label> <br>
				        <input type="checkbox" name="check" value="check1" id="check1" class=""><label class="ml-2">개인정보 활용 동의</label><br><!-- 이제보니 여기도 밸류값 잘못됨 -->
				        <input type="checkbox" name="check" value="check2" id="check2"><label class="ml-2">서비스 이용 동의</label><br>
				        <input type="checkbox" name="check" value="check3" id="check3"><label class="ml-2">마케팅 활용 동의</label>
					
					</div>
					
					
					<div class="text-center mt-3">
					
						<button id = "payBtn" type="submit"  class="btn btn-danger col-8 mb-3" data-room-id = "${room.id}" >결제하기</button>
					</div>
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

		document.getElementById('startDate').value = new Date().toISOString().substring(0, 10);
		
		var now = new Date();
		document.getElementById('endDate').value = new Date(now.setDate(now.getDate()+1)).toISOString().substring(0, 10);
		//여기선 오늘날짜 내일날짜를 고르게 해선 안된다. url 파라미터상의 데이터를 추출해야 한다.

        // URL 파라미터를 추출하는 함수
        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        // URL에서 startDate와 endDate 파라미터 추출
        var startDate = getParameterByName('startDate');
        var endDate = getParameterByName('endDate');

		$("#payBtn").on("click", function(){


			let id = $(this).data("room-id");

			//let startDate = $(this).val();
			var result = confirm("예약 하시겠습니까?");
			
			if(result){
				//alert(""); 아무것도 안쓰면 바로 추가성공이 뜬다.
			} else {
				return ;
			}
			
			let startDate = $("#startDate").val();

			let endDate = $("#endDate").val();

			let phoneNumber = $("#phoneNumberInput").val();

			let name = $("#nameInput").val();

			let payment = $("#paySelector").val();


			if(name == ""){

				alert("이름을 입력하세요.");

				return ;

			}

			if(phoneNumber == ""){

				alert("전화번호를 입력하세요.");

				return ;

			}

			if(payment == ""){

				alert("지불수단을 선택하세요.");

				return ;

			}

			//전체 하나만 눌려도 유효성검사 통과 이며 그 반대로 세개만 눌려도 통과가되게끔 

 
			if(!$("input:checked[id='check1']").is(":checked")){

	            alert("체크박스를 선택해주세요.");

	            return ;

	        } 
			if(!$("input:checked[id='check2']").is(":checked")){

	            alert("체크박스를 선택해주세요.");

	            return ;

	        } 
			if(!$("input:checked[id='check3']").is(":checked")){

	            alert("체크박스를 선택해주세요.");

	            return ;

	        } 

			//여기및에는 세개중 하나를 선택안했을시에 뜨게 한다.


			//유효성검사 이름, 전화번호, 결제수단, 전체 동의 

			//alert(id);

			//alert(name);//O

			//alert(phoneNumber);//O

			//alert(payment);//O

			//alert(startDate);//O

			//alert(endDate);//O

			$.ajax({//우선여기부터 하자.

				type:"post"

				, url:"/lodging/reserve" //userId는 세션값이라서 빼도되는건가? 다오에서도 뻈다.

				, data:{"roomId":id, "name" : name, "phoneNumber":phoneNumber, "payment":payment, "startDate" : startDate, "endDate" : endDate}//여기실수로 네임을 안넣었다.

				, success:function(data){

					if(data.result == "success"){

						location.href="/lodging/reservelist/view";

						alert("예약 성공");

					} else {

						alert("예약 실패");

					}

				}

                , error:function(){

                    alert("예약 에러");

                }

			});

		});
		
		 $("#startDate").datepicker({//datepicker 요일 한글로 검색
             dateFormat:"yy-mm-dd",
            
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
             currentText: '오늘 날짜' , 
             todayHighlight :true,// 오늘을 표시해줄지. default 가 false
             showButtonPanel:true,
             closeText: 'done',
             minDate: 0,//오늘날짜 부터
             onSelect:function(selectedDate) {
                 
                 $("#endDate").datepicker("option", "minDate", selectedDate);

             }

         });
		// todayHighlight :true,
       

         $("#endDate").datepicker({//종료일
             dateFormat:"yy-mm-dd",
           
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
             currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
             showButtonPanel:true,//버튼보이기
             closeText: 'done',
             minDate:'+1D',//오늘날짜 다음 부터
             //beforeShow: customRange
             onSelect:function(selectedDate) {
                 
                $("#startDate").datepicker("option", "maxDate", selectedDate );

             }

         });

         // URL 파라미터 값으로 Date Picker 초기값 설정
         if (startDate) {
             $("#startDate").datepicker("setDate", startDate);
         }
         if (endDate) {
             $("#endDate").datepicker("setDate", endDate);
         }

		
         var chkList = $("input[name = check]");
		 $("#allCheck").on("change", function() {
             // 내 자신이 체크 되었는지 안되었는지
             if($(this).is(":checked")) {
                 $("input[name='check']").prop("checked", true);
             } else {
                 $("input[name='check']").prop("checked", false);
             }

         });

	});
	
	
	</script>


</body>
</html>