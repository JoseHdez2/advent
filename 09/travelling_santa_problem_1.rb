# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/09"))

# Read input
input = File.open("./input.txt", "rb").read

# ---

# Read distances into hash.
distances = Hash.new(Float::INFINITY)
input.each_line do |line|
  from, to, cost = /(\w+) to (\w+) = (\d+)/.match(line).captures
  # puts "from: #{from}, to: #{to}, cost: #{cost}"
  distances[[from, to]] = cost.to_i
end

# Induce unique locations
locations = []
distances.keys.each { |k| k.each { |l| locations.push(l) } }
locations.uniq!
puts locations

min_tour_cost = Float::INFINITY
# Try all possible permutations of locations
locations.permutation do |tour|
  tour_cost = 0
  (1...tour.length).each do |i|
    from = tour[i-1]; to = tour[i]
    tour_cost += distances[[from,to]]
  end
  puts "tour: #{tour}, cost: #{tour_cost}" if tour_cost < Float::INFINITY

   min_tour_cost = tour_cost if (tour_cost < min_tour_cost)
end

puts "Cost of shortest tour is #{min_tour_cost}."
