file = "input.txt"

map = []

File.readlines(File.join(__dir__, file)).each do |line|
  map << line.strip.split('')
end

current_x, current_y = nil, nil

map.each_with_index do |row, y|
  row.each_with_index do |cell, x|
    current_x, current_y = x, y if %w[^ < > v].include?(cell)
  end
end

count = 0
loop do
  next_x, next_y = current_x, current_y
  # Move
  case map[current_y][current_x]
  when '^'
    # up
    next_y = current_y - 1
  when '>'
    # right
    next_x = current_x + 1
  when 'v'
    # down
    next_y = current_y + 1
  when '<'
    # left
    next_x = current_x - 1
  end

  if next_y >= map.size || next_y < 0 || next_x >= map[next_y].size || next_x < 0
    map[current_y][current_x] = 'X'
    break
  end

  # Confirm next space is ok
  case map[next_y][next_x]
  when '#'
    # Rotate Right
    case map[current_y][current_x]
    when '^'
      # up
      map[current_y][current_x] = '>'
    when '>'
      # right
      map[current_y][current_x] = 'v'
    when 'v'
      # down
      map[current_y][current_x] = '<'
    when '<'
      # left
      map[current_y][current_x] = '^'
    end
  else
    current_mark = map[current_y][current_x]
    map[current_y][current_x] = 'X'
    map[next_y][next_x] = current_mark
    current_x, current_y = next_x, next_y
  end

  count += 1
  if count > 20000
    puts "this might be taking too long"
    break
  end
end

total_a = map.map do |row|
  row.select { |cell| cell == 'X' }.count
end.sum

puts "Part A: #{total_a}"