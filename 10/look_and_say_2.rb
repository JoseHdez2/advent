# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/10"))

# Read input
input = File.open("./input.txt", "rb").read
output = File.open("./output.txt", "a+").read

# ---
input.strip!; #output.strip!

# R.I.P. CPU
(0...50).each do |i|
  if output.lines.length >= i+1 then input = output.lines[i]; puts "read line #{i}"; next end # Skip already-calculated values.

  puts i # puts input
  jackpot = [[input[0]]]
  input[1..input.size].split('').each do |d|
    if d == jackpot[-1][0] then jackpot[-1].push(d)
    else jackpot.push([d]) end
  end

  input = ''
  jackpot.each do |cluster|
    input += cluster.length.to_s + cluster[0]
  end
  output.write(input)
end

# puts input
puts input.length
