# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/05"))

# Read input
input = File.open("./input.txt", "rb").read
# puts "input:#{input}"

def is_nice(string)
  puts 'no 3 vow'; return false unless /.*[aeiou].*[aeiou].*[aeiou].*/ =~ string # at least 3 vowels
  puts 'no twice'; return false unless /(\w)\1/ =~ string # letter that appears twice in a row
  puts 'has ugly'; return false unless /ab|cd|pq|xy/ =~ string # no ab, cd, pq, xy.
  return true
end

examples = ["ugknbfddgicrmopn","jchzalrnumimnmhp","haegwjzuvuyypxyu","dvszwmarrgswjxmb"]
examples.each do |ex|
  puts "#{ex} is nice: #{is_nice(ex)}"
end

=begin
nice_strings = 0
input.each_line do |str|
  if /[aeiou]{3,}/ =~ str and # at least 3 vowels
    /(\w)\1/ =~ str and # letter that appears twice in a row
    not /ab|cd|pq|xy/ =~ str # no ab, cd, pq, xy.
    puts str
    nice_strings += 1
  end
end

puts "\n#{nice_strings} strings are nice."
=end
