class Playground.Routers.Applications extends Backbone.Router
	routes:
		'' 				: 'show'
		'application/:name' : 'speakers'

	show: ->
		alert 'home page'