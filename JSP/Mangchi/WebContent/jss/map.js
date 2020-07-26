		var boardLoc = {};
		var listt = new Array();
		var userlist = new Array();
		// var list = [];
		//var linePath = [];
		var calDistance=[];
		var distanceList = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다t

		var geocoder = new kakao.maps.services.Geocoder();
		
		
		var userfunc = function(){

		geocoder.addressSearch('서울특별시 종로구 종로 31',function(result, status) {
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

					var coordXY = document.getElementById("result"); // 검색 지도
																		// 경도위도
																		// 알아내기

					var html = "";

					 html += '<input  id="user_latitude" type="hidden" value="';
					 html += result[0].y;
					 html += ' "> ';
					 html += '<input id="user_longitude" type="hidden" value="';
					 html += result[0].x;
					 html += ' "> <br>';

					$("#result").append(html);
					
					userlist.push(result[0].y);
					userlist.push(result[0].x);

				}
				requestfunc();
			});

		
		};
		

		var geocoder = new kakao.maps.services.Geocoder();
		var requestfunc = function(){
			locationList.forEach(function(addr, index) {
				
					geocoder.addressSearch(addr, function(result, status) {
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
								var html = "";
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
								
								var lat = result[0].y;
								var lon = result[0].x;
								
								boardLoc = {
									lat:lat,
									lon:lon,
									idx:index
								};
								
								
								
								listt.push(boardLoc);
								
								parse(index);
								
							}
				});
			}); // 포문끝
			
			
		};
		
		
		
			

			
 	// window.onload = function() {
 	var parse = function(index){
 		
 		/*
		 * for (var i = 0; i < locationList.length; i++) {
		 * 
		 * console.log('.latitude' + i + ''); var lat = $('.latitude' + i +
		 * '').val(); var lon = $('.longitude' + i + '').val();
		 * 
		 * list.push(lat); list.push(lon);
		 * 
		 * console.log(lat+', '+lon); }
		 * 
		 * 
		 */
 		
 		/*var user_lat = $('#user_latitude').val();
		var user_lon = $('#user_longitude').val();
			
			
			
			var locPosition = new kakao.maps.LatLng(user_lat, user_lon);*/
 		
 		
			var locPosition = new kakao.maps.LatLng(userlist[0], userlist[1]);
			map.setCenter(locPosition);
			
	
			var linePath = [];
			
			console.log(index);
			
			for (var i = 0; i < listt.length; i++) {
				
				
				if(index == listt.legnth){
					
				}
				}	
					
			
						/*linePath.push(new daum.maps.LatLng(listt[i].lat, listt[i].lon) );
						linePath.push(new daum.maps.LatLng(userlist[0], userlist[1]));*/
						
				
		
	
			/*for (var i = 0; i < list.length; i++) {
	
				if (i % 2 == 0) {
	
					var lat = list[i];
					var lon = list[i + 1];
	
					linePath.push(new daum.maps.LatLng(lat, lon));
					linePath.push(new daum.maps.LatLng(user_lat, user_lon));
				}
			}
			*/
			
			
			
			cal(linePath);
 	};
			/*
			 * for (var i = 0; i < locationList.length; i++) {
			 * 
			 * var lat = $('.latitude' + [ i ] + '').val(); var lon =
			 * $('.longitude' + [ i ] + '').val();
			 * 
			 * list.push(lat); list.push(lon);
			 * 
			 * console.log(lat+', '+lon); }
			 * 
			 * var user_lat = $('#user_latitude').val(); var user_lon =
			 * $('#user_longitude').val(); var locPosition = new
			 * kakao.maps.LatLng(user_lat, user_lon);
			 * 
			 * map.setCenter(locPosition);
			 * 
			 * for (var i = 0; i < list.length; i++) {
			 * 
			 * if (i % 2 == 0) {
			 * 
			 * var lat = list[i]; var lon = list[i + 1];
			 * 
			 * linePath.push(new daum.maps.LatLng(lat, lon)); linePath.push(new
			 * daum.maps.LatLng(user_lat, user_lon)); } }
			 */

		var cal = function(linePath){

			
		/*	for (var j = 0; j < linePath.length; j++) {
				
				
				if (j % 2 == 0) {*/
				
					/*calDistance.push(linePath[j]);
					calDistance.push(linePath[j+1]);*/
					
				var polyline = new kakao.maps.Polyline({
					path : linePath, // 선을 구성하는 좌표배열 입니다
					strokeWeight : 5, // 선의 두께 입니다
					strokeColor : '#FFAE00', // 선의 색깔입니다
					strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에
											// 가까울수록 투명합니다
					strokeStyle : 'solid' // 선의 스타일입니다
				});
	
				polyline.setMap(map);
	
				var distance = polyline.getLength();
				var distance = Math.round(distance);
	
				console.log('거리 계산 :' +distance);
				
				/*calDistance.pop(linePath[j]);
				calDistance.pop(linePath[j+1]);*/
				
				distanceList.push(distance);
	
			/*	}
	
			}*/
				
				result();
		};
		
		
		
		var result = function(){
			// 열 제목 추가
			var tbd = $('#tbd');
		    var tbd_tr = $('#tbd>tr');
		    
		    for (i=0; i<tbd_tr.length; i++) {
		        td = document.createElement('td');
		        td= tbd_tr[i].appendChild(td);
		        
		        var listdistance = 'listdistance'+i+'';
		        
		        td.setAttribute('class', listdistance);
		        
		        $('.listdistance'+[i]).text(distanceList[i]);
		   }
		    
		    
		    
		};

			/*
			 * for (var j = 0; j < linePath.length; j++) {
			 * 
			 * 
			 * if (j % 2 == 0) {
			 * 
			 * calDistance.push(linePath[j]); calDistance.push(linePath[j+1]);
			 * 
			 * var polyline = new kakao.maps.Polyline({ path : calDistance, //
			 * 선을 구성하는 좌표배열 입니다 strokeWeight : 5, // 선의 두께 입니다 strokeColor :
			 * '#FFAE00', // 선의 색깔입니다 strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0
			 * 사이의 값이며 0에 가까울수록 투명합니다 strokeStyle : 'solid' // 선의 스타일입니다 });
			 * 
			 * polyline.setMap(map);
			 * 
			 * var distance = polyline.getLength(); var distance =
			 * Math.round(distance);
			 * 
			 * console.log('거리 계산 :' +distance);
			 * 
			 * calDistance.pop(linePath[j]); calDistance.pop(linePath[j+1]);
			 * 
			 * distanceList.push(distance); } }
			 */
			
			
		
		    
		    
		// }
		
var init= function(){
	
	userfunc();
};	
		
init();
