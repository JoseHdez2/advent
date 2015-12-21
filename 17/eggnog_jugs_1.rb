# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/17"))

# Read input
input = File.open("./input.txt", "rb").read

# ---

jugs = []
input.each_line { |line| jugs.push(line.to_i) }

# Generate all combinations of an array, from a starting to an end size.
# Mostly stolen from StackOverflow, edited to remove permutations.
combos = (0..jugs.length).flat_map{|size| jugs.combination(size).sort.to_a }
combos.uniq!

liters = 160

useful = 0
combos.each { |c| sum = 0; c.each { |e| sum += e }; useful += 1 if sum == liters }

puts "There are #{useful} possibilities."
