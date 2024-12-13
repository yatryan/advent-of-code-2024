file = "input.txt"

equations = []

File.readlines(File.join(__dir__, file)).each do |line|
  answer, numbers = line.strip.split(':')
  equations << {
    answer: answer.to_i,
    numbers: numbers.split(' ').map(&:to_i)
  }
end

total_calibration = 0

def test_calc(answer, current, numbers)
  return answer == current if numbers.count.zero?

  cur_num = numbers.shift

  # check plus
  plus_answer = test_calc(answer, current + cur_num, numbers.dup)
  return true if plus_answer

  # check multiply
  mutl_answer = test_calc(answer, current * cur_num, numbers.dup)
  return true if mutl_answer

  # check concat (Part 2)
  concat_answer = test_calc(answer, "#{current}#{cur_num}".to_i, numbers.dup)
  return true if concat_answer

  false
end

equations.each do |equation|

  is_valid = test_calc(equation[:answer], 0, equation[:numbers])

  total_calibration += equation[:answer] if is_valid
end


puts total_calibration
