#years
year2012 = Year.create(
	name: 2012,
	content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ut est facilisis, laoreet orci nec, faucibus nisi. Maecenas tristique ipsum eu ultricies cursus. Etiam eu cursus urna. Maecenas consequat at elit sed consequat. Morbi consectetur fermentum ipsum sit amet accumsan. Etiam rutrum posuere finibus. Fusce ac orci metus. Sed augue urna, volutpat quis dapibus ut, egestas quis ex. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce rutrum bibendum quam, at rutrum sapien hendrerit non. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut congue nisi neque, mattis gravida nulla euismod ac. Praesent congue venenatis auctor. Phasellus interdum eleifend feugiat.',
	published: true
	)

year2013 = Year.create(
	name: 2013,
	content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ut est facilisis, laoreet orci nec, faucibus nisi. Maecenas tristique ipsum eu ultricies cursus. Etiam eu cursus urna. Maecenas consequat at elit sed consequat. Morbi consectetur fermentum ipsum sit amet accumsan. Etiam rutrum posuere finibus. Fusce ac orci metus. Sed augue urna, volutpat quis dapibus ut, egestas quis ex. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce rutrum bibendum quam, at rutrum sapien hendrerit non. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut congue nisi neque, mattis gravida nulla euismod ac. Praesent congue venenatis auctor. Phasellus interdum eleifend feugiat.',
	published: true
	)

year2014 = Year.create(
	name: 2014,
	content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ut est facilisis, laoreet orci nec, faucibus nisi. Maecenas tristique ipsum eu ultricies cursus. Etiam eu cursus urna. Maecenas consequat at elit sed consequat. Morbi consectetur fermentum ipsum sit amet accumsan. Etiam rutrum posuere finibus. Fusce ac orci metus. Sed augue urna, volutpat quis dapibus ut, egestas quis ex. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce rutrum bibendum quam, at rutrum sapien hendrerit non. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut congue nisi neque, mattis gravida nulla euismod ac. Praesent congue venenatis auctor. Phasellus interdum eleifend feugiat.',
	published: false
	)

year2015 = Year.create(
	name: 2015,
	content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ut est facilisis, laoreet orci nec, faucibus nisi. Maecenas tristique ipsum eu ultricies cursus. Etiam eu cursus urna. Maecenas consequat at elit sed consequat. Morbi consectetur fermentum ipsum sit amet accumsan. Etiam rutrum posuere finibus. Fusce ac orci metus. Sed augue urna, volutpat quis dapibus ut, egestas quis ex. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce rutrum bibendum quam, at rutrum sapien hendrerit non. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut congue nisi neque, mattis gravida nulla euismod ac. Praesent congue venenatis auctor. Phasellus interdum eleifend feugiat.',
	published: false
	)


#eventtypes
registration = EventType.create(
	name: 'registration',
	description: 'some description',
	defaultDuration: '2014-12-12 00:30:00',
	color: '#44ff44',
	image: '1',
	speakerEvent: false
	)

beerbreak = EventType.create(
	name: 'beer-break',
	description: 'ho ho ho',
	defaultDuration: '2014-12-12 03:00:00',
	color: '#666600',
	image: '0',
	speakerEvent: false
	)

topic = EventType.create(
	name: 'topic',
	description: 'some description',
	defaultDuration: '2014-12-12 01:00:00',
	color: '#222200',
	image: '3',
	speakerEvent: true
	)

lightning = EventType.create(
	name: 'lightning',
	description: 'some description',
	defaultDuration: '2014-12-12 00:45:00',
	color: '#ffff00',
	image: '2',
	speakerEvent: true
	)

groupLightning = EventType.create(
	name: 'group lightning',
	description: 'some description',
	defaultDuration: '2014-12-12 00:45:00',
	color: '#ffff00',
	image: '4',
	speakerEvent: true,
	groupable: 1
	)

