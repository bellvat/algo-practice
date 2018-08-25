def add_diagonal(m)
  row_count = m.length - 1
  s = 0
  t = 0
  (0..row_count).each do |r|
	  s += m[0+r][0+r]
  end
  (0..row_count).each do |c|
	  t += m[0+c][row_count - c]
  end


  p (s-t).abs
end

m = [
	[1,2,4],
	[1,2,3],
	[1,2,3]
]

add_diagonal(m)
