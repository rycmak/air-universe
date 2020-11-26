# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

Booking.destroy_all
Galaxy.destroy_all
User.destroy_all

# Grab JSON using NASA's APOD API
# Example request: response = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&count=5"
# Parse JSON to get keys
# Relevant keys: date, explanation (= description), title, url (image)
# Dates with good galaxy images:
# 2020-05-10 (Porpoise), 2018-05-23, 2019-11-27/2013-07-28 (Hoags), 2018-12-23/2019-09-09 (Andromeda), 2019-01-01, 2019-04-27, 2019-12-01, 2019-12-31 (Triangulum), 2020-05-15, 2016-12-18 (Cartwheel), 2016-04-20 (Einstein Ring), 2016-04-26 (Spiral), 2016-02-21 (Cigar Galaxy with supergalactic wind), 2012-04-12 (collision), 1999-11-25 (x-ray red), 2006-07-04 (Centaurus), 2006-06-12 (edge), 2005-10-22 (Ring), 2004-06-01 (Starburst), 2000-12-04 (Circinus - colourful), 2000-07-24 (Whirlpool with twin)


user_names = ["Lando Calrissian", "Leia Organa", "Han Solo", "Lyra Erso", "Boba Fett", "C3 PO", "R2 D2", "Kylo Ren", "Rune Haako", "Rose Tico", "Maz Kanata", "Saw Gerrera", "Asajj Ventress", "Obi-wan Kenobi", "Sheev Palpatine", "Nute Gunray"]

# Use NASA's APOD API to retrieve images and info about galaxies
# response = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=#{date}"
# Selected dates for API calls:
dates = %w[2019-09-09 2019-12-31 2020-05-10 2019-11-27 2019-01-01 2016-12-18 2016-04-26 2000-07-24 2005-10-22 2004-06-01 2000-12-04 2020-02-19 2019-04-27 2020-05-15 2012-08-12 2006-07-04]

# Results:
galaxy_names = ["Andromeda",
"Triangulum",
"Porpoise",
"Hoag's Object: A Nearly Perfect Ring Galaxy",
"Sombrero",
"Cartwheel",
"NGC 6872: A Stretched Spiral Galaxy",        
"Whirlpool",
"Ring Galaxy AM 0644-741",        
"Starburst Galaxy (with Supergalactic Wind)",
"Circinus",
"UGC 12591: Fastest Rotating Galaxy Known",
"The Galaxy, the Jet, and the Black Hole",
"Galaxy Wars: M81 and M82",
"NGC 4038: Spiral Galaxy in Collision",
"Elliptical Galaxy Centaurus A"]