#speakers
frodo = Speaker.create(
	name: 'Frodo',
	surname: 'Baggins',
	position: 'lucky pathfinder',
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
	position: 'sitting position',
	description: 'The bespactacled One',
	email: 'harrypotter@mail.com',
  facebook: 'fb/harrik',
  linkedin: 'Havrentiy Potter',
  site: 'http://potter-shop.com',
  photo_file_name: "colin_burns_144.jpg", 
  photo_content_type: "image/jpeg", 
  photo_file_size: 63840, 
  photo_updated_at: "2015-02-24 10:05:52"
	)

gandalf = Speaker.create(
	name: 'Gandalf',
	surname: 'Grey',
	position: 'An awl in the ass',
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

dima = Speaker.create(
	name: 'Dmytro',
	surname: 'Panov',
	position: 'SoftServe software engineer specialized on Ruby, JavaScript, Java, Oracle, PostgreSQL, etc.',
	description: 'Lv137 UI/Ruby expert', 
	photo_file_name: "zsssdads.png", 
	photo_content_type: "image/png", 
	photo_file_size: 131940, 
	photo_updated_at: "2015-02-26 19:41:39"
	)

ivan = Speaker.create(
	name: 'Ivan',
	surname: 'Chyr',
	position: 'Teacher Web UI direction',
	description: 'Responsibilities:
		+ coaching and mentoring of students
		+ development of new directions ( Ruby on Rails, Angular.js )
		+ teaching and training others
		+ managing student group project as scrum master and product owner', 
	photo_file_name: "358196a.jpg", 
	photo_content_type: "image/jpeg", 
	photo_file_size: 7632, 
	photo_updated_at: "2015-02-26 19:38:27"
	)

koldovsky = Speaker.create(
	name: 'Vyacheslav',
	surname: 'Koldovsky',
	position: 'Founder & CEO at Productivity Scientific',
	description: ' strong ', 
	photo_file_name: "064e28a.jpg", 
	photo_content_type: "image/jpeg", 
	photo_file_size: 2966, 
	photo_updated_at: "2015-02-26 19:40:02"
	)

gimli = Speaker.create(
	name: 'Gimli',
	surname: 'Grisli',
	position: 'chief dwarf',
	description: 'Gimli - chief dwarf. Head dwarf. A dwarf with capital D', 
	photo_file_name: "images_(1).jpg", 
	photo_content_type: "image/jpeg", 
	photo_file_size: 10267, 
	photo_updated_at: "2015-03-04 15:38:07"
	)

sam = Speaker.create(
	name: 'Samwise',
	surname: 'Gamgee',
	position: 'chef cook',
	description: 'Sam, just Sam', 
	photo_file_name: "sam.jpg", 
	photo_content_type: "image/jpeg", 
	photo_file_size: 156280, 
	photo_updated_at: "2015-03-04 15:39:50"
	)

ent = Speaker.create(
	name: 'Fangorn',
	surname: 'Ent',
	position: 'woodpeckers lover',
	description: 'Hum-hum-hum', 
	photo_file_name: "images.jpg", 
	photo_content_type: "image/jpeg", 
	photo_file_size: 6425, 
	photo_updated_at: "2015-03-04 15:34:40"
	)


#conferences
js2012 = Conference.create(
	published: true,
	name: 'JS',
	year: year2012,
	date: '2012-02-12',
	attenders: 12
	)
Conference.create(
	published: true,
	name: 'Java',
	year: year2012,
	date: '2012-05-22',
	attenders: 12
	)
Conference.create(
	published: true,
	name: 'LAMP',
	year: year2012,
	date: '2012-08-08',
	attenders: 12
	)
Conference.create(
	published: true,
	name: 'OPS',
	year: year2012,
	date: '2012-11-12',
	attenders: 12
	)

Conference.create(
	published: true,
	name: 'Java',
	year: year2013,
	date: '2013-01-12',
	attenders: 22
	)
cloud2013 = Conference.create(
	published: true,
	name: 'Cloud',
	year: year2013,
	date: '2013-06-29',
	attenders: 22
	)
Conference.create(
	published: false,
	name: 'Data',
	year: year2013,
	date: '2013-11-12',
	attenders: 22
	)

Conference.create(
	published: true,
	name: 'Mobile',
	year: year2014,
	date: '2014-05-12',
	attenders: 372
	)
Conference.create(
	published: true,
	name: 'Mobile',
	year: year2015,
	date: '2015-09-12',
	attenders: 100
	)
webui2014 = Conference.create(
	published: true,
	name: 'WebUI',
	year: year2014,
	date: '2014-09-12',
	attenders: 372
	)
victory = Conference.create(
	published: false,
	name: 'Java',
	year: year2014,
	date: '2014-12-12',
	attenders: 79
	)

onering = Conference.create(
	published: true,
	name: 'BigData',
	year: year2015,
	date: '2015-11-12',
	attenders: 72
	)


#events
Event.create(
	published: true,
	conference: onering,
	title: 'registration',
	event_type: registration,
	duration: '2014-12-12 00:45:00',
	position: 1,
	video: "https://www.youtube.com/watch?v=Rn3JnBizsZ4",
	responsable: 'somebody'
	)

Event.create(
	conference: onering,
	published: true,
	title: 'How i get the Ring. History of success',
	description: 'Evetything you need to know about One Ring,
				  but afffraid to ask',
	event_type: topic,
	speaker: frodo,
	duration: '2014-12-12 01:00:00',
	position: 2,
	video: "https://www.youtube.com/watch?v=2a4gyJsY0mc"
	)

Event.create(
	conference: onering,
	published: false,
	title: 'groupable 1',
	description: 'some',
	event_type: groupLightning,
	speaker: frodo,
	duration: '2014-12-12 01:00:00',
	position: 3
	)

Event.create(
	conference: onering,
	published: false,
	title: 'groupable 2',
	description: 'some',
	event_type: groupLightning,
	speaker: gandalf,
	duration: '2014-12-12 01:00:00',
	position: 3
	)

Event.create(
	conference: onering,
	published: false,
	title: 'groupable 3',
	description: 'some',
	event_type: groupLightning,
	speaker: gandalf,
	duration: '2014-12-12 01:00:00',
	position: 3
	)


Event.create(
	conference: onering,
	published: true,
	title: 'Beer-break',
	event_type: beerbreak,
	duration: '2014-12-12 01:30:00',
	position: 4,
	description: 'Relax, take it easy. For there is nothing that we can do. Relax, take it easy. Blame it on me or blame it on you',
	responsable: 'Zenyk'
	)

Event.create(
	conference: onering,
	published: true,
	title: 'The challenge for kamikaze',
	speaker: gandalf,
	description: 'When fatherland is calling you',
	event_type: topic,
	duration: '2014-12-12 01:00:00',
	position: 3,
	materials_file_name: "Advice_to_Japanese_kamikaze_pilots_during_the_second_world_war___World_news___The_Guardian.pdf",
	materials_content_type: "application/pdf",
	materials_file_size: 103086, 
	materials_updated_at: "2015-02-26 18:18:28"
	)

Event.create(
	conference: onering,
	published: false,
	title: 'How many orcs i\'ll kill',
	description: 'I was drinking at the bar last night, so I took
				  a bus home...That may not be a big deal to you,
				  but I\'ve never driven a bus before.',
	event_type: topic,
	speaker: gimli,
	duration: '2014-12-12 01:05:00',
	position: 5
	)

Event.create(
	conference: onering,
	published: true,
	title: 'Philosophical questions',
	description: 'How to cook yammy code. Long story with pictures',
	event_type: lightning,
	speaker: ivan,
	duration: '2014-12-12 00:15:00',
	position: 6
	)

Event.create(
	conference: onering,
	published: true,
	title: 'Storage via iSCSI',
	description: ' about project experience of usage iSCSI for storage data. What it is, why and how.',
	event_type: lightning,
	speaker: dima,
	duration: '2014-12-12 00:15:00',
	position: 7
	)

Event.create(
	conference: onering,
	published: false,
	title: '90% percent js everywhere',
	description: 'how to make your application without server-side',
	event_type: lightning,
	speaker: koldovsky,
	duration: '2014-12-12 00:15:00',
	position: 8
	)

Event.create(
	conference: onering,
	published: false,
	title: 'How to cook Gollum',
	description: 'awful dishes',
	event_type: topic,
	speaker: sam,
	duration: '2014-12-12 00:15:00',
	position: 9
	)

Event.create(
	conference: onering,
	published: true,
	title: 'Houmm-arr-orghh',
	event_type: topic,
	speaker: ent,
	duration: '2014-12-12 00:25:00',
	position: 10
	)

Event.create(
	conference: onering,
	published: true,
	title: 'Little man with great potential',
	description: 'History of the invention of the heel',
	event_type: lightning,
	speaker: frodo,
	duration: '2014-12-12 00:15:00',
	position: 11,
	video: "https://www.youtube.com/watch?v=8Uee_mcxvrw", 
	materials_file_name: "3_Ways_to_Walk_in_High_Heels_-_wikiHow.pdf", 
	materials_content_type: "application/pdf", 
	materials_file_size: 284407, 
	materials_updated_at: "2015-02-25 16:54:38"
	)

Event.create(
	conference: victory,
	published: true,
	title: 'A long way in the dunes',
	speaker: frodo,
	description: 'How to play piano, using only 9 fingers',
	event_type: topic,
	duration: '2014-12-12 01:00:00',
	position: 0
	)

Event.create(
	conference: victory,
	published: true,
	title: 'The Eagles',
	speaker: gandalf,
	description: 'Lightning, as a form of air defence',
	event_type: lightning,
	duration: '2014-12-12 01:30:00',
	position: 0
	)

Event.create(
	title: '2b || !2b',
	description: 'solve old problem',
	speaker: frodo,
	conference: js2012,
	event_type: topic,
	duration: '2014-12-12 01:30:00'
	) 

Event.create(
	title: 'What to do when your friend is magician',
	description: 'True story',
	speaker: frodo,
	conference: cloud2013,
	event_type: lightning,
	duration: '2014-12-12 00:15:00'
	)

Event.create(
	title: 'The last years of Middle-earth',
	description: 'When hazard is only reason to stay',
	speaker: frodo,
	conference: webui2014,
	event_type: topic,
	duration: '2014-12-12 01:00:00'
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
	conference: onering,
	how_to_find: 'Taxi: (0372) 585-111 or (050)-33-85-11,
				 (0372) 585-999 or (050) 338-99-99 
                 Trolleybus №3, №3а, №5 
                 Stop station: 141 Golovna str. “Bukovyna” hotel'
	)

sadova = Location.create(
	id: 2,
	place_type: 'Palace',
	name: 'Best',
	city: 'Lviv',
	address: 'Sadova 2a',
	latitude: 49.8210367,
	longitude: 23.9875698,
	conference: victory,
	how_to_find: 'Bus: 101 (get out on Zhukovskiy Street) 
                  Tram: 1 (across street from Railway Station) 
                  Stop station: Atrium, Karla Marksa Av., 22 '
	)


#contacts
vad = Contact.create(
	id: 1,
	name: 'Vad',
	surname: 'Kirdan',
	telephone: '0630620750',
	email: 'hog_dubno@gmail.com',
	skype: 'hog_dubno',
	)

uriy = Contact.create(
	id: 2,
	name: 'Uriy',
	surname: 'Gnat',
	telephone: '0630620751',
	email: 'gnat_zv@gmail.com',
	skype: 'gnat_zv',
	)

vova = Contact.create(
	id: 3,
	name: 'Vova',
	surname: 'Kamin',
	telephone: '0630750620',
	email: 'vova_lviv@gmail.com',
	skype: 'vova_lviv',
	)

andriy = Contact.create(
	id: 4,
	name: 'Andriy',
	surname: 'Lozuk',
	telephone: '0630750676',
	email: 'andr_loz@gmail.com',
	skype: 'andr_loz',
	)

first = Report.create(
	responsable: 'Vadym Kirdan',
	title: 'best conference ever',
	description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce commodo consectetur pretium. Vivamus rutrum viverra tortor quis blandit. Integer interdum urna sit amet eros maximus, quis tempor dolor tempus. Phasellus pharetra quis urna quis volutpat. Donec mauris massa, rutrum et suscipit sed, sagittis non nisi. Ut ac vulputate lectus. Proin turpis risus, lobortis et risus eu, fringilla dictum sapien. Integer ligula nisl, pulvinar sit amet rhoncus et, elementum et lacus. Aliquam id fringilla metus, ut placerat mi. Curabitur dignissim ligula vitae tempus imperdiet. Sed sit amet dolor vel velit ultrices pretium ut quis elit.
	Nam sagittis vestibulum pulvinar. Nulla eu tortor dapibus, dictum lacus at, bibendum ipsum. Donec vel aliquet urna. Maecenas pretium nulla nec lacus faucibus varius. Nam faucibus odio urna, vulputate commodo orci egestas vel. Nullam imperdiet, quam feugiat feugiat laoreet, odio orci mattis mi, vel accumsan odio nibh consectetur dui. Nulla at nisl vel velit euismod maximus vitae at libero. Etiam id magna in orci consectetur rutrum. Ut malesuada, ante a consectetur scelerisque, nunc nisl sagittis turpis, vel sodales tellus nisi non diam.
	Cras sed sapien molestie dolor iaculis posuere ac nec ligula. Nulla imperdiet ex at magna ultricies efficitur. Praesent sit amet augue in ex laoreet condimentum. Nam maximus nisl eu elementum faucibus. Nunc facilisis, nisl a mollis porta, ipsum mauris pellentesque elit, vitae convallis arcu risus a sem. Morbi fermentum ac tellus a lobortis. Vestibulum aliquam sollicitudin cursus. Integer condimentum viverra elit, a sodales nulla luctus ullamcorper.
	Curabitur porttitor faucibus eros eget euismod. Sed efficitur aliquam ante. Etiam volutpat non turpis at bibendum. Quisque suscipit cursus accumsan. In non maximus ex, eu porta risus. Proin tincidunt pellentesque auctor. Etiam a metus nec ante tincidunt eleifend. Cras porta vitae augue ullamcorper bibendum. Proin quis laoreet erat. Duis iaculis venenatis nisi vel hendrerit. Curabitur ac hendrerit augue.
	Phasellus luctus scelerisque euismod. Praesent blandit tempor est id faucibus. Fusce varius porta erat non dictum. Maecenas nec molestie nunc, at iaculis ex. Pellentesque id risus lacus. Proin tincidunt metus a vulputate bibendum. Phasellus vitae pellentesque orci. Aenean pharetra sem purus, at placerat augue placerat sed. Phasellus eu lobortis metus. Nulla in ipsum magna.',
	video: 'https://youtube.com',
	photo: 'https://facebook.com',
	conference: victory
	)

sadova.contacts << vad
sadova.contacts << andriy
pasternaka.contacts << uriy
pasternaka.contacts << vova
pasternaka.contacts << vad

#Message
msg = Message.create(
	content: 'Hi! You are invited for registration to the conference at our site! Your link is $${link_invitation} Enjoy!',
	version: 1,
	name: first
	)

admin = Admin.new
	admin.email = 'admin@example.com' 
  admin.username = 'admin' 
	admin.password = '00000000'
	admin.password_confirmation = '00000000'
	admin.role = 'Admin'
  admin.save!
