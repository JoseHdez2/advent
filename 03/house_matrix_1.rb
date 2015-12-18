# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/03"))

# Read input
input = File.open("./input.txt", "rb").read
puts "input:#{input}"

x = 0; y = 0
visited = Hash.new(0)
visited[[0,0]] += 1
input.split('').each do |move|
  case(move)
  when '^'; y -= 1
  when 'v'; y += 1
  when '<'; x -= 1
  when '>'; x += 1
  end
  visited[[x,y]] += 1
end

puts "#{visited.length} houses receive at least one present."
