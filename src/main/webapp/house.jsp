<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.hr_bold{
		border:0;
		height:3px;
		background: #c7c7c7;
	}
	#p_titleImg{
		text-align:left;
    	margin: 0 auto;
    	
	}
	
    h2 {
        padding-top: 10px;
        text-align:left;
    }
	
	/* 이미지 */
	.detail_images {
		overflow:hidden;
    	margin-top: 20px;
   	 	margin-bottom: 15px;
	}
  	.main_image, .image-gallery, .image {
    	float: left;
    	border-radius: 30px; /* Rounded corners as per request */
  	}
  
  	.main_image {
    	width: 485px;
   		height: 340px; 
    	margin-right: 20px;
  	}
  	
  	.image-gallery {
    	width: 485px; 
    	height: 350px; 
  	}
  	.image-row {
    	display: flex;
    	justify-content: space-between;
    	margin-bottom: 10px;
  	}
  	.image {
   		width: 232px; 
    	height: 165px;
    	margin-right: 20px;
  	} 
  
  	.detail_images img {
    	width: 100%;
    	height: 100%;
    	display: block;
    	border-radius: 30px;
    	padding: 5px;
    	object-fit: cover;
  	}

	
	/* 상품상세/결제 영역 */
	#p_detail_cal{
		display:flex;
		gap : 19px;
		width: 100%;
		align-items : flex-start; /* 자식 요소들의 상단정렬 */
		position : relative;
		min-height : 100vh;	/* 최소 높이를 화면 높이와 동일하게 */
	}

	/* 상품상세정보 */		
    #p_detail {
       width:530px;
    }	

	
	#p_detailName h2 {
	    margin-top: 5px;
	    margin-bottom: 4px; /* h2의 하단 마진 제거 */
	    line-height: 1; /* 행간 좁히기 */
	    text-align:left;
	}

	#p_detailName h3 {
	    margin-top: 2px; /* h3의 상단 마진 제거 */
	    margin-bottom: 8px;
	    line-height: 1; /* 행간 좁히기 */
	   	font-weight: 500;
	   	text-align:left;
	}
	
	#p_detailName h4 {
		text-align:left;
		
	}
	
	#p_detailName{
		margin-top:10px;
		margin-bottom:30px;
	}		
	
    
    #p_info {
        width:485px;
        border-radius: 30px;
        margin-bottom: 30px; 
    }
	
	
	/* 결제고정네비 */
	#r_nav{
		flex-grow: 1; /* 남은 공간을 채움 */
    	width: calc(100% - 550px); /* 전체 너비에서 p_detail의 너비를 뺀 나머지 */
    	position: relative; /* navBox의 sticky 위치 기준 */	
	}
	
	
	.navBox {
		text_align : left;
	    position: sticky;
	    top: 20px; /* 상단 고정 위치 */
	    width: 350px; /* 너비 */
	    height: auto; /* 높이는 자동으로 조정 */
	    margin: auto;
	    border-radius: 20px;
	    border: 2px solid #c7c7c7;
	    padding : 20px;
	    /* 기존 navBox 스타일 유지 */
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
	
	.navBox h2{
		font-size : 24px;
		margin : 0 0 20px 0;
	}

    .navBox .price {
        font-size: 28px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .navBox .date {
        margin-bottom: 10px;
    }

    .navBox label {
        font-size: 14px;
        color: #333;
        display: block;
        margin-bottom: 5px;
    }

    .navBox input[type="text"],
    .navBox select {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #c7c7c7;
        border-radius: 5px;
    }

    .navBox .submit {
        background-color: #01d1ca;
        color: white;
        border: none;
        padding: 10px 20px;
        text-transform: uppercase;
        font-weight: bold;
        width: 100%;
        border-radius: 5px;
        cursor: pointer;
    }

    .navBox .total {
        color: #333;
        margin-top: 20px;
        font-weight: bold;
    }
    
	.navBox h2, .navBox .price, .navBox label, .navBox{
    	text-align: left;
	}
	
	.total{
		text-align: right;
		font-size : 20px;
	}

	/* 편의시설 */
    #amenity {
        margin-bottom: 30px; 
        height: 220px;
    }
    	
	#amenity_img{	/* 편의시설 아이콘 영역*/
		width:490px;
		margin : 20px auto;
		overflow: auto;		
		list-style = none;
		padding : 0;
	}
	#amenity_img ul {
	    list-style : none;
	    padding : 0;
	    margin : 0;
	}
	#amenity_img ul li {
	    width : 49%;
	    float : left;
	    margin-bottom : 10px;
	    margin-right: 2%;
	}
	
	/* 우측 마진제거 */
	#amenity_img ul li:nth-child(2n) {
    	margin-right: 0; 
	}
	
	#amenity_img ul li img {
	    width: 100%; 
	    height: 50px; 
	    object-fit: cover; 
	}
	
    #amenity_img > img {
        width: 240px; 
        height: 110px;  
        margin-right: 10px; 
        margin-bottom: 10px;
        border-radius: 30px;
    }
     #amenity_img::after {
        content: "";
        clear: both;
        display: table;
    }   
    
    /* 숙소정보 */
    #p_explain{
    	width: 85%;
    	margin: 30px auto; 
    	word-wrap : break-word;

    }

	/* 숙소 리뷰 */
	#review{
	    width: 100%;
	    margin-bottom: 30px; 	
	    overflow: auto;
	}
	
	.review_item{
		width : 40%;
		float : left;
		margin-right: 10%;
		margin-bottom: 10px;
		box-sizing : border-box;
	}
	
	.review_item:nth-child(2n) { /* 오른쪽 글 마진 제거 */
		margin-right:0;
	}
	
	.review_item_content {
		border : 2px solid #c7c7c7;
		padding : 10px;
		border-radius : 10px;
		background : #fff;
		margin-bottom:10px;
		overflow: hidden;
	}
	.review-count{
		font-size: 15px;
		font-weight : 400;
	}
	
	.review_meta {
		display : flex;
		justify-content : space-between;
		margin-bottok:5px;
	}
	
	.review_rating {
		display:block;
		margin-bottom:5px;
	}
	
	.review_content{
		overflow:hidden;
		text-overflow:ellipsis;
		margin-bottom:10px;
	}
	
	.review_more{
		text-align: left;
		color: #000;
		display:block;
		text-decoration: none;
	}
	
	.review_more button {
	    padding: 10px 20px;
	    background-color: #fff;
		border : 1px solid #000;
	    border-radius: 10px;
	    cursor: pointer;
	}
	
	/* 리뷰 모달창 */
	#modal {
	    display: none; /* 기본적으로 숨깁니다 */
	    position: fixed; /* 고정 위치 */
	    left: 50%;
	    top: 50%;
	    transform: translate(-50%, -50%);
	    width: 700px;
	    height: 600px;
	    background: #fff;
	    border-radius: 30px;
	    z-index: 200; /* 다른 요소 위에 표시 */
	}
	
	#modalContent{
		padding: 30px;
	}
	
	#modalContent h1 {
		text-align: left;
		margin-bottom : 0px;
	}
	
	#modalContent h2 {
		margin-top: 0;
	}
	
	.modal-backdrop {
	    display: none;
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background: rgba(0, 0, 0, 0.3);
	    z-index: 100; /* 모달 뒤에 위치 */
	}	

	/* 모달창 내 목록 */
	
	
	/* 지도 목록 */
	#detail_map{
		margin-top:30px;
	}
	
	#map{
		width:100%;
		height:400px;
		margin-top:30px;
		margin-bottom:50px;		
	}
	
	/* 결제 네비게이션  */
	input[type="date"] {
	    padding: 10px; /* 패딩을 늘려서 입력 필드의 크기를 조정 */
	    font-size: 16px; /* 폰트 크기를 조정 */
	    border: 1px solid #ccc; /* 테두리 스타일을 지정 */
	    border-radius: 4px; /* 둥근 모서리를 적용 */
	    width : 80%;
	}	

	

	
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fa8699608123bb81a55935414cdb2b89"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    // 모달과 모달 오픈 버튼 선택
    var modal = $('#modal');
    var modalBackdrop = $('<div class="modal-backdrop"></div>').appendTo('body');
    var modalOpenButton = $('#modalOpenButton');

    // 모달 열기
    modalOpenButton.click(function() {
      modal.show();
      modalBackdrop.show();
    });

    // 모달 밖의 영역 클릭 시 모달 닫기
    modalBackdrop.click(function() {
      modal.hide();
      modalBackdrop.hide();
    });
  });
  
  /* 지도 좌표 */
	window.onload = function(){
	  var position = new kakao.maps.LatLng(37.55655, 126.9196);
	  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = { 
      	center: position, // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성
	var map = new kakao.maps.Map(mapContainer, mapOption); 
               
         
	// 마커를 생성
	var marker = new kakao.maps.Marker({
		position: position
	});
         
    // 마커가 지도 위에 표시되도록 설정
	marker.setMap(map);
	}      

  
</script>	

</head>
<body>
<!-- 컨텐트 1 : 상품명, 이미지 -->
<!-- 상품이미지-->		
	<div class="detail_images">
	  <div class="main_image">
	    <img src="images/banner1.jpeg" alt="메인 이미지">
	  </div>
	  <div class="image-gallery">
	    <div class="image-row">
	      <div class="image">
	        <img src="images/banner2.jpeg" alt="이미지 1">
	      </div>
	      <div class="image">
	        <img src="images/banner3.jpeg" alt="이미지 2">
	      </div>
	    </div>
	    <div class="image-row">
	      <div class="image">
	        <img src="images/banner4.jpeg" alt="이미지 3">
	      </div>
	      <div class="image">
	        <img src="images/banner5.jpeg" alt="이미지 4">
	      </div>
	    </div>
	  </div>
	</div>
		
		<!-- 컨텐트 2 : 상품상세정보, 결제창-->
	<div id = "p_detail_cal">	
		<div id = "p_detail">
			<div id = "p_detailName">
				<h2> 상품명 ${p.p_name } &nbsp; <img src=""></h2>
				<h3> 최대 인원 ${p.occ_max }명</h3>
				<h4> ★ 4.5${p.rating }</h4>
			</div>		
			
			<hr class = "hr_bold">
			<div id = "amenity">
				<h2>편의시설</h2>
				<hr>	
				<div id = "amenity_img">
					<ul>
						<li><img src = "images/login.gif"></li>
						<li><img src = "images/login.gif"></li>
						<li><img src = "images/login.gif"></li>
						<li><img src = "images/login.gif"></li>
					</ul>
				</div>
			</div>
	
			<hr class = "hr_bold">		
			<div id = "p_info">
				<h2> 숙소 정보 </h2>
				<hr>
				<div id = "p_explain">
					${p.p_explain }
					이 숙소는 어쩌구 저쩌구 이러쿵 저러쿵 임마점마어쩌구저쩌구
					가나다라마바사아일삼사오육칠팔구심ㅇㅁ왕롸앙아어어오올오오오이이ㅇ
					이이이이나나나나베베베ㅏ터럴오오우우우우우우우우우우우우우초밥와아어오옹
					테스틋ㅌ테스트텟틑ㅅㅌ테스트테스
					<br> 꺠끗하고 물이 너무 잘나옵니다.<br>
					아주좋아요. 강아지도 있음.<br> 탁월한 선택
				</div>	
			
			</div>
			<hr class = "hr_bold">
			
		</div>
		<!-- 네비게이터 -->
		<div id = r_nav>
			<div class="navBox">
	    		<div class="price">50,000원 / 박</div>
				<div class="date">
	        	<label>체크인 날짜</label>
	        	<input type="date" id="checkIn" name="checkIn" value="2023.12.29">
	    	</div>
	    <div class="date">
	        <label>체크아웃 날짜</label>
	        <input type="date" id="checkOut" name="checkOut" value="2023.12.30">
	    </div>
	    <div class="date">
 			<label for="guests">인원 수 선택</label>
    		<select id="guests" name="guests">
<%--         <% 
            int maxCust = Integer.parseInt(p.getMaxCust()); // 여기서 p.getMaxCust()는 해당 상품의 최대 인원 수를 문자열로 가져옵니다.
            for (int i = 1; i <= maxCust; i++) { 
        %>
                <option value="<%= i %>"><%= i %> 인</option>
        <% 
            } 
        %> --%>
        <option value="1">1 인</option>
	    <option value="2">2 인</option>
    </select>
</div>

	    <button class="submit">예약하기</button>
	    <div class="total">총 합계 : 50,000원</div>
</div>
		</div>
	</div>		
	

	
	<!--  평점 / 리뷰 -->
	<div id = review>
		<h2> 평점&nbsp;/&nbsp;리뷰 <span class="review-count">(8개)</span></h2>
		<br>
		
        <%
            ArrayList<String> reviews = new ArrayList<String>();
            for (int i = 0; i < 8/* reviews.size() */; i++) { 
                reviews.add("리뷰 내용 " + (i + 1));
            }

            for (int i = 0; i < reviews.size(); i++) {
                if (i > 0 && i % 2 == 0) {
                    out.write("<div style='clear:both;'></div>"); 
                }
                if (i % 2 == 0) {
                    out.write("<div class='review-row'>");
                }

                // 개별 리뷰 출력
                
                out.write("<div class='review_item'>");
                out.write("<div class='review_item_content'>");
                out.write("<p>" + reviews.get(i) + "</p>");
                out.write("</div>");
                out.write("</div>");

                if (i % 2 == 1 || i == reviews.size() - 1) { 
                    out.write("</div>"); 
                }
            }
        %>		
		<!-- 리뷰 더보기 버튼 -->
	    <div class="review_more">
	        <button type="button" id = "modalOpenButton">리뷰 더보기</button>
	    </div>	
		
		<!-- 모달창 -->
		<div id = "modal" class="hidden">
			<div id = "modalContent">
				<h1> ★ 4.5 ${p.rating }</h1>
				<hr>
			<h2> 전체 리뷰 <span class="review-count">(8개)</span></h2>
			<br>
				<div class = "reviewAll">
					
				</div>		
			</div>
		</div>
		
		
	</div>
	
	<!-- 위치 지도 -->
	<div id = detail_map>
		<h2> 위치 지도 </h2>
		<hr class = "hr_bold">
		
		<div id="map"></div>
	</div>	
	
	<!-- 맛집추천 -->
	
</body>
</html>