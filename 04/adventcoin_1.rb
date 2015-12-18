# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/04"))

# Read input
input = File.open("./input.txt", "rb").read
puts "input:#{input}"

require 'digest'

def show_md5(input)
  puts "#{input} -->(MD5)--> #{Digest::MD5.new.hexdigest(input)}"
end

# Example values
show_md5("abcdef609043")
show_md5("abcdef609043")
show_md5("pqrstuv104897") # wrong output and I have no idea why.

=begin
i = 0
while i < 10000000
  i += 1
  md5_in = input + i.to_s
  md5_out = Digest::MD5.hexdigest (input+i.to_s)
  # md5 = Digest::MD5.new
  # md5.update input
  # md5 << input + i.to_s                    # << is an alias for update

  # out =  md5.hexdigest
  if (md5_out[0..4] == '00000') then puts "good hash using number: #{i}\n\t #{md5_in} gives #{md5_out}" end
end
=end
