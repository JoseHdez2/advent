# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/09"))

# Read input
input = File.open("./input.txt", "rb").read

# ---

# Read distances into hash.
distances = {}
input.each_line do |line|
  from, to, cost = /(\w+) to (\w+) = (\d+)/.match(line).captures
  # puts "from: #{from}, to: #{to}, cost: #{cost}"
  distances[[from, to]] = cost
end

# Induce unique locations
locations = []
distances.keys.each { |k| k.each { |l| locations.push(l) } }
locations.uniq!
puts locations
