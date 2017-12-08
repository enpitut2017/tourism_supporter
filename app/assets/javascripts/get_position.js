$(function(){
  show_distance_range_field();

  $('#distance-button').on('change', function () {
    if ($(this).prop('checked')) {
      $('#distance-range-field').slideDown();
    } else {
      $('#distance-range-field').slideUp()
    }
  });
});

$('#location-button').click(function() {
  // 現在地を取得
  navigator.geolocation.getCurrentPosition(
    // 取得成功した場合
    function(position) {
        document.getElementById('lat').value = position.coords.latitude;
        document.getElementById('lng').value = position.coords.longitude;
        $('#location-form').submit();
    },
    // 取得失敗した場合
    function(error) {
      switch(error.code) {
        case 1: //PERMISSION_DENIED
          alert("位置情報の利用が許可されていません");
          break;
        case 2: //POSITION_UNAVAILABLE
          alert("現在位置が取得できませんでした");
          break;
        case 3: //TIMEOUT
          alert("タイムアウトになりました");
          break;
        default:
          alert("その他のエラー(エラーコード:"+error.code+")");
          break;
      }
    }
  );
});

var show_distance_range_field = function() {
  if ($(this).prop('checked')) {
    $('#distance-range-field').show();
  } else {
    $('#distance-range-field').hide();
  }
};