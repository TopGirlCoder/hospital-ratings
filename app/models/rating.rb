class Rating < ActiveRecord::Base
	# Remember to create a migration!
	belongs_to :user
	belongs_to :hospital

	def average_scores
		##sums the stars and divide by the number of stars to get average
	end
end
