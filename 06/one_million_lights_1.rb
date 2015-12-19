# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/06"))

# Read input
input = File.open("./input.txt", "rb").read

require 'matrix'

lights = Matrix.zero(1000)
puts lights

input.each_line do |order|
  to_do = /^[^\d]+/.match(order)[0].strip.gsub(' ','_').to_s
  from, to = /(\d+,\d+).*?(\d+,\d+)/.match(order).captures
  from = from.split(','); from.each { |d| d = d.to_i }
  to = to.split(','); to.each { |d| d = d.to_i }

  case(to_do)
  when :turn_on then turn_lights(from, to, true)
  when :turn_off then turn_lights(from, to, false)
  when :toggle then turn_lights(from, to, :toggle)
  end
end

lit_lights = 0
x = 0
while (x < 1000)
  y = 0
  while (y < 1000)
    if lights[x,y] then lit_lights += 1 end
    y += 1
  end
  x += 1
end

puts "There are #{lit_lights} lit lights."
