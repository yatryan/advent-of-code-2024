file = "sample.txt"

equations = []

File.readlines(File.join(__dir__, file)).each do |line|
  answer, numbers = line.strip.split(':')
  equations << {
    answer: answer.to_i,
    numbers: numbers.split(' ').map(&:to_i)
  }
end