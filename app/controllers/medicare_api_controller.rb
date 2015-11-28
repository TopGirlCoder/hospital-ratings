get '/medicare' do
 response = HTTParty.get('https://data.medicare.gov/resource/y7ru-x2zm.json?city=SAN%20FRANCISCO')

# p response
puts response.body, response.code, response.message, response.headers.inspect
# puts response.body
# @hospitals = array of hashes
@sf_hospitals =[]
@medicare_hospitals = JSON.parse(response.body)

@medicare_hospitals.each do |hospital|
  if hospital["measure_id"] == "HAI_2_SIR"
    @sf_hospitals<<hospital
    # @location = hospital["address"][""]
  end
end

p @sf_hospitals
erb :hospitals
# puts response.code
# p response.message
# p response.headers.inspect
 # response.body[0].where(city: "San Francisco")
 # data_string = response.body
 #.where(measure_id: "HAI_2_SIR")
end
