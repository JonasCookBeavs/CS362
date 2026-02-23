# Jonas Cook
# CS 362 Exercise 8: Intermediate Ruby

command_words =  { "noun" => "Cadillac", "verb" => "Accelerate", "adjective" => "Dark", "adverb" => "Confidently", "gerund" => "Grooving" }
command_counts = { "noun" => 2, "verb" => 2, "adjective" => 3, "adverb" => 2, "gerund" => 4 }
command_names = ["noun", "verb", "adjective", "adverb", "gerund"]
puts "Enter a command: " + command_names.join(' ')
selection = gets.chomp 
if command_names.include?(selection)
  speak = Proc.new { |x, a, b| x.times { print(a.capitalize() + ": " + b + "\n") } }
  speak.call(command_counts[selection], selection, command_words[selection])
end