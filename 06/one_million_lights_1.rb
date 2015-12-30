# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/06"))

# Read input
# input = File.open("./input.txt", "rb").read
input = File.open("./dummy.txt", "rb").read

# 1000x1000 matrix of integers
# lights = Array.new(1000) { Array.new(1000,0) }
lights = Array.new(8) { Array.new(8,0) }

# puts lights

input.each_line do |order|
  to_do = /^[^\d]+/.match(order)[0].strip
  from, to = /(\d+,\d+).*?(\d+,\d+)/.match(order).captures
  from = from.split(',').map { |e| e.to_i }
  to = to.split(',').map { |e| e.to_i }

  p "from:#{from} to:#{to} to_do:#{to_do}"

  (from[0]..to[0]).each do |x|
    (from[1]..to[1]).each do |y|
      lights[x][y] = 0 if to_do == "turn off"
      lights[x][y] = 1 if to_do == "turn on"

      # Toggle if instruction is "toggle"
      if to_do == "toggle"
        lights[x][y] = 0 if lights[x][y] == 1
        lights[x][y] = 1 if lights[x][y] == 0
      end
    end
  end

  puts lights
end

lit_lights = 0
# str = ""
(0..999).each do |x|
  (0..999).each do |y|
    lit_lights += 1 if lights[x][y] == 1
    # if lights[x][y] then str += 'o ' else str += '. ' end
  end
  # str += "\n"
end
# puts str

puts "There are #{lit_lights} lit lights."
