# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/17"))

# Read input
input = File.open("./input.txt", "rb").read

# ---

jugs = []
input.each_line { |line| jugs.push(line.to_i) }

# Generate all combinations of an array, from a starting to an end size.
# Mostly stolen from StackOverflow, edited to remove permutations.
#combos = (0..jugs.length).flat_map{|size| jugs.combination(size).to_a }

# HIDEOUS LOW-LEVEL STYLE CODE because I am a bad programmer
c = '0'*jugs.length
lc = '1'*jugs.length
combos = []
while c != lc
  i = c.length-1
  while i >= 0
    case c[i]
    when 1; i--
    when 0; c[i] = 1; i++ break
    end
  end
  while i < c.length; c[i] = 0; i++ end

  i = 0
  a_combo = []
  while i < c.length
    case c[i]
    when 1; a_combo.push(jugs[i]); i++
    when 0; i++
    end
  end
  combos.push(a_combo)
end

combos.each { |c| print "#{c}\n" }

liters = 160

useful = 0
combos.each { |c| sum = 0; c.each { |e| sum += e }; useful += 1 if sum == liters }

puts "There are #{useful} possibilities."
