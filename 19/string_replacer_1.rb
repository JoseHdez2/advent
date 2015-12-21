# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/19"))

# Read input
input = File.open("./input.txt", "rb").read

# ---

# Interpret input
repl = Hash.new([])
molecule = ''
input.each_line do |line|
  if /.*=>.*/.match(line) then
    from, to = /(\w+) => (\w+)/.match(line).captures
    repl[from] = repl[from].push(to)
  elsif /\s+/.match(line) then next
  else molecule = line end
end

puts repl
puts molecule
