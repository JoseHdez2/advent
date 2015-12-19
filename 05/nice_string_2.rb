# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/05"))

# Read input
input = File.open("./input.txt", "rb").read
# puts "input:#{input}"

def is_nice(string)
  return false unless /(\w)(\w).*\1\2/ =~ string # pair appearing twice
  return false unless /(\w).\1/ =~ string # repeating letter with 1 letter in between.
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
