# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/02"))

# Read input
input = File.open("./input.txt", "rb").read
puts "input:#{input}"

total_paper = 0
input.split("\n").each do |gift|
  smallest = 9001
  gift_paper = 0
  gift.split('x').each do |dim|
    dim = dim.to_i
    if dim < smallest; smallest = dim end  # Update smallest dim if needed.
    if (gift_paper != 0); gift *= dim;
    else gift_paper += dim; end
  end
  gift_paper += smallest  # Add the smallest dimension for slack.
  total_paper += gift_paper
end
puts "The elves need #{total_paper} square feet of wrapping paper."
