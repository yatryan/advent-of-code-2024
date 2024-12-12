file = "sample.txt"

matrix = []

File.readlines(File.join(__dir__, file)).each do |line|
  matrix << line.strip.split('')
end

def look_for_xmas(letters, x, y)
  return 0 if letters[y][x] != 'X'

  count = 0

  # Check North
  begin
    if letters[y-1][x] == 'M' && letters[y-2][x] == 'A' && letters[y-3][x] == 'S'
      count += 1
      puts "found north @ #{x},#{y}"
    end
  rescue
  end

  # Check Northeast
  begin
    if letters[y-1][x+1] == 'M' && letters[y-2][x+2] == 'A' && letters[y-3][x+3] == 'S'
      count += 1
      puts "found northeast @ #{x},#{y}"
    end
  rescue
  end

  # Check East
  begin
    if letters[y][x+1] == 'M' && letters[y][x+2] == 'A' && letters[y][x+3] == 'S'
      count += 1
      puts "found east @ #{x},#{y}"
    end
  rescue
  end

  # Check Southeast
  begin
    if letters[y+1][x+1] == 'M' && letters[y+2][x+2] == 'A' && letters[y+3][x+3] == 'S'
      count += 1
      puts "found south east @ #{x},#{y}"
    end
  rescue
  end

  # Check South
  begin
    if letters[y+1][x] == 'M' && letters[y+2][x] == 'A' && letters[y+3][x] == 'S'
      count += 1
      puts "found south @ #{x},#{y}"
    end
  rescue
  end

  # Check Southwest
  begin
    if letters[y+1][x-1] == 'M' && letters[y+2][x-2] == 'A' && letters[y+3][x-3] == 'S'
      count += 1
      puts "found soouthwest @ #{x},#{y}"
    end
  rescue
  end

  # Check West
  begin
    if letters[y][x-1] == 'M' && letters[y][x-2] == 'A' && letters[y][x-3] == 'S'
      count += 1
      puts "found west @ #{x},#{y}"
    end
  rescue
  end

  # Check Northwest
  begin
    if letters[y-1][x-1] == 'M' && letters[y-2][x-2] == 'A' && letters[y-3][x-3] == 'S'
      count += 1

      puts "found northwest @ #{x},#{y}"
    end
  rescue
  end

  count
end

total = 0
matrix.each_with_index do |row, i|
  row.each_with_index do |cell, j|
    # puts "#{cell} @ #{j} #{i} "
    total += look_for_xmas(matrix, j,i)
  end
end

puts total