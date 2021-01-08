require "http"

system "clear"
puts "Welcome to the awesome Weather App!"
puts "Type the name of a city:"
city = gets.chomp

response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&units=imperial&APPID=YOURAPIKEY")

weather_data = response.parse

temp = weather_data["main"]["temp"]
description = weather_data["weather"][0]["description"]

puts "Today in #{city} it is #{temp} degrees outside with #{description}."