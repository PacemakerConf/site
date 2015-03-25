$(document).on("page:change", function(){
  $('#location_contact_ids_').removeAttr('id','none').attr("multiple", "multiple").attr("title","Select a contact");

  if($("select[multiple]")){
    $("select[multiple]").bsmSelect();
    $("select[multiple]").bsmSelect({
      addItemTarget: 'top'
    });  
  }
  
  var map;
  if($("#map").length){
    map = new GMaps({
          div: '#map',
          lng: 0,
          lat: 0,
          zoom: 16
    });
  }

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

  $('[name="commit"]').click(function(){
    $('[name="location[latitude]"]').val(latlng.k);
    $('[name="location[longitude]"]').val(latlng.D);
  });

});