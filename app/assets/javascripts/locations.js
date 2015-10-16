var getFullLocation = function(){
  var joinedResult = '';
  $.each($(".adr"),function(index,obj){
    joinedResult += $(obj).val();
    if(!index)
      joinedResult += ','; 
  })
  return joinedResult;
}

var initGMap = function(map_area){
    var longitude = map_area.getAttribute('longitude') ? map_area.getAttribute('longitude') : 0;
    var latitude = map_area.getAttribute('latitude')? map_area.getAttribute('latitude') : 0;

    var  map = new GMaps({
      div: '#map',
      lng: longitude ? longitude : 0,
      lat: latitude? latitude : 0,
      zoom: 16
    });
    if(longitude != 0 && latitude != 0){
        var location_hash = {
          lat: latitude,
          lng: longitude
        };
        map.addMarker(location_hash);
        map.setCenter(latitude, longitude);
    } else {
      pointGMapByAddress(map)
    }  
}

var pointGMapByAddress = function(map){
  //Building map based on joinedResult
  GMaps.geocode({
    address: getFullLocation(),
    callback: function(results, status) {
      if (status === 'OK') {
        latlng = results[0].geometry.location;
        var location_hash = {
          lat: latlng.lat(),
          lng: latlng.lng()
        };
        map.setCenter(location_hash.lat, location_hash.lng);
        map.removeMarkers();
        map.addMarker(location_hash);
        setLocationFields(location_hash);
      }
    }
  });
}

var setLocationFields = function(location_hash){
  console.log('latlng');
  console.log(location_hash);
  $('[name="location[latitude]"]').val(location_hash.lat);
  $('[name="location[longitude]"]').val(location_hash.lng);
}

$(document).on("ready page:load", function(){
  console.log("HERE!!!!")
  $('#multiselect').attr("multiple", "multiple").attr("title","Select contact");
  //Adding bsmselect for select with attr "multiple"
  if($("select[multiple]")){
    $("select[multiple]").bsmSelect();
    $(".bsmListItemRemove").click();
  }
  //Adding some styles for select
  $('#bsmSelectbsmContainer0').addClass('form-control');

  var map_area = $("#map-area")[0];

  if(map_area != undefined){
    initGMap(map_area);
  }  
  //Function for joining values from two fields on every keyup
  $(".adr").keyup(function(){
    pointGMapByAddress(map);
  });
});