galaxy_descriptions = ["How far can you see? The most distant object easily visible to the unaided eye is M31, the great Andromeda Galaxy, over two million light-years away.  Without a telescope, even this immense spiral galaxy appears as an unremarkable, faint, nebulous cloud in the constellation Andromeda.  But a bright yellow nucleus, dark winding dust lanes, luminous blue spiral arms, and bright red emission nebulas are recorded in this stunning six-hour telescopic digital mosaic of our closest major galactic neighbor.  While even casual skygazers are now inspired by the knowledge that there are many distant galaxies like M31, astronomers seriously debated this fundamental concept only 100 years ago.  Were these spiral nebulae simply outlying gas clouds in our own Milky Way Galaxy or were they island universes -- distant galaxies of stars comparable to the Milky Way itself?  This question was central to the famous Shapley-Curtis debate of 1920, which was later resolved by observations favoring Andromeda being just like our Milky Way Galaxy -- a conclusion making the rest of the universe much more vast than many had ever imagined.",
"The small, northern constellation Triangulum harbors this magnificent face-on spiral galaxy, M33. Its popular names include the Pinwheel Galaxy or just the Triangulum Galaxy. M33 is over 50,000 light-years in diameter, third largest in the Local Group of galaxies after the Andromeda Galaxy (M31), and our own Milky Way. About 3 million light-years from the Milky Way, M33 is itself thought to be a satellite of the Andromeda Galaxy and astronomers in these two galaxies would likely have spectacular views of each other's grand spiral star systems. As for the view from planet Earth, this sharp image shows off M33's blue star clusters and pinkish star forming regions along the galaxy's loosely wound spiral arms. In fact, the cavernous NGC 604 is the brightest star forming region, seen here at about the 7 o'clock position from the galaxy center. Like M31, M33's population of well-measured variable stars have helped make this nearby spiral a cosmic yardstick for establishing the distance scale of the Universe.",
"What's happening to this spiral galaxy? Just a few hundred million years ago, NGC 2936, the upper of the two large galaxies shown, was likely a normal spiral galaxy -- spinning, creating stars -- and minding its own business. But then it got too close to the massive elliptical galaxy NGC 2937 below and took a dive. Dubbed the Porpoise Galaxy for its iconic shape, NGC 2936 is not only being deflected but also being distorted by the close gravitational interaction. A burst of young blue stars forms the nose of the porpoise toward the right of the upper galaxy, while the center of the spiral appears as an eye.  Alternatively, the galaxy pair, together known as Arp 142, look to some like a penguin protecting an egg. Either way, intricate dark dust lanes and bright blue star streams trail the troubled galaxy to the lower right. The featured re-processed image showing Arp 142 in unprecedented detail was taken by the Hubble Space Telescope last year. Arp 142 lies about 300 million light years away toward the constellation, coincidently, of the Water Snake (Hydra). In a billion years or so the two galaxies will likely merge into one larger galaxy.",
"Is this one galaxy or two?  This question came to light in 1950 when astronomer Arthur Hoag chanced upon this unusual extragalactic object.  On the outside is a ring dominated by bright blue stars, while near the center lies a ball of much redder stars that are likely much older.  Between the two is a gap that appears almost completely dark.  How Hoag's Object formed, including its nearly perfectly round ring of stars and gas, remains unknown.  Genesis hypotheses include a galaxy collision billions of years ago and the gravitational effect of a central bar that has since vanished. The featured photo was taken by the Hubble Space Telescope and recently reprocessed using an artificially intelligent de-noising algorithm.  Observations in radio waves indicate that Hoag's Object has not accreted a smaller galaxy in the past billion years.  Hoag's Object spans about 100,000 light years and lies about 600 million light years away toward the constellation of the Snake (Serpens).  Many galaxies far in the distance are visible toward the right, while coincidentally, visible in the gap at about seven o'clock, is another but more distant ring galaxy.",
"This floating ring is the size of a galaxy.  In fact, it is a galaxy -- or at least part of one: the photogenic Sombrero Galaxy, one of the largest galaxies in the nearby Virgo Cluster of Galaxies.  The dark band of dust that obscures the mid-section of the Sombrero Galaxy in optical light actually glows brightly in infrared light.  The featured image, digitally sharpened, shows the infrared glow, recently recorded by the orbiting Spitzer Space Telescope, superposed in false-color on an existing image taken by NASA's Hubble Space Telescope in optical light. The Sombrero Galaxy, also known as M104, spans about 50,000 light years across and lies 28 million light years away.  M104 can be seen with a small telescope in the direction of the constellation Virgo.",
"To some, it looks like the wheel of a cart. In fact, because of its outward oval appearance, the presence of a central galaxy, and their connection with what looks like the spokes of a wheel, the galaxy on the right is known as the Cartwheel Galaxy. To others, however, it looks like a complicated interaction between galaxies awaiting explanation. Along with the two galaxies on the left, the Cartwheel is part of a group of galaxies about 400 million light years away in the constellation Sculptor.  The large galaxy's rim spans over 100,000 light years and is composed of star forming regions filled with extremely bright and massive stars.  Pictured, the Cartwheel's ring-like shape is the result of gravitational disruption caused by a smaller galaxy passing through a large one, compressing the interstellar gas and dust and causing a star formation wave to move out like a ripple across the surface of a pond.",
"What makes this spiral galaxy so long?  Measuring over 700,000 light years across from top to bottom, NGC 6872, also known as the Condor galaxy, is one of the most elongated  barred spiral galaxies known.  The galaxy's protracted shape likely results from its continuing collision with the smaller galaxy IC 4970, visible just above center. Of particular interest is NGC 6872's spiral arm on the upper left, as pictured here, which exhibits an unusually high amount of blue star forming regions.  The light we see today left these colliding giants before the days of the dinosaurs, about 300 million years ago.  NGC 6872 is visible with a small telescope toward the constellation of the Peacock (Pavo).",
"The Whirlpool Galaxy is a classic spiral galaxy.  At only 23 million light years distant and fully 65 thousand light years across, M51, also known as NGC 5194, is one of the brightest and most picturesque galaxies on the sky.  The smaller galaxy appearing here below and to the left is well behind M51, as can be inferred by the dust in a foreground spiral arm blocking light from this smaller galaxy.  The Whirlpool, pictured above, is visible with binoculars in the constellation of Canes Venaciti.  M51 is a spiral galaxy of type Sc and is the dominant member of a whole group of galaxies.  Astronomers speculate that M51's spiral structure is primarily due to its gravitational interaction with this smaller galaxy.",
"How could a galaxy become shaped like a ring? The rim of the blue galaxy pictured on the right is an immense ring-like structure 150,000 light years in diameter composed of newly formed, extremely bright, massive stars.  That galaxy, AM 0644-741, is known as a  ring galaxy and was caused by an immense galaxy collision.  When galaxies collide, they pass through each other -- their individual stars rarely come into contact.  The ring-like shape is the result of the gravitational disruption caused by an entire small intruder galaxy passing through a large one.  When this happens, interstellar gas and dust become condensed, causing a wave of star formation to move out from the impact point like a ripple across the surface of a pond.  The intruder galaxy has since moved out of the frame taken by the Hubble Space Telescope and released to commemorate the anniversary of Hubble's launch in 1990.  Ring galaxy AM 0644-741 lies about 300 million light years away.",
"Star formation occurs at a faster pace in M82 -- a galaxy with about ten times the rate of massive star birth (and death) compared to our Milky Way.  Winds from massive stars and blasts from supernova explosions have created a billowing cloud of expanding gas from this remarkable starburst galaxy.  The above scientifically color-coded image highlights the complexity and origin of the plume by combining a wide field image from the WIYN Telescope in Arizona with a smaller high-resolution image from the orbiting Hubble Space Telescope.  M82's aspect in optical pictures has led to its popular moniker, the Cigar Galaxy.  M82's burst of star formation was likely triggered a mere 100 million years ago in the latest of a series of bouts with neighboring large galaxy M81.",
"Powerful forces are at play in the nearby Circinus Galaxy.  Hot gas, colored pink, is being ejected out of the spiral galaxy from the central region.  Much of Circinus' tumultuous gas, however, is concentrated in two rings.  The outer ring, located about 700 light-years from the center, appears mostly red and is home to tremendous bursts of star formation.  A previously unseen inner ring, inside the green disk above, is visible only 130 light years from the center on this recently released, representative color image taken by the Hubble Space Telescope.  At the very center is an active galactic nucleus, where matter glows brightly before likely spiraling into a massive black hole.  Although only 15 million light years distant, the Circinus Galaxy went unnoticed until 25 years ago because it is so obscured by material in the plane of our own Galaxy.  The galaxy can be seen with a small telescope, however, in the constellation of Circinus.",
"Why does this galaxy spin so fast?  To start, even identifying which type of galaxy UGC 12591 is difficult -- featured on the lower left, it has dark dust lanes like a spiral galaxy but a large diffuse bulge of stars like a lenticular. Surprisingly observations show that UGC 12591 spins at about 480 km/sec, almost twice as fast as our Milky Way, and the fastest rotation rate yet measured.  The mass needed to hold together a galaxy spinning this fast is several times the mass of our Milky Way Galaxy. Progenitor scenarios for UGC 12591 include slow growth by accreting ambient matter, or rapid growth through a recent galaxy collision or collisions -- future observations may tell.  The light we see today from UGC 12591 left about 400 million years ago, when trees were first developing on Earth.",
"Bright elliptical galaxy Messier 87 (M87) is home to the supermassive black hole captured by planet Earth's Event Horizon Telescope in the first ever image of a black hole. Giant of the Virgo galaxy cluster about 55 million light-years away, M87 is the large galaxy rendered in blue hues in this infrared image from the Spitzer Space telescope.  Though M87 appears mostly featureless and cloud-like, the Spitzer image does record details of relativistic jets blasting from the galaxy's central region. Shown in the inset at top right, the jets themselves span thousands of light-years. The brighter jet seen on the right is approaching and close to our line of sight. Opposite, the shock created by the otherwise unseen receding jet lights up a fainter arc of material. Inset at bottom right, the historic black hole image is shown in context, at the center of giant galaxy and relativistic jets. Completely unresolved in the Spitzer image, the supermassive black hole surrounded by infalling material is the source of the enormous energy driving the relativistic jets from the center of active galaxy M87.",
"These two galaxies are far far away, 12 million light-years distant toward the northern constellation of the Great Bear. On the left, with grand spiral arms and bright yellow core is spiral galaxy M81, some 100,000 light-years across.  On the right marked by red gas and dust clouds, is irregular galaxy M82.  The pair have been locked in gravitational combat for a billion years. Gravity from each galaxy has profoundly affected the other during a series of cosmic close encounters.  Their last go-round lasted about 100 million years and likely raised density waves rippling around M81, resulting in the richness of M81's spiral arms.  M82 was left with violent star forming regions and colliding gas clouds so energetic the galaxy glows in X-rays.  In the next few billion years, their continuing gravitational encounters will result in a merger, and a single galaxy will remain.",
"This galaxy is having a bad millennium.  In fact, the past 100 million years haven't been so good, and probably the next billion or so will be quite tumultuous.  Visible on the upper left, NGC 4038 used to be a normal spiral galaxy, minding its own business, until NGC 4039, toward its right, crashed into it.  The evolving wreckage, known famously as the Antennae, is pictured above.  As gravity restructures each galaxy, clouds of gas slam into each other, bright blue knots of stars form, massive stars form and explode, and brown filaments of dust are strewn about.  Eventually the two galaxies will converge into one larger spiral galaxy. Such collisions are not unusual, and even our own Milky Way Galaxy has undergone several in the past and is predicted to collide with our neighboring Andromeda Galaxy in a few billion years. The frames that compose this image were taken by the orbiting Hubble Space Telescope by professional astronomers to better understand galaxy collisions. These frames -- and many other deep space images from Hubble -- have since been made public, allowing an interested amateur to download and process them into this visually stunning composite.",
"Why is peculiar galaxy Centaurus A so dusty?  Dramatic dust lanes that run across the galaxy's center mark Cen A.  These dust lanes are so thick they almost completely obscure the galaxy's center in visible light.  This is particularly unusual as Cen A's red stars and round shape are characteristic of a giant elliptical galaxy, a galaxy type usually low in dark dust.  Cen A, also known as NGC 5128, is also unusual compared to an average elliptical galaxy because it contains a higher proportion of young blue stars and is a very strong source of radio emission.  Evidence indicates that Cen A is likely the result of the collision of two normal galaxies.  During the collision, many young stars were formed, but details of the creation of Cen A's unusual dust belts are still being researched.  Cen A lies only 13 million light years away, making it the closest active galaxy.  Cen A, pictured above, spans 60,000 light years and can be seen with binoculars toward the constellation of Centaurus."]

