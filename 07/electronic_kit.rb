# Go into folder
Dir.chdir(Dir.getwd.split("/advent")[0].concat("/advent/07"))

# Read input
input = File.open("./input.txt", "rb").read

# ---

wires = {}
input.each_line do |line|
  lhs, rhs = /(.*)->(.*)/.match(line.gsub('\s','')).captures
  if /^\d+$/ =~ lhs
    wires[rhs] = lhs.to_i # direct assignation
  else op1, opcode, op2 = /(.*?)(\w*)(.*)/.match(lhs).captures
    puts "rhs=#{rhs}"
    case(opcode)
    when 'NOT' then wires[rhs] = 0b1111111111111111 - wires[op2]
    when 'AND' then wires[rhs] = wires[op1] and wires[op2]
    when 'OR' then wires[rhs] = wires[op1] or wires[op2]
    when 'LSHIFT' then wires[rhs] = wires[op1] * (2 ** op2)
    when 'RSHIFT' then wires[rhs] = wires[op1] / (2 ** op2)
    end
  end
end

puts wires
