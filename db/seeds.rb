#eventtypes
topic = EventsType.create(
	eventstype: 'topic'
	)

lightning = EventsType.create(
	eventstype: 'lightning'
	)

registration = EventsType.create(
	eventstype: 'registration'
	)

beerbreak = EventsType.create(
	eventstype: 'beer-break'
	)


#speakers
frodo = Speaker.create(
	name: 'Frodo Baggins',
	description: 'A little but brave Hobbit. Love jewels very much'
	)

gandalf = Speaker.create(
	name: 'Gandalf the Grey',
	description: 'Wizard. The big nob. Oh, i mean the biggest wizard 
					of the Middle-earth, leader of the army of the 
					West, also know as Mithrandir, The Grey Pilgrim,
					The White Rider, Stormcrow etc'
	)

gimli = Speaker.create(
	name: 'Gimli',
	description: 'A dwarf with capital D'
	)

sam = Speaker.create(
	name: 'Samwise Gamgee',
	description: 'Sam, just Sam'
	)

ent = Speaker.create(
	name: 'Fangorn the Ent',
	description: 'Hum-hum-hum'
	)

#conferences
onering2014 = Conference.create(
	name: 'One Ring-2014',
	year: 2014,
	date: '2014-12-12',
	attenders: 79
	)

victory2015 = Conference.create(
	name: 'Victory-2015',
	year: 2015,
	date: '2015-11-12',
	attenders: 72
	)

#events
onering2014.events.create(
	title: 'registration',
	timestart: '2014-12-12 12:00:00',
	events_type: registration
	)

onering2014.events.create(
	title: 'How i get the Ring. History of success',
	timestart: '2014-12-12 12:15:00',
	description: 'Evetything you need to know about One Ring,
				  but afffraid to ask',
	events_type: topic,
	speaker: frodo
	)

onering2014.events.create(
	title: 'Beer-break',
	timestart: '2014-12-12 13:30:00',
	events_type: beerbreak
	)

onering2014.events.create(
	title: 'The challenge for kamikaze',
	timestart: '2014-12-12 15:30:00',
	events_type: topic,
	speaker: gandalf,
	description: 'When fatherland is calling you'
	)

victory2015.events.create(
	title: 'A long way in the dunes',
	timestart: '2015-11-12 15:30:00',
	events_type: topic,
	speaker: frodo,
	description: 'How to play piano, using only 9 fingers'
	)

onering2014.events.create(
	title: 'How many orcs i\'ll kill',
	timestart: '2014-12-12 16:30:00',
	events_type: lightning,
	speaker: gimli,
	description: 'I was drinking at the bar last night, so I took
				  a bus home...That may not be a big deal to you,
				  but I\'ve never driven a bus before.'
	)

onering2014.events.create(
	title: 'How to cook Gollum',
	timestart: '2014-12-12 17:25:52',
	events_type: topic,
	speaker: sam,
	description: 'awful dishes'
	)

onering2014.events.create(
	title: 'Houmm-arr-orghh',
	timestart: '2014-12-12 17:25:52',
	events_type: lightning,
	speaker: ent
	)
