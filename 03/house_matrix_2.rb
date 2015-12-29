# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/03"))

# Read input
input = File.open("./input.txt", "rb").read
# puts "input:#{input}"

santa_pos = {:x => 0, :y => 0}; robot_pos = {:x => 0, :y => 0}
x = 0; y = 0
visited = Hash.new(0); visited[[0,0]] += 2
turn = :robot
input.split('').each do |move|
  # Toggle turn
  turn = (turn == :santa)? :robot : :santa

  # Current position <= the guy whose turn it is.
  case(turn)
  when :santa; x = santa_pos[:x]; y = santa_pos[:y]
  when :robot; x = robot_pos[:x]; y = robot_pos[:y]
  end

  # Move
  case(move)
  when '^'; y -= 1
  when 'v'; y += 1
  when '<'; x -= 1
  when '>'; x += 1
  end

  # The guy whose turn it is <= current position.
  case(turn)
  when :santa; santa_pos[:x] = x; santa_pos[:y] = y
  when :robot; robot_pos[:x] = x; robot_pos[:y] = y
  end

  # Add one to the visited position.
  visited[[x,y]] += 1
end

visited.each { |k,v| p "key:#{k}, val:#{v}" }
puts "#{visited.length} houses receive at least one present."
