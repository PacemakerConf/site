$(document).on("page:change", function(){

  

    $('#editor').wysiwyg();
 
    $('[name="commit"]').click(function(){
      info = $('#editor').html();
      $('[name="location[how_to_find]"]').val(info);
    });


    var map ;

    if($("#map").length)
    map = new GMaps({
          div: '#map',
         lng: 18.5009765625,
          lat: 48.31242790407185,
          zoom: 16
      });

  $(".adr").keyup (function(){
    var splitedResult = '';
  $.each($(".adr"),function(index,obj){
    splitedResult += $(obj).val();
    if(!index)
      splitedResult += ','; 
    })

  GMaps.geocode({
    address: splitedResult,
    callback: function(results, status) {
      if (status == 'OK') {
        var latlng = results[0].geometry.location;
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

  $('#location_contact_ids_').removeAttr('id','none').attr("multiple", "multiple").attr("title","Select a contact");

    jQuery(function($) {
      $("select[multiple]").bsmSelect();
    });

    jQuery(function($) {
    $("select[multiple]").bsmSelect({
      addItemTarget: 'top'
    });
    });


});