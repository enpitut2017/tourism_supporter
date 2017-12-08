$(function(){
  show_distance_range_field();

  $('#distance-button').on('change', function () {
    if ($(this).prop('checked')) {
      is_location_enabled = true;
      $('#distance-range-field').slideDown();
      get_current_position();
    } else {
      is_location_enabled = false;
      $('#distance-range-field').slideUp()
    }
  });

  $('#search-submit').click(function() {
    $('#search-form').submit();
  });

  $("#finish-detail-settings").click(function() {
    $('#search-form').submit();
  })

  $('#search-form').submit(function(){
    if(!is_location_enabled || is_location_geted) {
      if(is_location_enabled) {
        $("#distance").val($("#distance-range").val());
        $("#lat").val(lat);
        $("#lng").val(lng);
      } else {
        $("#distance").val("");
      }
    } else {
      is_submited = true;
      return false;
    }
  })
});

var is_submited = false;
var is_location_geted = false;
var is_location_enabled = false;
var lat;
var lng;

var show_distance_range_field = function() {
  if ($('#distance-button').prop('checked')) {
    is_location_enabled = true;
    $('#distance-range-field').show();
    get_current_position();
  } else {
    is_location_enabled = false;
    $('#distance-range-field').hide();
  }
};

var get_current_position = function() {
  // 現在地を取得
  navigator.geolocation.getCurrentPosition(
    // 取得成功した場合
    function(position) {
      lat = position.coords.latitude;
      lng = position.coords.longitude;
      is_location_geted = true;
      if(is_submited) {
        $('#search-form').submit();
      }
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
}