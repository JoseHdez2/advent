# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/06"))

# Read input
input = File.open("./input.txt", "rb").read

lights = Array.new(1000) { Array.new(1000,0) }

input.each_line do |order|
  to_do = /^[^\d]+/.match(order)[0].strip.gsub(' ','_').to_sym
  from, to = /(\d+,\d+).*?(\d+,\d+)/.match(order).captures
  from = from.split(','); from.each { |d| d = d.to_i }
  to = to.split(','); to.each { |d| d = d.to_i }

  val = 1 if to_do == :turn_on
  val = 0 if to_do == :turn_off
  val = :toggle if to_do == :toggle

  (from[0]..to[0]).each do |x|
    (from[1]..to[1]).each do |y|
      lights[x][y] = val if val != :toggle
      lights[x][y] = !lights[x][y] if val == :toggle
    end
  end
end

lit_lights = 0
(0..999).each do |x|
  (0..999).each do |y|
    lit_lights += 1 if lights[x][y] == 1
    if lights[x][y] then p 'o ' else p '. ' end
  end
  puts
end

puts "There are #{lit_lights} lit lights."
