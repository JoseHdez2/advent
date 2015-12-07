
# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/01"))

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
  if (floor == -1) then puts char_num end
end
puts floor

# act = {'(' => 1, ')' => -1}
