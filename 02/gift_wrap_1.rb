# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/02"))

# Read input
input = File.open("./input.txt", "rb").read
puts "input:#{input}"

total_paper = 0
input.split("\n").each do |gift|
  gift = gift.split('x')
  l = gift[0].to_i
  w = gift[1].to_i
  h = gift[2].to_i
  lw = l * w; wh = w * h; hl = h * l
  smallest = [lw,wh,hl].min

  gift_paper = 2*lw + 2*wh + 2*hl + smallest

  total_paper += gift_paper
end
