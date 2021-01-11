require "tty-prompt"

prompt = TTY::Prompt.new
name = prompt.ask("What is your name?", default: ENV["USER"])
if name == "Michelle"
  puts "Hey, Michelle!"
else
  puts "Hey, you..."
end

