# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/04"))

# Read input
input = File.open("./input.txt", "rb").read
puts "input:#{input}"

require 'digest'

# Compute digest by chunks

md5 = Digest::MD5.new
md5.update 'message1'
md5 << 'message2'                     # << is an alias for update


i = 0
while i < 10000000
  i += 1
  md5 = Digest::MD5.new
  md5.update input
  md5 << i.to_s                    # << is an alias for update

  out =  md5.hexdigest
  if (out[0..4] == '00000') then puts "good hash using number: #{i}" end
end
