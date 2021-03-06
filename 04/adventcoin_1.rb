# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/04"))

# Read input
input = File.open("./input.txt", "rb").read
puts "input:#{input}"

require 'digest'

def show_md5(inp)
  puts "#{inp} -->(MD5)--> #{Digest::MD5.hexdigest(inp)}"
end

# Example values
show_md5("abcdef609043")
show_md5("abcdef609043")
show_md5("pqrstuv1048970")

def solve_md5(inp)
  out = Digest::MD5.new.hexdigest(inp)
  if out[0..4] == '00000' then
    puts "#{inp} -->(MD5)--> #{out}"; return true end
  return false
end

puts "True solution(s):"
input = input.strip   # Problem I caused myself.
(0..1000000).each do |i|
  break if solve_md5(input.strip + i.to_s)
end
