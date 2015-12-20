# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/09"))

# Read input
input = File.open("./example.txt", "rb").read

# ---

require 'set'

# Read explicit distances into hash.
map = Hash.new(Float::INFINITY)
input.each_line do |line|
  from, to, cost = /(\w+) to (\w+) = (\d+)/.match(line).captures
  # puts "from: #{from}, to: #{to}, cost: #{cost}"
  map[[from, to]] = cost.to_i
end

# Induce unique locations
locations = Set.new []
map.keys.each { |k| k.each { |l| locations.add(l) } }
puts locations

# Distances hash, to contain explicit and implicit distances
distances = map

# Distance of a node to itself is 0 (at least in this problem).
locations.each { |l| distances[[l,l]] = 0 }

# Given a node, return its neighboring nodes
# For Dijkstra algorithm coming up
def neighbors(node_name, dists)
  neighs = []
  dists.keys.each do |k|
    neighs.push(k) if k.contains(node_name)
  end
  return neighs.flatten.delete(node_name)
end

# Get implicit and update explicit distances using Dijkstra
locations.each do |start_node|
  locations.each do |end_node|
    unvisited = locations
    while(not unvisited.empty?)
      # Evaluated node will be closest unvisited node
      closest_unvisited = nil
      unvisited.each do |uv|
        if distances[[start_node,uv]] < distances[[start_node,closest_unvisited]]
        then closest_unvisited = uv end
      end
      cur_node = closest_unvisited
      neighbors(cur_node, map).each do |n|
        comparison = [distances[start_node,n]] # Old distance
        comparison.push(distances[start_node,cur_node]+distances[cur_node,n]) # New distance
        distances[start_node,n] = comparison.min
      end
      unvisited.delete(cur_node)
    end
  end
end

# Coulda used the matrix algorithm but w/e.

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
