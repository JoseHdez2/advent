# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/05"))

# Read input
input = File.open("./input.txt", "rb").read
# puts "input:#{input}"

def is_nice(string)
  return false unless /.*[aeiou].*[aeiou].*[aeiou].*/ =~ string # at least 3 vowels
  return false unless /(\w)\1/ =~ string # letter that appears twice in a row
  return false if /(ab|cd|pq|xy)/ =~ string # no ab, cd, pq, xy.
  return true
end

nice_strings = 0
input.each_line do |str|
  if is_nice(str)
    puts str
    nice_strings += 1
  end
end

puts "\n#{nice_strings} strings are nice."
