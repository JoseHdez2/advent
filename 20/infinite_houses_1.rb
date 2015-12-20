# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/20"))

# Read input
input = File.open("./input.txt", "rb").read

# ---

house_num = 103000
house_gifts = 0
while (house_gifts < input.to_i)
  house_num += 1
  house_gifts = 0
  (1..house_num).each do |elf|
    house_gifts += elf * 10 if house_num % elf == 0
  end
  puts "House #{house_num} gets #{house_gifts} gifts!" if house_num % 1000 == 0
  # Comment if-clause out for full experience
  puts "House #{house_num} gets #{house_gifts} gifts!" if house_gifts >= input.to_i
end