photo_paths = ["1_M31_Abolfath_960.jpg",
"2_M33-HaLRGB-RayLiao1024.jpg",
"3_PorpoiseGalaxy_HubbleFraile_960.jpg",
"4_Hoag_HubbleBlanco_1080.jpg",
"5_sombrero_spitzer_1080.jpg",
"6_Cartwheel_Hubble_960.jpg",
"7_ngc6872_EsoSchmidt_960.jpg",
"8_m51_noao.jpg",
"9_ringam2_hst.jpg",
"10_m82_hstwiyn.jpg",
"11_circinus_hst.jpg",
"12_UGC12951_HubbleShatz_960.jpg",
"13_pia23122c-16_1067.jpg",
"14_M81-82_1024.jpg",
"15_ngc4038_russell_960.jpg",
"16_cenA_cfht.jpg"]

puts "Creating users..."
user_names.each do |user|
  first_name = user.split[0]
  last_name = user.split[1]
  User.create(first_name: first_name, last_name: last_name, email: "#{first_name}.#{last_name}@universe.com", password: "password")  
end
puts "Done creating users"

puts "Creating galaxies..."
galaxy_names.each_with_index do |galaxy, index|
  galaxy = Galaxy.create!(name: galaxy_names[index], description: galaxy_descriptions[index], rate: rand(500) + 500, owner: User.all.sample)
  galaxy.photo.attach(io: open("app/assets/images/galaxies/#{photo_paths[index]}"), filename: "galaxy_#{index + 1}.jpg", content_type: 'image/jpg')
end
puts "Done creating galaxies"

puts "Creating bookings..."
11.times do
  booking = Booking.create(customer: User.all.sample, start_date: Time.now, end_date: (Time.now + rand(500_000)), galaxy: Galaxy.all.sample)
end
puts "Done creating bookings"
