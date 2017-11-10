function initMap() {

      // マップの初期化
      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 13,
        center: {lat: 36.1087264, lng: 140.1017724}
      });

      // クリックイベントを追加
      map.addListener('click', function(e) {
        getClickLatLng(e.latLng, map);
      });
    }
    var marker;

    function getClickLatLng(lat_lng, map) {

      // 座標を表示
      document.getElementById('lat').value = lat_lng.lat();
      document.getElementById('lng').value = lat_lng.lng();


      if (marker) {
        marker.setMap(null);
      }
      // マーカーを設置
      marker = new google.maps.Marker({
        position: lat_lng,
        map: map
      });

      // 座標の中心をずらす
      // http://syncer.jp/google-maps-javascript-api-matome/map/method/panTo/
      map.panTo(lat_lng);
    }
