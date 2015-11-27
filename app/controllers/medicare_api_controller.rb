get '/medicare' do
 response = HTTParty.get('https://data.medicare.gov/resource/77hc-ibv8.json')

 # puts response.body, response.code, response.message, response.headers.inspect
p response.body
# p response.code
# p response.message
# p response.headers.inspect
 # response.code.find_by(city: "San Francisco")
 #.where(measure_id: "HAI_2_SIR")
end
