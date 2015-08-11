$(document).on("ready page:load", function(){
  $('#multiselect').attr("multiple", "multiple").attr("title","Select contact");
  //Adding bsmselect for select with attr "multiple"
  if($("select[multiple]")){
    $("select[multiple]").bsmSelect();
    $(".bsmListItemRemove").click();
  }
  //Adding some styles for select
  $('#bsmSelectbsmContainer0').addClass('form-control');
  //Function for appending map only on first keypress
  $("#initial_map").one("keyup", function(){
    $("#map-area").append(DIV_FOR_MAP);
    //Initial map
    if($("#map")){
      map = new GMaps({
          div: '#map',
          lng: 0,
          lat: 0,
          zoom: 16
      });
    }
  });
  //Function for joining values from two fields on every keyup
  $(".adr").keyup(function(){
    var joinedResult = '';
    $.each($(".adr"),function(index,obj){
      joinedResult += $(obj).val();
        if(!index)
          joinedResult += ','; 
        })
    //Building map based on joinedResult
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
  //Saving coordinates to DB
  $('#maps_button').click(function(e){
    $('[name="location[latitude]"]').val(latlng.K);
    $('[name="location[longitude]"]').val(latlng.G);
  });
});
//CONSTANT
var DIV_FOR_MAP = 
  '<div class="form-group">'+
    '<label class="col-lg-2 control-label">Map</label>'+
    '<div class="col-lg-7">'+
      '<div id="map"></div>'+
    '</div>'+
  '</div>'
