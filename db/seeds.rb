# require 'ffaker'
require 'csv'

CSV.foreach("#{Rails.root}/lib/data/airportcodes.csv", headers: false) do |row|
    city = row[0].split(',')
    existing_location = Location.find_by(city: city[0].downcase)

    if existing_location
        existing_location.airports.create!(code: row[1])
    else
        location = Location.new(city: city[0].downcase, country: city[1])
        Airport.create!(code: row[1], location: location)
    end
end

CSV.foreach("#{Rails.root}/lib/data/airlatlng.csv", headers: false) do |row|

  if Airport.find_by(code: row[4]) != nil
    airport = Airport.find_by(code: row[4])

    lat = row[6].to_f
    long = row[7].to_f
    airport.location.update(lat: lat, lng: long)
  end
end

@array = ["I'm new to this and thought it would be a nice way to meet oversees traveler. I've recently taken to traveling myself, and have been to Egypt, China, Alaska, London, Frankfurt, among others. Please have a look at the space and feel free to ask any questions!" , "I'm a designer and athlete who has a knack for catching things when they fall. I have an eye for detail so close that I spot hairs in food. I like designing web sites and thinking about how to make interactive experiences fun and memorable. The designers Charles and Ray Eames are my heros" , "Global design nomad, writer, humanitarian, editor, creator, and part-time baker. Founder of Project H Design, a nonprofit that connects the power of design to the people who need it most, and the places where it can make a real and lasting difference." , "I enjoy traveling, cooking and playing scrabble." , "Fun loving, open minded, easy going. I enjoy people and animals, especially my boxers Dublin and Zoe." , "Traveling geek, software developer and startup guy." , "I'm a journalist / teacher / music producer and technologist. I work in music and visual technology, doing a lot of travel in order to share skills." , "I am from the United States and I am teach English to international students at the local community college and university in Boulder, Colorado. I love to travel and it has been a dream of mine for a long time to visit Venice. I finally get the opportunity and I am very excited. In my free-time, I like to read books, go to museums, take small hikes and just relax and enjoy the scene." , "I'm from St. Louis, Missouri. I'm a liberal intellectual who likes indie rock. Professionally, I'm a personality researcher." , "I am a Design Researcher. I love technology culture, Media and design. The first novel I ever read was Made in Japan by Akio Morita when I was 16 (late starter!), followed by John Grisham's legal thrillers ( pretty much fiction I ever read!). Originally trained as an architect, in India I have worked in the fields of spatial design, animation and product design. After coming to US, I have worked in fields of nanotechnology and Personalized Medicine focusing on user-centered design and hold a graduate degree in Design Research from Arizona State University. In my spare time I enjoy cooking, traveling and watching 60 minutes, TED talks etc. On a lighter side I enjoy Seinfeld, Two and a Half Men, Bollywood movies and travel/food shows such as Anthony Bourdain's No Reservations." , "I'm passionate about food, music, books, and writing useful and beautiful software. I love exploring new places by veering off the beaten path, and getting as much of the local experience as possible." , "An easygoing traveler who enjoys seeing remote corners of the world.", "Sou extrovertida, gosto de conhecer e receber pessoas. Sou Terapeuta holística e professora de produção cultural. Se for de seu gosto podemos planejar bons programas junto à natureza nessa iluminada Ilha da Magia ou mesmo desfrutar de eventos culturais." , "We live in a beautiful 400 year old stone house surrounded by fields, peaceful roads and villages. I am a retired teacher but travel to London a lot - 65 minutes by train. I love history and literature and also enjoy gardening and visiting gardens. We love travelling and in the past year have visited Mexico's Copper Canyon, Cuba's Humboldt National Park and Iceland's second largest glacier - Iceland is an amazing place to visit. We also discovered the Welsh coast in Pembrokeshire last summer and really enjoyed it. I love cooking and swapping recipes with friends. Lincolnshire has some great local food and farmers' markets. I believe you only get out of life what you put into it." , "I'm a keen biker and can recommend some excellent circular routes, as twisty as you like, to any bikers staying at Hogstow Mill. It's amazing how empty the roads can be around here - if you know which ones to take.If you enjoy gardening, then spend some time in the grounds looking at the flower beds, fruit and bog gardens. Watch out for kingfishers and dippers on the brook. One of the things my partner and I enjoy is a good pub and we know most if not all in the area and can recommend or even take you to our favourites - there's all kinds in the area, and the nearby village of Bishops Castle has two breweries and six pubs!" , "Retired, but always busy! Easy going, enjoys a bit of running, gardening, arts and crafts. Married to Tom who is also retired. Loves walking, but has a terrible sense of direction ... it's all part of the fun! Enjoys travel, and wants to do more ..It's never too late ... I look forward to welcoming you to my home, please feel free to contact me if you have any questions regarding my listing." , "I have lived here in this fantastic valley for over ten years with my husband and three children. We all enjoy being outside with our dogs and horses and look forward to having you to stay in 'The Shed' so you can enjoy the stunning views as well." , "I am an energetic and outgoing person and love being in the outdoors, preferably up the side of a mountain! I love cycling, swimming, fell-walking - and reading at the end of a busy day.I've lived in the Lake District for 20 years now, and haven't once tired of the breathtaking views from the house. My husband and I have travelled all over the world, and love exploring new places and cultures independently, with our rucksacks on our backs. We really enjoy meeting people of all ages.We have recently become grandparents for the first time and are thoroughly enjoying the time we spend with our little grandson who has bewitched us." , "I'm an Architect who works in the City. I renovated this apartment in Potts Point. If you have any questions about the area I'd be happy to answer them!" , "Hi, Im Wes, l was raised in Tugun along with my family, l love the place, the people and the location. With my work in wildlife management l travel and work throughout Australia, though Tugun is home and where l like to get back to. Have general interests from the environment to art in all formats and the beach. Have travelled extensively, predominantly throughout South East Asia, enjoy the culture and family values along with the diverse wildlife and habitats of the region, with the region being so close l will continue to do so when the opportunities arise." , "I have recently started to travel and enjoying the experiences immensely! Love walking, reading and meeting new friends." , "About me - I am a 31 year old female working full time in Education, training Early Childhood at a private college. I am also studying a dual degree in Education and Human Services. I have recently relocated from Queensland to Canberra and I am looking forward to exploring what Canberra has on offer and meeting new people. I enjoy trying new things and spending as much time as I can outdoors." , "I'm a creative technologist and academic from London. My wife is from Belgium (French speaking). She is a French teacher in a local school. We moved to Sydney in 2011, and love it here, especially the creative arts scene. But we also love travelling in Europe. We look forward to welcoming you to our new home." , "I live in Sydney part of the week and Canberra the other part, I like to have one toe in the ocean and one in the lake! The two cities are very different, Canberra is better for pure air and water - our tap water has to be sampled wine connoisseur fashion - sip by sip - to be truly appreciated! I like to sail out to Spinnaker island sometimes when I'm in Canberra in one of the tiny 2 person yachts you'll see around the shores of the yacht club - I prefer that island because, while I'm looking like I'm exercising, I've secretly got a stash of sausages and pre-sliced onions ready to throw on the gas BBQ on the island once I set foot on it! Far from prying eyes, it's an excellent spot for a family outing with limited competition for the lawn space - you have to be travelling by kayak, be a long distance swimmer or other aquatic entrepreneur to reach this wonderfully rewarding spot!." , "Hey my name is Niels , I have been travelling for about 14 years with Nokia around the world. During my assignments, I always had to live and stay at hotels , with no opportunity to facilitate my two sons 5 + 8 and my wife in a nice apartment.In 2011, I decide to re-sign from Nokia and start up my own company. My aim is to help people being facilitated in apartments instead of hotels around the world hence I believe business travellers and project assigned people would perform much better, if our kids and family have the opportunity to stay with us while being on the go.My favourite destinations are Australia, Scandinavia and Eastern Europe. My goal is to create value add and support you being well facilitated in a handful of serviced apartments, that we feel is super wow. I hope our listings will bring great value add to you , as we spend almost 3 years to source the best facilities around the world. Due to lot of demand, there is also a small team in place to provide support and help during your arrangements." , "I love film/tv, golf, art Italy and red wine. I have travelled overseas a bit and thanks to some interesting jobs, lived in a few capital cities in Australia." , "I am nearing retirement and working for a government agency. In past years, I might have been called a rolling stone, having holidayed and worked in Europe, the Middle East and the USA, as well as in Australia. I enjoy traveling, meeting people, making new friends, going to the theatre, classical music, tennis & reading. Lately, I have had cruising holidays with my father.I will be your caring host! Recently, I have hosted some of the many Australians and international students who come to Canberra. I relish the family atmosphere..My guests/students often enjoy a a good meal or a glass of wine with me, and I am more than happy to show you around the immediate area, Canberra sights and plan or even go on day trips!" , "Hi happy to provide info on local cafes, great walks and the best the area has to offer. Non intrusive host, on site in Canberra at Studio Q and available by phone email for Newtown Mews." , "Down to earth guy, easy to get along with. I like sport, photography and travel. Have two children and enjoy keeping fit."]

