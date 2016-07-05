// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require gmaps.js
//= require jquery-1.11.2
//= require jquery_ujs
//= require jquery-ui
//= require jquery.dataTables.js
//= require dataTables.colReorder
//= require jquery.hotkeys.js
//= require jquery.bsmselect.js
//= require fileinput.min
//= require moment
//= require bootstrap
//= require bootstrap-datetimepicker
//= require bootstrap-modal.js
//= require bootstrap-wysiwyg.js
//= require turbolinks
//= require event_types
//= require speaker
//= require locations
//= require mainMenu
//= require conferences
//= require events
//= require schedule
//= require invitations
//= require share
//= require pages.coffee
//= require message
//= require contacts
//= require preloader
//= require_self

$(document).on("ready page:load", function() {
  $('.preload-photo').each(function(index, obj){
    $.ajax({
      url: $(obj).data('image-link'),
      success: function(response){
        $(obj).attr('src', response.url).addClass('photo');
      }
    });
  });

  $('.download-materials').each(function(index, obj){
    $(obj).on('click', function(e){
      e.preventDefault();
      $.ajax({
        url: $(obj).data('materials-link'),
        dataType: "json",
        success: function(response){
          window.location.href = response.url;
          stopPreloader();
        },
        error: function(){
          alert('This file does not exist!');
          stopPreloader();
        }
      });
    });
  });
});
