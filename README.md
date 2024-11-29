# ChoongMoTour

배포중단 알림

이프로젝트는 AWS 프리티어 지원 종료로 인해 배포가 종료되었습니다.

## 📖목차
  * [개발환경](#개발환경) <br>
  * [Skills](#Skills)<br>
  * [ERD](#ERD)<br>
  * [만든계기](#만든계기)<br>
  * [화면구성](#화면구성)<br>
  * [핵심기능](#핵심기능)<br>
    * [숙소추가](#숙소추가)
    * [숙소수정](#숙소수정)
    * [숙소삭제](#숙소삭제)
    * [객실추가](#객실추가)
    * [객실수정](#객실수정)
    * [찜&찜취소](#찜찜취소)
    * [예약&예약취소](#예약예약취소)
    * [댓글작성&삭제](#댓글작성삭제)
    * [네이버지도 api](#네이버지도-api)
    * [정렬모달](#정렬모달)

## 개발환경
<div class="d-flex">
 <img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=Spring&logoColor=white"/>
 <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=MySQL&logoColor=white"/>
 <img src="https://img.shields.io/badge/Sourcetree-0052CC?style=flat-square&logo=sourcetree&logoColor=white"/>
 <img src="https://img.shields.io/badge/Intellij IDEA-000000?style=flat-square&logo=Intellij IDEA&logoColor=white"/> 
</div>

## Skills💪
 JAVA
 <img src="https://img.shields.io/badge/JAVA-4479A1?style=flat-square&logo=JAVA&logoColor=white"/>
  
 HTML5  
<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=HTML5&logoColor=white"/>
 
 CSS3
 <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=CSS3&logoColor=white"/>
  
JAVASCRIPT 
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=JavaScript&logoColor=white"/>
  
JQuery
<img src="https://img.shields.io/badge/jQuery-0769AD?style=flat-square&logo=jQuery&logoColor=white"/>
  
MY SQL
<img src="https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=MySQL&logoColor=white"/>
  
Jsp Servlet
<img src="https://img.shields.io/badge/JSP Servlet-232F3E?style=flat-square&logo=JSP Servlet&logoColor=white"/>
  
Jsp Servlet
<img src="https://img.shields.io/badge/JSP Servlet-232F3E?style=flat-square&logo=JSP Servlet&logoColor=white"/>
   
Spring Boot
<img src="https://img.shields.io/badge/Spring Boot-6DB33F?style=flat-square&logo=Spring Boot&logoColor=white"/>
  
Bootstrap
<img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat-square&logo=Bootstrap&logoColor=white"/>

Git Hub
<img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=GitHub&logoColor=white"/>
  
AWS
<img src="https://img.shields.io/badge/aws-232F3E?style=flat-square&logo=amazonwebservices&logoColor=white"/>

Gradle
<img src="https://img.shields.io/badge/Gradle-02303A?style=flat-square&logo=Gradle&logoColor=white"/>

백엔드
* Java 11
* SpringBoot 3.4.0

프론트엔드
* Html5/css3
* Javascript
* Bootstrap 5

빌드 툴
* Gradle

데이터베이스
* MySQL

인프라
* AWS EC2

라이브러리
* 네이버 지도 api 

<a href="https://www.miricanvas.com/v/118g5f1">포트폴리오</a><br>
<a href="https://docs.google.com/spreadsheets/d/1ulS-dG7vU--vupX4izbBoyuIOq97HsWBosX10JA7HQY/edit?gid=0#gid=0">설계서</a>

## ERD
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Frb1rh%2FbtsKYZ1T2yP%2FPU04qbTXg4AZEjVe2FUcoK%2Fimg.png"/>

## 만든계기
숙소예약 홈페이지에 대한 실제 서비스를 알아보고 싶고, 이 기능들을 구현할 때 어떻게 구현되는지에 대한 호기심이 생기고, 코딩에 대한 강력한 열정이라고 볼수 있습니다.

## 화면구성
| 회원가입 | 로그인화면 | 관리자 메인페이지 | 숙소추가화면 |
| ----------------------- | ----------------------- | ----------------------- | ----------------------- |
|<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbZv3hC%2FbtsKZc2cI1e%2FS6Msb9mo3EakWobiavJBi1%2Fimg.png" width="200px" height="200px"/>| <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FmqYzc%2FbtsKX536ryq%2Fz8axNokcKdCvLMOpY6IUik%2Fimg.png" width="200px" height="200px"/>| <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FGRjBf%2FbtsKZAV3Tdp%2FggioKukG71ciJlkOwKCQp0%2Fimg.png" width="200px" height="200px"/>  | <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fco9eiE%2FbtsKZcnBoRK%2FJ1Xv57e29kM57SGw4OaNWK%2Fimg.png" width="200px" height="200px"/> |

| 숙소수정화면 | 객실추가화면 | 객실수정화면 | 아이디/비번찾기 |
| ----------------------- | ----------------------- | ----------------------- | ----------------------- |
|<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb0tmvV%2FbtsKY0npC3h%2F5KDv7MfqeiTOKpVlbzAlj1%2Fimg.png" width="200px" height="200px"/>| <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FAorjT%2FbtsK0oHm6AB%2FkfMesqGbLpMmdP5291jxeK%2Fimg.png" width="200px" height="200px"/>| <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fp5ptz%2FbtsKYXROVLy%2FwoQllN2W7f5FAdb8W2p3p0%2Fimg.png" width="200px" height="200px"/>  | <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FYKYDJ%2FbtsKZ70aWYX%2FUmirYeXtT4Nn7Ahk6f8Uhk%2Fimg.png" width="200px" heighth="200px"/> |

| 사용자메인페이지 | 마이페이지 | 숙소리스트 | 객실리스트 |
| ----------------------- | ----------------------- | ----------------------- | ----------------------- |
|<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcWwOu6%2FbtsK0lw64Ug%2FONsXgKAeYXLp8jkoejVBk1%2Fimg.png" width="200px" height="200px"/>| <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdP1bKa%2FbtsKZ5OOceu%2FoEWWoVvePQ1re9JnTC3wb1%2Fimg.png" width="200px" height="200px"/>| <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcGgcny%2FbtsKZ6fWso6%2FHUKABXtfQq4YQSfnm6MmF0%2Fimg.png" width="200px" height="200px"/>  | <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcAbGly%2FbtsKX9rVyHS%2FKhe3jcAq4TnFRXab0SP861%2Fimg.png" width="200px" heighth="200px"/> |

| 찜목록 | 예약페이지 | 예약목록 | 댓글목록 |
| ----------------------- | ----------------------- | ----------------------- | ----------------------- |
|<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbr8Mv4%2FbtsKZvUJO1W%2FD1EZuhB8MRjkk83SuxTWI1%2Fimg.png" width="200px" height="200px"/>| <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FnAJZq%2FbtsKZPMbJ8I%2FPqSAl9HtEHZiu4urhjpzxk%2Fimg.png" width="200px" height="200px"/>| <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FQ1rTH%2FbtsKY4i40mz%2FP8q0oIDwfhREPzmodSitK0%2Fimg.png" width="200px" height="200px"/>  | <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FEcrfq%2FbtsK0n2Mgcu%2Ff6WLYIJT4DVMJfS14hi5f1%2Fimg.png" width="200px" heighth="200px"/> |

## 핵심기능⭐
### 숙소추가

 * 숙소를 추가하기 위해서 우선 관리자 페이지에 로그인이 필요하다.

이미지 파일이 필수며, 유효성 검사에서 추가시켰다.

이미지 파일, 숙소 명, 지역, 등급을 입력해야만 한다.

그리고 비즈니스 로직을 관리하는 클래스에서 파일을 저장시키게 하는 파일매니저 서비스 메서드를 사용해서
파일명이 중복이 안되게끔 관리자 아이디 값을 넣어서 저장을 시켰다.
  * <a href="https://github.com/sehyeogi365/ChoongMoTour/blob/master/src/main/java/com/marondal/choongmotour/lodging/LodgingRestController.java">숙소추가</a>


### 숙소수정

 * 이전에 추가한 숙소를 수정하는 기능이다.

업로드 한 이미지 파일 제외하고 뭐든지 수정이 가능하게 끔 만들었다.

해당하는 id, 해당하는 숙소를 조회해,  자기가 수정하고 싶으면, 숙소 명, 성급, 지역명을 수정하는 기능이다.

숙소 id를 url 파라미터로 받아 해당하는 숙소 정보 한행을 조회해서, 그것을 자기가 수정하고 싶으면 숙소 명, 성급, 지역명으로 수정하는 기능이다.

api 서 수정된 행의 개수 결과가 1이냐 아니냐에 따라 result라는 키로 success fail 형태 값으로 전달한다. 제이슨 문자열로 리스폰스를 통해서
  * <a href="https://github.com/sehyeogi365/ChoongMoTour/blob/master/src/main/java/com/marondal/choongmotour/lodging/LodgingRestController.java">숙소수정</a>


### 숙소삭제

 * 하나의 숙소 카드에 있는 삭제 버튼을 클릭하면, 해당하는 숙소가 삭제되는 기능이다.

숙소 id 값을 파라미터로 잡은 후 해당하는 id의 숙소를 삭제하는 원리다.

비즈니스 로직을 관리하는 클래스로부터 삭제된 행의 개수를 리턴한다.
api 서 삭제된 행의 개수 결과가 1이냐 아니냐에 따라 result라는 키로 success fail 형태 값으로 전달한다. 제이슨 문자열로 
리스폰스를 통해서
  * <a href="https://github.com/sehyeogi365/ChoongMoTour/blob/master/src/main/java/com/marondal/choongmotour/lodging/LodgingRestController.java">숙소삭제</a>


### 객실추가

 * 자신이 객실을 추가시키고 싶은 숙소의 객실 추가 버튼을 클릭하면 그 숙소에 객실을 추가할 수 있다.

객실은 싱글룸, 더블룸, 트윈룸으로 나눠지며, 셀렉터로 선택이 가능하다.

한 번에 객실 하나를 추가할 수가 있다.

사이즈, 이미지 파일, 가격, 상세정보를 입력되어야 수정이 가능하다.

마찬가지로, 파일매니저 서비스 메서드를 사용해서 파일명이 중복이 안되게 끔 아이디 값을 넣어서 저장을 시켰다.
  * <a href="https://github.com/sehyeogi365/ChoongMoTour/blob/master/src/main/java/com/marondal/choongmotour/lodging/LodgingRestController.java">객실추가</a>


### 객실수정

 * 해당하는 숙소카드의 객실 수정 버튼을 누를 시 기존에 추가했던 객실들이 테이블 형식으로 출력된다.

단, 객실 추가한 내역이 없으면 아무것도 안 뜨며, 이미지 파일은 수정 못하게 개발을 했다.

사이즈, 가격, 상세정보 이렇게 세 가지 정보를 수정할 수가 있다.

한 숙소에 추가한 객실 정보들을 리스트로 조회하는 방식으로 출력하게 끔 했다.
  * <a href="https://github.com/sehyeogi365/ChoongMoTour/blob/master/src/main/java/com/marondal/choongmotour/lodging/LodgingRestController.java">객실추가</a>
  
<h3 id="찜찜취소">찜&찜취소</h3>

 *  오른쪽 상단의 하트 버튼을 누르면 찜한 목록에서 삭제가 된다.
찜 취소는 해당 숙소를 찜 취소를 하니 숙소 id를 파라미터로 받아왔다.
그리고 숙소카드 한 장의 정보를 담아내는 dto까지 만들었다.
숙소 정보의 비즈니스 로직을 관리하는 클래스에서 찜 여부를 나타내는변수를 적절히 조화시켰다.
숙소 목록과 찜여부 보여주는 for 문을 구현했고, 리스트를 만들어 컨트롤러로 숙소 목록 리스트 값을 보냈다.
  * <a href="https://github.com/sehyeogi365/ChoongMoTour/blob/master/src/main/java/com/marondal/choongmotour/lodging/LodgingRestController.java">찜&찜취소</a>

<h3 id="예약예약취소">예약&예약취소</h3>

 * 컨트롤러에서 user한행 정보를 조회하는 메소드를 호출해서 변수로 저장했다. 
그러고나서 모델에 해당 변수를 저장시켜서 뷰에서 로그인한 사용자 정보 정보를 불러올수 있다. 
추가된 객실 정보는 예약 목록에서 확인할 수 있다.

해당 예약 카드 상단의 x 아이콘을 누르면 예약 취소또한 할수 있다.
예약 취소는 예약 아이디를 파라미터로 받아서 취소 작업이 진행 된다.
예약목록은 비즈니스로직을 관리하는 클래스에서 예약 카드 구성에 들어가는 데이터를 담은 dto와
예약하기위한 기본정보만 있는 Reserve 모델을  잘 융합해서 리스트를 만든다.
  * <a href="https://github.com/sehyeogi365/ChoongMoTour/blob/master/src/main/java/com/marondal/choongmotour/lodging/LodgingRestController.java">예약&예약취소</a>

<h3 id="댓글작성삭제">댓글작성&삭제</h3>

 * 예약 리스트 페이지 내 예약카드의 댓글 달기 버튼을 누르면 댓글 입력 팝업창이 뜬다.

사진, 댓글 내용, 별점을 작성해야 한다.
사진은 필수로 안 넣어도 댓글이 입력이 된다.
댓글 달기 버튼을 누르면 댓글이 입력된다.

댓글 카드 우측 상단의 x 아이콘을 누르면 해당 댓글이 삭제가 된다.
로그인한 사람이 작성한 댓글만 삭제 아이콘이 뜨게끔 조건문을 사용했다.
삭제 기능은 id 값을 파라미터로 사용했다.
  * <a href="https://github.com/sehyeogi365/ChoongMoTour/blob/master/src/main/java/com/marondal/choongmotour/lodging/LodgingRestController.java">댓글작성&삭제</a>


### 네이버지도 api 

 * 검색창에 원하는 지역을 쓴 다음 검색 버튼을 누르면 원하는 지역으로 이동한다.
네이버 지도 왼쪽 확대 축소 바를 움직이면 지도를 확대 축소를 할 수가 있다.
확대 축소 바가 아닌 마우스 스크롤로도 지도를 확대 축소할 수가 있다.
  * <a href="https://github.com/sehyeogi365/ChoongMoTour/blob/master/src/main/webapp/WEB-INF/jsp/lodging/room.jsp">네이버지도 api</a>


### 정렬모달

 * 숙소 리스트 상단의 정렬 모달 버튼을 클릭하면, 모달창이 뜬다.

처음에는 아무것도 선택이 안 돼있다.

평점 높은순, 리뷰 많은순, 낮은 가격순, 높은 가격순 라디오 버튼으로 선택할 수가 있다.

선택 시 정렬이 되며, 모달창이 닫힌다.

모달창을 다시 눌러보면 선택한 정렬모드가 그대로 표시되어있고, url 파라미터에도 정렬종류가 나온다.
  * <a href="https://github.com/sehyeogi365/ChoongMoTour/blob/master/src/main/webapp/WEB-INF/jsp/lodging/lodginglist.jsp">정렬모달</a>




