# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/10"))

# Read input
input = File.open("./input.txt", "rb").read

# ---
input.strip!

(0...40).each do |i|
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
end

# puts input
puts input.length
