5.times do
	user = User.create!(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email,
		password: 123456
		)
	hospital = Hospital.create(
 		name: Faker::Company.bs,
 		location: Faker::Address.city
 		)
	2.times do
		rating = Rating.create!(
		stars: rand(0..5),
		hospital_id: rand(1..5),
		user_id: rand(1..5)
		)
	end
end
		# rating = user.ratings.create!(
		# stars: rand(0..5),
		# hospital_id: rand(1..5)
		# )
