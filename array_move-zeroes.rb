#need to move zeroes to the end of the array, while keeping the rest of the order

def move(nums)
	#like bubble sort? temp and move? if 0, then swap?
	#where do i start? at the end? like insertion sort
	n = nums.length - 1
	m = n
	n.downto(0) do |i|
		if nums[i] == 0
			j = i
			while j < m
				nums[j] = nums[j+1]
				nums[j+1] = 0
				j += 1
			end
			m -= 1
		end
	end
	return nums
end

move([1,0,2,3,0,4,0])
