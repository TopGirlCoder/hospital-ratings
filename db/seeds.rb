5.times do
	user = User.create!(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email,
		password: 123456
		)
end
		# rating = user.ratings.create!(
		# stars: rand(0..5),
		# hospital_id: rand(1..5)
		# )

hospital1 = Hospital.create(
{name: 'KAISER FOUNDATION HOSPITAL - SOUTH SAN FRANCISCO',
address: '1200 EL CAMINO REAL, SOUTH SAN FRANCISCO, CA 94080',
catheter_score: '0.711',
location: '37.657535, -122.437658'})

hospital2 = Hospital.create(
{name: "ST MARY'S MEDICAL CENTER",
address: "450 STANYAN ST, SAN FRANCISCO, CA 94117",
catheter_score: "0.000",
location: "37.773859, -122.454498"})

hospital3 = Hospital.create(
	{name: "KAISER FOUNDATION HOSPITAL - SAN FRANCISCO",
address: "2425 GEARY BLVD, SAN FRANCISCO, CA 94115",
catheter_score: "1.028",
location: "37.782741, -122.443564"})


hospital4 = Hospital.create(
	{name: "CALIFORNIA PACIFIC MEDICAL CTR-DAVIES CAMPUS HOSP",
address: "601 DUBOCE AVE, SAN FRANCISCO, CA 94117",
catheter_score: "4.684",
location: "37.769114, -122.434706"})


hospital5 = Hospital.create(
	{name: "SAN FRANCISCO GENERAL HOSPITAL",
address: "1001 POTRERO AVENUE, SAN FRANCISCO, CA 94110",
catheter_score: "0.913",
location: "37.756171, -122.406608"})


hospital6 = Hospital.create(
{name: "CALIFORNIA PACIFIC MEDICAL CTR-PACIFIC CAMPUS HOSP",
address: "2333 BUCHANAN STREET, SAN FRANCISCO CA 94115",
catheter_score: "3.127",
location: "37.791188, -122.43096"})


hospital7 = Hospital.create(
{name: "SAINT FRANCIS MEMORIAL HOSPITAL",
address: "2900 HYDE ST, SAN FRANCISCO, CA 94109",
catheter_score: "1.069",
location: "37.789561, -122.417112"})

hospital8 = Hospital.create(
{name: "LAGUNA HONDA HOSPITAL & REHABILITATION CENTER",
address: "375 LAGUNA HONDA BLVD, SAN FRANCISCO, CA 94116",
catheter_score: "1.069",
location: "37.74755, -122.458778"})


2.times do
		rating = Rating.create!(
		score: rand(0..5),
		hospital_id: rand(1..5),
		user_id: rand(1..5)
		)
end
