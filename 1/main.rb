
inputA = []
inputB = []

File.readlines("input.txt").each do |line|
  valA, valB = line.split(" ").compact.map(&:to_i)
  inputA << valA
  inputB << valB
end

# Sort
inputA.sort!
inputB.sort!

sum = inputA.map.with_index do |valA, idx|
  (valA - inputB[idx]).abs
end.sum

puts "Part 1: #{sum}"

singularity = inputA.map do |valA|
  valA * (inputB.select { |valB| valB == valA }.count)
end.sum

puts "Part 2: #{singularity}"