require 'yahoo_weatherman'
client = Weatherman::Client.new
puts "Enter your zipcode: "
zippy = gets 
weather = client.lookup_by_location(zippy)

weather.forecasts.each do |i|
	weekday = i['date']
	weekday = weekday.strftime('%w')
	now = Date.today.strftime("%w")
	now = now.to_i
	tomorrow = now + 1
	low = i['low'].to_i
	flow = (low * 1.8 + 32).to_i
	high = i['high'].to_i
	fhigh = (high * 1.8 +32).to_i
	
	
	if(weekday == now.to_s)
		puts "Today is going to be " + i['text'].downcase + " with a low of #{flow} and a high of #{fhigh} "  
	
	elsif(weekday == tomorrow.to_s) 
		puts 'Tomorrow is going to be ' + i['text'].downcase + " with a low of #{flow} and a high of #{fhigh} "
	elsif
		puts i['day'].to_s + ' is going to be ' + i['text'].downcase + " with a low of #{flow} and a high of #{fhigh} "
	end
end