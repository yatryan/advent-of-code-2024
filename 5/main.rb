file = "input.txt"

rules = true
ordering_rules = []
possible_answers = []
incorrect_answers = []

File.readlines(File.join(__dir__, file)).each do |line|
  if line.strip.length == 0
    rules = false
    next
  end

  if rules
    ordering_rules << line.strip.split('|')
  else
    possible_answers << line.strip.split(',')
  end
end

total_a = 0

possible_answers.each do |answer|
  valid = true

  ordering_rules.each do |rule|
    next unless answer.include?(rule[0]) && answer.include?(rule[1])

    if answer.index(rule[0]) >= answer.index(rule[1])
      valid = false
      break
    end
  end

  if valid
    middle = answer.length / 2
    total_a += answer[middle].to_i
  else
    incorrect_answers << answer
  end
end

incorrect_answers.each do |answer|

end

puts "Part A: #{total_a}"