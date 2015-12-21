# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/20"))

# Read input
input = File.open("./input.txt", "rb").read

# ---

def factors(n)
  # Rustam A. Gasanov (http://stackoverflow.com/questions/3398159/all-factors-of-a-given-number)
  ((1..(n / 2.0).ceil).select { |i| n % i == 0 } + [n]).uniq
end

def calculate_gifts(house_num)
  house_gifts = 0
  factors(house_num).each { |elf| house_gifts += elf * 10 }
  # factors(house_num).each { |elf| house_gifts += elf * 10 }
  return house_gifts
end

=begin
puts "Welcome to the Losers' CLI! Meant for losers who only thought of brute force."
user_input = ''
while input != 'bye'
  print "Give a house number:"
  user_input = gets.chomp.to_i
  puts "House #{user_input} gets #{calculate_gifts(user_input)} gifts!"
=end

house_num = 0
latest_gifts = 0
input = input.to_i / 10
while (latest_gifts < input)
  house_num += 1
  latest_gifts = calculate_gifts(house_num)
  puts "House #{house_num} gets #{latest_gifts} gifts!" if house_num % 1000 == 0
  # Comment if-clause out for full experience
  puts "House #{house_num} gets #{latest_gifts} gifts!" if latest_gifts >= input.to_i
end
