#if there is a zero in a row, then the whole row is zero, do in place, cannot make another array to solve

def make_zero(mat)
	#make a mark, if 0 if found in the first row or column, mark it
	rowZero = false	
	colZero = false
	#check row, [0][x]
	(0...arr[0].length).each do |i|
		if arr[0][i] == 0
			rowZero = true
			break
		end	
	end
	#check column, just the first one
	(0...arr.length).each do |i|
		if arr[i][0] == 0
			colZero = true
			break
		end	
	end
	#set 0 to first row
	(0...arr[0].length).each do |i|
		(1..arr[0].length).each do |j|
			arr[i][j] = 0
	
end
