data = File.read("input.txt")

total = 0
do_total = 0

doing = true
dont_index = nil
do_index = nil

loop do
  match_data = data.match(/mul\((\d{1,3}),(\d{1,3})\)/)
  dont_index = data.index("don't()")
  do_index = data.index("do()")
  break if match_data.nil? || match_data.captures.empty?

  mul_total = match_data.captures.map(&:to_i).inject(:*)
  total += mul_total

  if doing
    # We should be doing
    if dont_index.nil? || data.index(match_data[0]) < dont_index
      # we good
    else
      doing = false
    end
  else
    # Check to see if we should be doing.
    if !do_index.nil? && data.index(match_data[0]) > do_index
      doing = true

    end
  end

  do_total += mul_total if doing

  new_index = data.index(match_data[0]) + match_data[0].length
  data = data.slice!(new_index...data.length)
end

puts "Part 1: #{total}"
puts "Part 2: #{do_total}"
