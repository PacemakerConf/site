$(document).on("page:change", function(){
  $('#multiselect').attr("multiple", "multiple").attr("title","Select a contact");

  if($("select[multiple]")){
    $("select[multiple]").bsmSelect();
    $(".bsmListItemRemove").click();
  }

  $(".adr").bind("keypress", function () {
      var DivForMap = 
  '<div class="form-group">'+
    '<label class="col-lg-2 control-label">Map</label>'+
      '<div class="col-lg-7">'+
        '<div id="map"></div>'+
      '</div>'+
  '</div>'
  $("#map-area").append(DivForMap);
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
    var splittedResult = '';
    $.each($(".adr"),function(index,obj){
      splittedResult += $(obj).val();
        if(!index)
          splittedResult += ','; 
        })

    GMaps.geocode({
      address: splittedResult,
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