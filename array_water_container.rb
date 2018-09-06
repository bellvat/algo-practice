#given an array, with each element being the height of a block, each block being 1 unit wide, find the amount of water the array can hold

def water(arr)
	right = Array.new(arr.length) 
	left = Array.new(arr.length) 
	n = arr.length
	water = 0

	left[0] = arr[0]
	(1...arr.length).each do |i|
		left[i] = [left[i-1], arr[i]].max
		puts "left array #{left}"
	end
	right[n-1] = arr[n-1]
	(n-2).downto(0) do |i|
		right[i] = [right[i+1], arr[i]].max
		puts "right array #{right}"
	end

	(0...n).each do |i|
		water += [left[i],right[i]].min - arr[i]
		puts "water  #{water} #{left[i]} right #{right[i]} elem #{arr[i]}"
	end

	return water

end

puts water([0,1,0,2,1,0,1,3,2,1,2,1])
