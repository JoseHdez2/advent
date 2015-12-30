# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/06"))

# Read input
# input = File.open("./input.txt", "rb").read

class LightMatrix
  attr_accessor :matrix
  attr_reader :x, :y

  def initialize(x, y)
    @x = x; @y = y
    @matrix = Array.new(y) { Array.new(x,0) }
  end

  def main_process(input)
    input.each_line { |line| read_order(line); do_order }
  end

  def read_order(input_line)
    @to_do = /^[^\d]+/.match(input_line)[0].strip
    from, to = /(\d+,\d+).*?(\d+,\d+)/.match(input_line).captures
    @from = from.split(',').map { |e| e.to_i }
    @to = to.split(',').map { |e| e.to_i }

    p "from:#{@from} to:#{@to} to_do:#{@to_do}"
  end

  def do_order
    x1 = @from[0]; x2 = @to[0]; y1 = @from[1]; y2 = @to[1] #aliases
    case(@to_do)
    when "toggle"; (x1..x2).each { |x| (y1..y2).each { |y| @matrix[x][y] = (@matrix[x][y] == 0) ? 1 : 0 }}
    when "turn off"; (x1..x2).each { |x| (y1..y2).each { |y| @matrix[x][y] = 0 }}
    when "turn on"; (x1..x2).each { |x| (y1..y2).each { |y| @matrix[x][y] = 1 }}
    end
    # puts self
  end

  def to_s
    str = ""
    (0...@y).each { |y| (0...@x).each { |x| str += "#{@matrix[x][y]} " }; str += "\n" }
    str
  end

  def count_lights
    count = 0
    (0...@y).each { |y| (0...@x).each { |x| count += 1 if @matrix[x][y] == 1 } }
    count
  end
end

# input = File.open("./dummy.txt", "rb").read; lights = LightMatrix.new(8,8)
input = File.open("./input.txt", "rb").read; lights = LightMatrix.new(1000,1000)

lights.main_process(input) # puts lights

puts "There are #{lights.count_lights} lit lights."
