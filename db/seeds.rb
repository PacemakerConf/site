#eventtypes
topic = EventType.create(
	name: 'topic'
	)

lightning = EventType.create(
	name: 'lightning'
	)

registration = EventType.create(
	name: 'registration'
	)

beerbreak = EventType.create(
	name: 'beer-break'
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
	event_type: registration
	)

onering2014.events.create(
	title: 'How i get the Ring. History of success',
	timestart: '2014-12-12 12:15:00',
	description: 'Evetything you need to know about One Ring,
				  but afffraid to ask',
	event_type: topic,
	speaker: frodo
	)

onering2014.events.create(
	title: 'Beer-break',
	timestart: '2014-12-12 13:30:00',
	event_type: beerbreak
	)

onering2014.events.create(
	title: 'The challenge for kamikaze',
	timestart: '2014-12-12 15:30:00',
	speaker: gandalf,
	description: 'When fatherland is calling you',
	event_type: topic
	)

victory2015.events.create(
	title: 'A long way in the dunes',
	timestart: '2015-11-12 15:30:00',
	speaker: frodo,
	description: 'How to play piano, using only 9 fingers',
	event_type: topic
	)

onering2014.events.create(
	title: 'How many orcs i\'ll kill',
	timestart: '2014-12-12 16:30:00',
	description: 'I was drinking at the bar last night, so I took
				  a bus home...That may not be a big deal to you,
				  but I\'ve never driven a bus before.',
	event_type: lightning,
	speaker: gimli
	)

onering2014.events.create(
	title: 'How to cook Gollum',
	timestart: '2014-12-12 17:25:52',
	description: 'awful dishes',
	event_type: topic,
	speaker: sam
	)

onering2014.events.create(
	title: 'Houmm-arr-orghh',
	timestart: '2014-12-12 17:25:52',
	event_type: lightning,
	speaker: ent
	)


#kirdan vadym information


pasternaka = Location.create(
	id: 1,
	address: 'Pasternaka 5, Lviv',
	latitude: 49.8327337,
	longitude: 23.9992261,
	conference: onering2014
	)

sadova = Location.create(
	id: 2,
	address: 'Sadova 2a, Lviv',
	latitude: 49.8210367,
	longitude: 23.9875698,
	conference: victory2015
	)

vad = Contact.create(
	id: 1,
	name: 'Vad',
	surname: 'Kirdan',
	telephone: '0630620750',
	email: 'hog_dubno@gmail.com',
	skype: 'hog_dubno',
	location: pasternaka
	)

uriy = Contact.create(
	id: 2,
	name: 'Uriy',
	surname: 'Gnat',
	telephone: '0630620751',
	email: 'gnat_zv@gmail.com',
	skype: 'gnat_zv',
	location: sadova
	)

vova = Contact.create(
	id: 3,
	name: 'Vova',
	surname: 'Kamin',
	telephone: '0630750620',
	email: 'vova_lviv@gmail.com',
	skype: 'vova_lviv',
	location: sadova
	)

andriy = Contact.create(
	id: 4,
	name: 'Andriy',
	surname: 'Lozuk',
	telephone: '0630750676',
	email: 'andr_loz@gmail.com',
	skype: 'andr_loz',
	location: pasternaka
	)

#########################################
