#given a 2d array, find the number of islands, which are made of vertical and horizontal 1's (not diagonal)

class Node
	
end
def island_num(arr)
	#need to know if 1 was visited or not, or i can just make it into a zero?
	#add to stack, end when loop through all elements
	row = arr.length
	col = arr[0].length
	stack = []
	(0...row).each do |r|
		(0...col).each do |c|
			if arr[r][c] == 1
				stack << [r,c]
				count += 1
				while !stack.empty?
					current = stack.pop
					cr = current[0]
					cc = current[1]
					if arr[cr+1][cc] == 1 || arr[cr-1][cc] == 1 || arr[cr][cc+1] == 1 || arr[cr][cc-1] == 1
					end
				end
			end
		end
	end
end

