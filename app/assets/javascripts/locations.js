$(document).on("ready page:load", function(){
  $('#multiselect').attr("multiple", "multiple").attr("title","Select contact");

  if($("select[multiple]")){
    $("select[multiple]").bsmSelect();
    $(".bsmListItemRemove").click();
  }

  $('#bsmSelectbsmContainer0').addClass('form-control');

  $(".adr").bind("keypress", function(){
    $("#map-area").append(DIV_FOR_MAP);
    $('.adr').unbind('keypress');

    if($("#map").length){
      map = new GMaps({
          div: '#map',
          lng: 0,
          lat: 0,
          zoom: 16
      });
    }
  });
  
  $(".adr").keyup(function(){
    var joinedResult = '';
    $.each($(".adr"),function(index,obj){
      joinedResult += $(obj).val();
        if(!index)
          joinedResult += ','; 
        })

    GMaps.geocode({
      address: joinedResult,
      callback: function(results, status) {
        if (status === 'OK') {
          latlng = results[0].geometry.location;
          map.setCenter(latlng.lat(), latlng.lng());
          map.removeMarkers();
          map.addMarker({
            lat: latlng.lat(),
            lng: latlng.lng()
            });
          }
        }
    });
  });

  $('#maps_button').click(function(){
    $('[name="location[latitude]"]').val(latlng.k);
    $('[name="location[longitude]"]').val(latlng.D);
  });
});

var DIV_FOR_MAP = 
  '<div class="form-group">'+
    '<label class="col-lg-2 control-label">Map</label>'+
    '<div class="col-lg-7">'+
      '<div id="map"></div>'+
    '</div>'+
  '</div>'
