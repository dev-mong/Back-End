<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Object requestList = request.getAttribute("requestWrtingList");

	session.setAttribute("requestWritingList", requestList);
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<title>선의 거리 계산하기</title>



<script>
	var locationList = new Array();

	<c:forEach var="requestList" items="${requestWrtingList.requestWriting}" varStatus="status">
	locationList.push("${requestList.req_loc}");

	</c:forEach>
</script>
<style>
.dot {
	overflow: hidden;
	float: left;
	width: 12px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
}

.dotOverlay {
	position: relative;
	bottom: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
	font-size: 12px;
	padding: 5px;
	background: #fff;
}

.dotOverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.number {
	font-weight: bold;
	color: #ee6152;
}

.dotOverlay:after {
	content: '';
	position: absolute;
	margin-left: -6px;
	left: 50%;
	bottom: -8px;
	width: 11px;
	height: 8px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')
}

.distanceInfo {
	position: relative;
	top: 5px;
	left: 5px;
	list-style: none;
	margin: 0;
}

.distanceInfo .label {
	display: inline-block;
	width: 50px;
}

.distanceInfo:after {
	content: none;
}

</style>
</head>

<body>
	<div id="map" style="width: 100%; height: 350px; display: none;"></div>
	<div id="distance"></div>
	<p>
		<em>지도를 움직여 주세요!</em>
	</p>
	<p id="result"></p>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69c40691beee2a7bf82c96e2f85f0da8&libraries=services"></script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69c40691beee2a7bf82c96e2f85f0da8"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다t

		var geocoder = new kakao.maps.services.Geocoder();

		geocoder
				.addressSearch(
						'서울특별시 종로구 종로 31',
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								var marker1 = new daum.maps.Marker({
									map : map,
									position : coords
								});

								var requestMessage = '<div style="padding:5px; background-color:white; border: 1px solid #DDD;">요청자 위치</div>';

								var overlay1 = new daum.maps.CustomOverlay({
									content : requestMessage,
									map : map,
									position : marker1.getPosition()
								});

								var coordXY = document.getElementById("result"); //검색 지도 경도위도 알아내기

								var html = "";

								html += '<input  id="user_latitude" type="hidden" value="';
	        					 html += result[0].y;
	         				html += ' "> ';
								html += '<input id="user_longitude" type="hidden" value="';
	        					 html += result[0].x;
	        					 html += ' "> <br>';

								$("#result").append(html);

							}
						}

				);

		//locationList //Db에 등록된 주소 값들  

		var geocoder = new daum.maps.services.Geocoder();

		locationList
				.forEach(function(addr, index) {

					geocoder
							.addressSearch(
									addr,
									function(result, status) {
										if (status === daum.maps.services.Status.OK) {
											var coords = new daum.maps.LatLng(
													result[0].y, result[0].x);

											var marker = new daum.maps.Marker({
												map : map,
												position : coords
											});
											var infowindow = new daum.maps.InfoWindow(
													{
														content : '<div style="width:150px;text-align:center;padding:6px 0;">'
																+ locationList[index]
																+ '</div>',
														disableAutoPan : true
													});
											infowindow.open(map, marker);

											var coordXY = document
													.getElementById("result");
											var html = ""
													+ result[0].address_name;
											html += '<input class="latitude';  
					html +=index;
					html += '" type="text" value="';
   					html += result[0].y;
    				html += ' "> ';

											html += '<input class="longitude';
  					html +=index;
					html+='" type="text" value="';
					html += result[0].x;
 					html += ' "> <br>';
											$("#result").append(html);

										}
									});
				});

		
		
		
		
		var list = [];
		var linePath = [];
		var distanceList = [];
		var calDistance=[];
			
			
 	window.onload = function() {

			for (var i = 0; i < locationList.length; i++) {

				var lat = $('.latitude' + [ i ] + '').val();
				var lon = $('.longitude' + [ i ] + '').val();

				list.push(lat);
				list.push(lon);
			}

			var user_lat = $('#user_latitude').val();
			var user_lon = $('#user_longitude').val();
			var locPosition = new kakao.maps.LatLng(user_lat, user_lon);

			map.setCenter(locPosition);

			for (var i = 0; i < list.length; i++) {

				if (i % 2 == 0) {

					var lat = list[i];
					var lon = list[i + 1];

					linePath.push(new daum.maps.LatLng(lat, lon));
					linePath.push(new daum.maps.LatLng(user_lat, user_lon));

				}

			}


			//linePath에 인덱스 짝수 : 게시물 등록위치
			//				홀수 : 로그인 등록 위치 

			

			for (var j = 0; j < linePath.length; j++) {
					
				
				//linePath에서 리스트의 값과 현재 사용자와의 거리를 계산해주기 위해서 해야함 ㅜㅜ
				if (j % 2 == 0) {
				
					calDistance.push(linePath[j]);
					calDistance.push(linePath[j+1]);
					
					console.log(calDistance);
					
				var polyline = new kakao.maps.Polyline({
					path : calDistance, // 선을 구성하는 좌표배열 입니다
					strokeWeight : 5, // 선의 두께 입니다
					strokeColor : '#FFAE00', // 선의 색깔입니다
					strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					strokeStyle : 'solid' // 선의 스타일입니다
				});

				polyline.setMap(map);

				var distance = polyline.getLength();
	
				console.log(' 거리 계산 :' +distance);
				
				calDistance.pop(linePath[j]);
				calDistance.pop(linePath[j+1]);
				
				}

			}
		
		} 
		
		
		// location.href = "<c:url value="/board/boardingView.do" /> ";
	</script>


</body>

	<script>
	
		
	
	</script>



</html>