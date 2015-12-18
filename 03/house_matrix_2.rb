# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/03"))

# Read input
input = File.open("./input.txt", "rb").read
puts "input:#{input}"

sanPos = [0,0]; robPos = [0,0]
visited = Hash.new(0)
visited[[0,0]] += 2
turn = :santa
input.split('').each do |move|
  turn = (turn == :santa)? :robo : :santa
  curPos = (turn == :santa)? sanPos : robPos
  case(move)
  when '^'; curPos[1] -= 1  # y -= 1
  when 'v'; curPos[1] += 1  # y += 1
  when '<'; curPos[0] -= 1  # x -= 1
  when '>'; curPos[0] += 1  # x += 1
  end
  if turn == :santa then sanPos = curPos else robPos = curPos end
  visited[curPos] += 1
end

puts "#{visited.length} houses receive at least one present."
