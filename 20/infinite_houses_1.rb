# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/20"))

# Read input
input = File.open("./input.txt", "rb").read

# ---

def calculate_gifts(house_num)
  house_gifts = 0
  (1..house_num).each do |elf|
    house_gifts += elf * 10 if house_num % elf == 0
  end
  return house_gifts
end

puts "Welcome to the Losers' CLI! Meant for losers who only thought of brute force."
user_input = ''
while input != 'bye'
  print "Give a house number:"
  user_input = gets.chomp.to_i
  puts "House #{user_input} gets #{calculate_gifts(user_input)} gifts!"
end

=begin
house_num = 103000
latest_gifts = 0
while (latest_gifts < input.to_i)
  house_num += 1
  house_gifts = 0
  puts "House #{house_num} gets #{house_gifts} gifts!" if house_num % 1000 == 0
  # Comment if-clause out for full experience
  puts "House #{house_num} gets #{house_gifts} gifts!" if house_gifts >= input.to_i
end
=end
