
reports = []

File.readlines("input.txt").each do |line|
  reports << line.split(' ').map(&:to_i)
end

safes = 0
safes_with_damper = 0
reports.each do |report|
  direction = nil
  prev_level = nil
  bad_levels = 0
  report.each do |level|
    unless prev_level.nil?

      if prev_level == level
        bad_levels += 1
      elsif (prev_level - level).abs > 3
        bad_levels += 1
      else
        curr_direction = (prev_level - level) < 0 ? -1 : 1

        if direction.nil?
          direction = curr_direction
        elsif direction != curr_direction
          bad_levels += 1
        end
      end
    end

    prev_level = level
  end

  safes += bad_levels == 0 ? 1 : 0
  safes_with_damper += bad_levels <= 1 ? 1 : 0
end

puts "Part 1: #{safes}"
puts "Part 2: #{safes_with_damper}"
