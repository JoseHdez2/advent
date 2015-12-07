
# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/01"))

# Read input
input = File.open("./input.txt", "rb").read
puts "input:#{input}"

floor = 0
char_num = 0
input.split('').each do |c|
  if (c == '(')
    floor += 1
  elsif (c == ')')
    floor -= 1
  else
    puts "?:#{c}"
  end
  char_num += 1
  if (floor == -1) then puts "Santa enters basement at #{char_num}." end
end
puts "Santa arrives at floor #{floor}."

# act = {'(' => 1, ')' => -1}
