require "http"

system "clear"
puts "Welcome to the Dictionary App!"

while true
  puts "What word would you like to know more about?:"
  word = gets.chomp

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=YOURAPIKEY")
  definitions = response.parse
  definitions.each do |definition|
    if definition["text"]
      puts "The definition is: #{definition["text"]}"
      break
    end
  end

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=YOURAPIKEY")
  top_example = response.parse
  puts "The top example is: #{top_example["text"]}"

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=YOURAPIKEY")
  pronunciations = response.parse
  pronunciations.each do |pronunciation|
    if pronunciation["raw"]
      puts "The pronunciation is: #{pronunciation["raw"]}"
      break
    end
  end

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/audio?useCanonical=false&limit=50&api_key=YOURAPIKEY")
  audios = response.parse
  audios.each do |audio|
    if audio["fileUrl"]
      system("open", audio["fileUrl"])
      break
    end
  end

  puts "Enter q to quit, or any other key to continue"
  user_input = gets.chomp
  if user_input == "q"
    puts "Thanks, bye!"
    break
  end
end