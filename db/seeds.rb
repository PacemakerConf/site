# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

first_conf = Conference.create(name: 'One Ring', about: 'the threat 
	to the entie universe', date: '2014-12-21 12:00:00')

frodo = Speaker.create(name: 'Frodo Baggins', about: 'Ring holder')

gandalf = Speaker.create(name: 'Gandalf the Grey', about: 'Wizard, big nob')

first_conf.events.create(title: 'registration', about: 'first meeting
 of The Fellowship of the Ring', timeStart: '2014-12-21 12:00:00', 
 timeStop: '2014-12-21 12:58:32')

first_conf.events.create(title: 'beer-break', about: 'it\'s to
 hard to speak so long time', timeStart: '2014-12-21 13:55:00', 
 timeStop: '2014-12-21 16:55:00')

frodo.speeches.create(title: 'Pre-history', about: 'How i get the
	Ring. History of success', timeStart: '2014-12-21 13:05:00', 
 timeStop: '2014-12-21 13:55:00', conference_id: 1)

gandalf.speeches.create(title: 'ToDo', about: 'The challenge for 
	kamikaze. Adoption of volunteers', timeStart: '2014-12-21 16:55:00', 
 timeStop: '2014-12-21 16:56:00', conference_id: 1)

secong_conf = Conference.create(name: 'Victory!', about: 'The punishment
 of the innocent, awarding uninvolved', date: '2015-01-29 13:00:00')

gimly = Speaker.create(name: 'Gimly', about: 'dwarf with capital letter D')

secong_conf.events.create(title: 'registration', about: 'last meeting
 of The Fellowship of the Ring', timeStart: '2015-01-29 13:00:00', 
 timeStop: '2015-01-29 13:58:32')

gandalf.speeches.create(title: 'Balrog', about: 'Fantasies about big 
	fight with a fearsome monster', timeStart: '2015-01-29 16:55:00', 
 timeStop: '2015-01-30 16:56:00', conference_id: 2)

gimly.speeches.create(title: 'Our victory', about: 'How many orcs I 
	killed', timeStart: '2015-01-30 16:55:00', 
 timeStop: '2015-02-01 16:56:00', conference_id: 2)

