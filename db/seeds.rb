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

frodo = Speaker.create(
	name: 'Frodo Baggins'
	)

gandalf = Speaker.create(
	name: 'Gandalf the Grey'
	)

gimli = Speaker.create(
	name: 'Gimli'
	)

onering2014 = Conference.create(
	name: 'One Ring-2014',
	date: '2014-12-12'
	)

victory2015 = Conference.create(
	name: 'Victory-2015',
	date: '2015-11-12'
	)

onering2014.events.create(
	title: 'registration',
	timestart: '2014-12-12 12:00:00',
	events_type: registration
	)

onering2014.events.create(
	title: 'How i get the Ring. History of success',
	timestart: '2014-12-12 12:15:00',
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
	speaker: gandalf
	)

victory2015.events.create(
	title: 'A long way in the dunes',
	timestart: '2015-11-12 15:30:00',
	events_type: topic,
	speaker: frodo
	)

onering2014.events.create(
	title: 'How many orcs i\'ll kill',
	timestart: '2014-12-12 16:30:00',
	events_type: lightning,
	speaker: gimli
	)
