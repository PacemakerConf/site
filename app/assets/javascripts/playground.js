window.Playground = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
   new Playground.Routers.Applications();
   Backbone.history.start();
  }
};

$(document).ready(function(){
  Playground.initialize();
});
