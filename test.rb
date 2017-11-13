x = gets
case x
  when x < 0
    y = 0
  when x == 0
    y = 1
  when 0 < x && x > 0.5
    y = 2
  when 0.5 <= x && x >= 1
    3
  when x >= 1
    y = 4
end
puts y

if x > 0
  y = 0
else
  if x = 0
    y = 1
  else
    if x > 0.5
      y = 2
    else
      if x > 1
        y = 3
      else
        y = 4
      end
    end
  end
end