guides = 200.times.map do |n|
 username = Faker::Internet.user_name
 username = "#{username}_#{n}"
 User.create! ({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: username,
    age: rand(18..60),
    email: Faker::Internet.email,
    password: "password",
    bio: @array.sample,
    guide: true,
    location_id: Location.all.sample.id
    })
end



# users = 20.times.map do
#   User.create!({
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     username: Faker::Internet.user_name,
#     age: rand(18..60),
#     email: Faker::Internet.email,
#     password: "password",
#     bio: Faker::HipsterIpsum.paragraph,
#     })
# end

# trips = 10.times.map do
#   Trip.create!({
#     origin: Location.all.sample,
#     destination: Location.all.sample,
#     start_at: Faker::Time.date,
#     end_at: Faker::Time.date,
#     description: Faker::HipsterIpsum.paragraph,
#     user_id: users.sample.id
#     })
# end

# travelers = 30.times.map do
#   Traveler.create!({
#     user_id: users.sample.id,
#     trip_id: trips.sample.id
#     })
# end


# search_results = 5.times.map do
#   SearchResult.create!({
#     user_id: users.sample.id,
#     budget: 1500,
#     start_at: Faker::Time.date,
#     })
# end

# 20.times.map do
#   SearchResultLocation.create!({
#     search_result_id: search_results.sample.id,
#     location_id: Location.all.sample.id
#     })
# end

# messageable = [trips, users].flatten
# 40.times.map do
#   messageable.sample.messages.create!(title: Faker::Lorem.word,content: Faker::HipsterIpsum.paragraph,wrote_at: Faker::Time.date, creator_id: users.sample.id,)
# end

# messages = 10.times.map do
#     Message.create!({
#         title: Faker::Lorem.word,
#         content: Faker::HipsterIpsum.paragraph,
#         wrote_at: Faker::Time.date,
#         creator_id: users.sample.id,
#         recipient_id: users.sample.id
#         })
# end



