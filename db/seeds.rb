#eventtypes
topic = EventType.create(
	name: 'topic',
	description: 'some description',
	defaultDuration: '2014-12-12 01:00:00',
	color: '#222200',
	image: '3',
	speakerEvent: 1
	)

lightning = EventType.create(
	name: 'lightning',
	description: 'some description',
	defaultDuration: '2014-12-12 00:45:00',
	color: '#ffff00',
	image: '2',
	speakerEvent: 1
	)

registration = EventType.create(
	name: 'registration',
	description: 'some description',
	defaultDuration: '2014-12-12 00:30:00',
	color: '#44ff44',
	image: '1',
	speakerEvent: 0
	)

beerbreak = EventType.create(
	name: 'beer-break',
	description: 'ho ho ho',
	defaultDuration: '2014-12-12 03:00:00',
	color: '#666600',
	image: '0',
	speakerEvent: 0
	)


#speakers
frodo = Speaker.create(
	name: 'Frodo',
	surname: 'Baggins',
	description: 'A little but brave Hobbit. Love jewels very much',
	email: 'frodo@ring.one',
    facebook: 'fb/goldy',
    site: 'http://the-best-jewels.com',
	photo_file_name: "frodo.jpg",
	photo_content_type: "image/jpeg",
	photo_file_size: 8046,
	photo_updated_at: "2015-02-12 21:23:16"
	)

harry = Speaker.create(
	name: 'Harry',
	surname: 'Potter',
	description: 'The bespactacled One',
	email: 'harrypotter@mail.com',
    facebook: 'fb/harrik',
    linkedin: 'Havrentiy Potter',
    site: 'http://potter-shop.com'
	)

gandalf = Speaker.create(
	name: 'Gandalf',
	surname: 'Grey',
	description: 'Wizard. The big nob. Oh, i mean the biggest wizard 
					of the Middle-earth, leader of the army of the 
					West, also know as Mithrandir, The Grey Pilgrim,
					The White Rider, Stormcrow etc',
	email: 'gangan@mail.com',
    facebook: 'fb/gandalfgrey',
    linkedin: 'Gandalyk Gand',
    site: 'http://gan-gan.com',
    photo_file_name: "1.png", 
    photo_content_type: "image/png", 
    photo_file_size: 1231
	)

gimli = Speaker.create(
	name: 'Gimli',
	surname: 'Grisli',
	description: 'A dwarf with capital D'
	)

sam = Speaker.create(
	name: 'Samwise',
	surname: 'Gamgee',
	description: 'Sam, just Sam'
	)

ent = Speaker.create(
	name: 'Fangorn',
	surname: 'Ent',
	description: 'Hum-hum-hum', 
	photo_file_name: "fangorn.jpg", 
	photo_content_type: "image/jpeg", 
	photo_file_size: 7718, 
	photo_updated_at: "2015-02-12 21:22:27"
	)

#conferences
onering = Conference.create(
	name: 'One Ring',
	year: 2014,
	date: '2014-12-12',
	attenders: 79
	)

ror2012 = Conference.create(
	name: 'RoR',
	year: 2012,
	date: '2012-11-12',
	attenders: 12
	)

ror2013 = Conference.create(
	name: 'RoR',
	year: 2013,
	date: '2013-11-12',
	attenders: 22
	)

ror2014 = Conference.create(
	name: 'RoR',
	year: 2014,
	date: '2014-11-12',
	attenders: 372
	)

victory = Conference.create(
	name: 'Victory',
	year: 2015,
	date: '2015-11-12',
	attenders: 72
	)

#events
onering.events.create(
	title: 'registration',
	event_type: registration,
	duration: '2014-12-12 00:45:00',
	position: 1
	)

onering.events.create(
	title: 'How i get the Ring. History of success',
	description: 'Evetything you need to know about One Ring,
				  but afffraid to ask',
	event_type: topic,
	speaker: frodo,
	duration: '2014-12-12 01:00:00',
	position: 2
	)

onering.events.create(
	title: 'Beer-break',
	event_type: beerbreak,
	duration: '2014-12-12 01:30:00',
	position: 4
	)

onering.events.create(
	title: 'The challenge for kamikaze',
	speaker: gandalf,
	description: 'When fatherland is calling you',
	event_type: topic,
	duration: '2014-12-12 01:00:00',
	position: 3
	)

onering.events.create(
	title: 'How many orcs i\'ll kill',
	description: 'I was drinking at the bar last night, so I took
				  a bus home...That may not be a big deal to you,
				  but I\'ve never driven a bus before.',
	event_type: lightning,
	speaker: gimli,
	duration: '2014-12-12 01:05:00',
	position: 0
	)

onering.events.create(
	title: 'How to cook Gollum',
	description: 'awful dishes',
	event_type: topic,
	speaker: sam,
	duration: '2014-12-12 00:15:00',
	position: 0
	)

onering.events.create(
	title: 'Houmm-arr-orghh',
	event_type: lightning,
	speaker: ent,
	duration: '2014-12-12 00:25:00',
	position: 0
	)

victory.events.create(
	title: 'A long way in the dunes',
	speaker: frodo,
	description: 'How to play piano, using only 9 fingers',
	event_type: topic,
	duration: '2014-12-12 01:00:00',
	position: 0
	)

victory.events.create(
	title: 'The Eagles',
	speaker: gandalf,
	description: 'Lightning, as a form of air defence',
	event_type: lightning,
	duration: '2014-12-12 01:30:00',
	position: 0
	)


#locations
pasternaka = Location.create(
	id: 1,
	place_type: 'Hotel',
	name: 'California',
	city: 'Lviv',
	address: 'Pasternaka 5',
	latitude: 49.8327337,
	longitude: 23.9992261,
	conference: onering
	)

sadova = Location.create(
	id: 2,
	place_type: 'Palace',
	name: 'Best',
	city: 'Lviv',
	address: 'Sadova 2a',
	latitude: 49.8210367,
	longitude: 23.9875698,
	conference: victory
	)


#contacts
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

admin = Admin.new
	admin.email = 'admin@example.com' 
    admin.username = 'admin' 
	admin.password = '00000000'
	admin.password_confirmation = '00000000'
	admin.role = 'administrator'
    admin.save!