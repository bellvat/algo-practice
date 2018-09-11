#children standing in line, must give candy to each child
#each child has a ranking, the child right higher ranking must have more candy than child with lower ranking
#relationship between candy problem and water problem
#
def min_candy(arr)
	candies = Array.new(arr.length)
	candies[0] = 1

	#left to right
	(1...arr.length).each do |i|
		if arr[i] > arr[i-1]
			candies[i] = candies[i-1] + 1
		else
			candies[i] = 1
		end
		p "left #{candies}"
	end

	result = candies[arr.length-1]

	(arr.length-2).downto(0) do |i|
		cur = 1
		if arr[i] > arr[i+1]
			cur = candies[i+1] + 1
		end
		p "right #{candies}"
		p "cur #{cur} vs candy #{candies[i]}"
		result += [cur, candies[i]].max
		candies[i] = cur
		p "cur right #{candies}"
	end
	return result
end

p min_candy([4,5,3,4,5])
